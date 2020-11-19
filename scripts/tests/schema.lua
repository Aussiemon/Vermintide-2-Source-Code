local default_assert = UNIT_TEST_ASSERT or fassert or assert
local pairs = pairs
local type = type
local find = string.find
local format = string.format

local function concat(src, ...)
	local str_table = {}

	for i = 1, #src, 1 do
		str_table[i] = tostring(src[i])
	end

	return table.concat(str_table, ...)
end

local contains = table.contains
local _validator_name = {}
local _validator_func = {}
local VALIDATOR = nil

local function register(name, method, i)
	i = (i and math.clamp(i, 1, #_validator_name + 1)) or #_validator_name + 1
	_validator_name[i] = name
	_validator_func[i] = method
end

local function _validate(opts, val, assert, parent_val)
	if val == nil and not opts.required and not opts.required_if then
		return
	end

	for i = 1, #_validator_name, 1 do
		local v_data = opts[_validator_name[i]]

		if v_data and _validator_func[i](val, assert, v_data, opts, parent_val) then
			break
		end
	end
end

local function validate(validator, data, identifier, assert)
	assert = assert or default_assert

	default_assert(type(assert) == "function", "Passed in assert function is a type of %s", type(assert))
	_validate(validator, data, function (ok, err)
		assert(ok, format("%s[%s(%.20s)]%s", validator.schema_name, identifier or "", data, err))
	end)
end

local function _schema(val, _assert)
	validate(VALIDATOR, val, "", _assert or default_assert)

	if val.table_values then
		_schema(val.table_values, _assert)
	end

	if val.table_array then
		_schema(val.table_array, _assert)
	end

	if val.map then
		for _, v in pairs(val.map) do
			_schema(v, _assert)
		end
	end

	return val
end

local function schema(...)
	local args = {
		...
	}
	local num_args = #args

	fassert(num_args <= 3, "Too many arguments, max 3 got %d", num_args)

	local name, val, _assert = nil

	for i = 1, num_args, 1 do
		if type(args[i]) == "string" then
			name = args[i]
		elseif type(args[i]) == "table" then
			val = args[i]
		elseif type(args[i]) == "function" then
			_assert = args[i]
		end
	end

	fassert(val, "Missing schema validator data table")

	val.schema_name = name or ""

	return _schema(val, _assert)
end

register("required", function (val, assert, bool)
	assert(not bool or val ~= nil, " is a required value, but was nil")
end)
register("required_if", function (val, assert, dependancies, opts, parent_val)
	if val ~= nil then
		return
	end

	local is_required = false
	local dependancy_key = nil

	for key, requirement in pairs(dependancies) do
		if (requirement and parent_val[key]) or (not requirement and not parent_val[key]) then
			dependancy_key = key
			is_required = true

			break
		end
	end

	assert(not is_required, format(" is a required value due to dependancy [%s: %s], but was nil", dependancy_key, dependancies[dependancy_key]))

	return val == nil and not is_required
end)
register("enum", function (val, assert, enum)
	assert(contains(enum, val), format(" \"%s\" is not one of the valid values: %s", val, concat(enum, ", ")))
end)
register("key", function (val, assert, map)
	assert(map[val] ~= nil, format(" \"%s\" is not one of the valid key: %s", val, concat(table.keys(map), ", ")))
end)
register("length", function (val, assert, length)
	assert(#val == length, format(" array length missmatch, length is %d, but required length is: %d", #val, length))
end)
register("type", function (val, assert, valid_types)
	if type(valid_types) == "string" then
		assert(valid_types == type(val), format(" (%s) is not of type: %s", type(val), valid_types))
	else
		assert(contains(valid_types, type(val)), format(" (%s) is not of type: %s", type(val), concat(valid_types, ", ")))
	end
end)
register("min", function (val, assert, min)
	assert(min <= val, format(" is below the minimum %s", min))
end)
register("max", function (val, assert, max)
	assert(val <= max, format(" is above the maximum %s", max))
end)
register("choose", function (val, assert, choice_data)
	local key = choice_data.key
	local index = nil

	if type(key) == "function" then
		index = key(val)
	else
		index = val[key]
	end

	local from = choice_data.from[index]

	if from then
		_validate(from, val, assert)
	else
		assert(choice_data.strict, format(" %s not found in from", index))
	end
end)
register("instance_of", function (val, assert, class_def)
	local class_val = getmetatable(val)

	repeat
		if class_val == class_def then
			return
		end

		class_val = class_val.super
	until not class_val

	assert(false, " is not an instance of " .. tostring(class_def))
end)

local function assertidx(k)
	local tk = type(k)

	if tk == "string" and find(k, "^[%a_][%w_]*$") then
		return "." .. k
	elseif tk == "number" or tk == "boolean" or tk == "nil" then
		return "[" .. tostring(k) .. "]"
	else
		return format("[%q]", k)
	end
end

register("table_array", function (val, assert, validator)
	for i = 1, #val, 1 do
		_validate(validator, val[i], function (ok, err)
			assert(ok, format("%s%s)", assertidx(i), err))
		end, val)
	end
end)
register("table_values", function (val, assert, validator)
	for i, elem in pairs(val) do
		_validate(validator, elem, function (ok, err)
			assert(ok, format("%s%s)", assertidx(i), err))
		end, val)
	end
end)
register("map", function (val, assert, schema_def)
	for key, validator in pairs(schema_def) do
		_validate(validator, val[key], function (ok, err)
			assert(ok, format("%s%s)", assertidx(key), err))
		end, val)
	end
end)
register("strict", function (val, assert, bool, opts)
	if not bool then
		return
	end

	local map = opts.map

	for key in pairs(val) do
		assert(map[key], format(".%s was not defined in map", key))
	end
end)
register("thunk", function (val, assert, thunk)
	assert(type(thunk) == "function" or thunk.__call, " thunk is not a function nor a table that implements __call meta method")
	assert(thunk(val, assert), format(" thunk [%s] returned a falsy (false or nil) result for value [%s]", thunk, val))
end)

local lua_types = {
	"boolean",
	"cdata",
	"function",
	"number",
	"proto",
	"string",
	"table",
	"thread",
	"trace",
	"upval",
	"userdata"
}
local is_lua_type = {
	enum = lua_types
}
VALIDATOR = {
	strict = true,
	type = "table",
	map = {
		schema_name = {
			type = "string"
		},
		enum = {
			type = "table"
		},
		required = {
			type = "boolean"
		},
		required_if = {
			type = "table"
		},
		type = {
			required = true,
			type = {
				"string",
				"table"
			},
			choose = {
				key = type,
				from = {
					table = {
						table_array = is_lua_type
					},
					string = is_lua_type
				}
			}
		},
		min = {
			type = "number"
		},
		max = {
			type = "number"
		},
		table_array = {
			type = "table"
		},
		table_values = {
			type = "table"
		},
		map = {
			type = "table"
		},
		strict = {
			type = "boolean"
		},
		choose = {
			type = "table",
			map = {
				key = {
					required = true,
					type = lua_types
				},
				from = {
					required = true,
					type = {
						"table",
						"function"
					}
				}
			}
		},
		length = {
			type = "number"
		},
		key = {
			type = lua_types
		},
		thunk = {
			type = {
				"function",
				"table"
			}
		}
	}
}
VALIDATOR = schema("VALIDATOR", VALIDATOR)
Schema = Schema or {}
Schema.register = register
Schema.define = schema
Schema.validate = validate
Schema.VALIDATOR = VALIDATOR

return
