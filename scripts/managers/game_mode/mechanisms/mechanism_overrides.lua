-- chunkname: @scripts/managers/game_mode/mechanisms/mechanism_overrides.lua

MechanismOverrides = MechanismOverrides or {}
MechanismOverrides.NIL = MechanismOverrides.NIL or {}
MechanismOverrides.CACHE = MechanismOverrides.CACHE or {}
MechanismOverrides.TEMP_CACHE = MechanismOverrides.TEMP_CACHE or {}
MechanismOverrides.CACHED_MECHANISM = MechanismOverrides.CACHED_MECHANISM or {}

local CACHE = MechanismOverrides.CACHE
local CACHED_MECHANISM = MechanismOverrides.CACHED_MECHANISM
local TEMP_CACHE = MechanismOverrides.TEMP_CACHE

MechanismOverrides.get = function (t, optional_mechanism_name)
	if t == nil then
		return nil
	end

	local mechanism_name = optional_mechanism_name or Managers.mechanism:current_mechanism_name()

	return MechanismOverrides.recursive_override(t, mechanism_name, 1)
end

MechanismOverrides.mechanism_switched = function ()
	CACHE = {}
	CACHED_MECHANISM = {}
	MechanismOverrides.CACHE = CACHE
	MechanismOverrides.CACHED_MECHANISM = CACHED_MECHANISM
end

local function _recursive_override(t, override_table)
	for key, value in pairs(override_table) do
		if value == MechanismOverrides.NIL then
			t[key] = nil
		elseif type(t[key]) == "table" and type(override_table[key]) == "table" then
			t[key] = table.shallow_copy(t[key])

			_recursive_override(t[key], override_table[key])
		else
			t[key] = value
		end
	end
end

MechanismOverrides.recursive_override = function (t, mechanism_name, depth, temp_cache)
	if TEMP_CACHE[t] then
		return TEMP_CACHE[t]
	end

	local cached_t = CACHE[t]

	if cached_t then
		if CACHED_MECHANISM[t] == mechanism_name then
			return cached_t, true
		else
			MechanismOverrides.recursive_cleanup(t, mechanism_name)
		end
	end

	depth = depth or 1

	if depth == 1 then
		table.clear(TEMP_CACHE)
	end

	local overridden

	if t.mechanism_overrides then
		overridden = table.shallow_copy(t)

		local overrides = t.mechanism_overrides[mechanism_name]

		if overrides then
			_recursive_override(overridden, overrides)
		end

		CACHE[overridden] = t
		CACHE[t] = overridden
		CACHED_MECHANISM[t] = mechanism_name
		TEMP_CACHE[t] = nil
	else
		TEMP_CACHE[t] = t
	end

	local temp, has_overrides = FrameTable.alloc_table(), not not overridden

	for key, value in pairs(overridden or t) do
		if key ~= "mechanism_overrides" and type(value) == "table" then
			local overridden_value, child_has_overrides = MechanismOverrides.recursive_override(value, mechanism_name, depth + 1)

			temp[key] = overridden_value
			has_overrides = has_overrides or child_has_overrides
		end
	end

	if has_overrides then
		overridden = overridden or table.shallow_copy(t)

		for key, value in pairs(temp) do
			overridden[key] = value
		end

		overridden.mechanism_overrides = nil
		CACHE[t] = overridden
		CACHED_MECHANISM[t] = mechanism_name
		TEMP_CACHE[t] = nil
	end

	if depth == 1 then
		local to_cache = overridden or t

		CACHE[to_cache] = t
		CACHE[t] = to_cache
		CACHED_MECHANISM[t] = mechanism_name
	end

	return CACHE[t] or TEMP_CACHE[t], has_overrides
end

MechanismOverrides.recursive_cleanup = function (t, new_mechanism_name)
	local original = CACHE[t]

	if original then
		CACHE[t] = nil

		if original and original.mechanism_name ~= new_mechanism_name then
			CACHE[original] = nil
		end

		for key, value in pairs(t) do
			if key ~= "mechanism_overrides" and type(value) == "table" then
				MechanismOverrides.recursive_cleanup(value, new_mechanism_name)
			end
		end
	end
end
