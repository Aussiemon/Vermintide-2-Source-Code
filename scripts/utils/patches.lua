if rawget(_G, "G_GAME_PATCHES_RUN") then
	return
end

rawset(_G, "G_GAME_PATCHES_RUN", true)

if not rawget(_G, "G_IS_PROFILING") and PLATFORM == "win32" and BUILD ~= "release" then
	local tostring = tostring

	rawset(_G, "G_unit_information", rawget(_G, "G_unit_information") or {})

	local wrapped_tostring = tostring
	local World_spawn_unit = World.spawn_unit
	local World_destroy_unit = World.destroy_unit

	World.spawn_unit = function (world, unit_name, pos, rot)
		local unit = World_spawn_unit(world, unit_name, pos, rot)
		G_unit_information[unit] = wrapped_tostring(unit)

		return unit
	end

	function unitaux_register_unit_info(unit)
		G_unit_information[unit] = tostring(unit)
	end

	local Unit_alive = Unit.alive

	function unit_alive_info(unit)
		return tostring(G_unit_information[unit])
	end

	local function to_map(t)
		local r = {}

		for _, v in ipairs(t) do
			r[v] = true
		end

		return r
	end

	local exclude_from_patching = to_map({
		"alive",
		"is_valid",
		"remove_decal",
		"material_id",
		"resource_name_hash",
		"set_frozen",
		"is_frozen"
	})

	for function_name, org_func in pairs(Unit) do
		repeat
			if exclude_from_patching[function_name] then
				break
			end

			Unit[function_name] = function (unit, ...)
				if unit == nil then
					local args = ""
					local num_args = select("#", ...)

					for i = 1, num_args, 1 do
						local arg_value = select(i, ...)
						local arg_value_str = tostring(arg_value)
						args = string.format("%s %s", args, arg_value_str)
					end

					assert(false, "Tried to access function '%s' for nil unit!", function_name)
				end

				local is_alive = Unit_alive(unit)

				if is_alive then
					return org_func(unit, ...)
				end

				local err_unit = unit_alive_info(unit)
				local is_valid = (Unit.is_valid and Unit.is_valid(unit)) or "unknown"
				local is_frozen = Unit.is_frozen(unit)
				local go_id = (Managers.state and Managers.state.storage and Managers.state.storage.map_goid_to_unit[unit]) or "unknown"
				local args = ""
				local num_args = select("#", ...)

				for i = 1, num_args, 1 do
					local arg_value = select(i, ...)
					local arg_value_str = tostring(arg_value)
					args = string.format("%s %s", args, arg_value_str)
				end

				printf("ARGS: %s", args)
				assert(false, sprintf("[unit_deleted] tried to access function '%s' for deleted unit(%s)!", function_name, err_unit))
			end
		until true
	end

	function tostring(...)
		return wrapped_tostring(...)
	end
end

if not ANIMATION_HAS_VARIABLE_OVERRIDDEN then
	local old_animation_has_variable = Unit.animation_has_variable

	Unit.animation_has_variable = function (...)
		local ret = old_animation_has_variable(...)

		return (ret or 0) ~= 0
	end

	ANIMATION_HAS_VARIABLE_OVERRIDDEN = true
end

return
