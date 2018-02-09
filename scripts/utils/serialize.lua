local serialize = {}
local save_item, save_item_simple = nil

local function save(what, v, saved)
	saved = saved or {}

	assert(v)
	assert(type(what) == "string", "1st argument to serialize.save should be the *name* of a variable")
	assert(type(v) ~= "nil", "Variable %q does not exist", what)
	assert(type(saved) == "table" or saved == nil, "3rd argument to serialize.save should be a table or nil")

	local out = {}

	save_item(what, v, out, 0, saved)

	return table.concat(out, "\n"), saved
end

serialize.save = save

local function save_simple(v)
	local out = {}

	save_item_simple(v, out, 1)

	return table.concat(out)
end

serialize.save_simple = save_simple

local function basicSerialize(o)
	if type(o) == "number" or type(o) == "boolean" then
		return tostring(o)
	else
		return string.format("%q", o)
	end

	return 
end

local lua_reserved_words = {}

for _, v in ipairs({
	"and",
	"break",
	"do",
	"else",
	"elseif",
	"end",
	"for",
	"function",
	"if",
	"in",
	"local",
	"nil",
	"not",
	"or",
	"repeat",
	"return",
	"then",
	"until",
	"while"
}) do
	lua_reserved_words[v] = true
end

function save_item(name, value, out, indent, saved)
	local iname = string.rep("\t", indent) .. name
	local vtype = type(value)

	if vtype == "number" or vtype == "string" or vtype == "boolean" then
		table.insert(out, iname .. " = " .. basicSerialize(value))
	elseif vtype == "table" then
		if saved[value] then
			table.insert(out, iname .. " = " .. saved[value])
		else
			saved[value] = name

			table.insert(out, iname .. " = {}")

			for k, v in pairs(value) do
				local fieldname = nil

				if type(k) == "string" and string.find(k, "^[_%a][_%a%d]*$") and not lua_reserved_words[k] then
					fieldname = string.format("%s.%s", name, k)
				elseif type(k) == "table" and saved[k] then
					fieldname = string.format("%s[%s]", name, saved[k])
				elseif type(k) == "table" then
					error("Key table entry " .. tostring(k) .. " in table " .. name .. " is not known")
				elseif type(k) == "number" or type(k) == "boolean" then
					fieldname = string.format("%s[%s]", name, tostring(k))
				elseif type(k) ~= "string" then
					error("Cannot serialize table keys of type '" .. type(k) .. "' in table " .. name)
				else
					fieldname = string.format("%s[%s]", name, basicSerialize(k))
				end

				save_item(fieldname, v, out, indent + 2, saved)
			end
		end
	else
		error("Cannot serialize '" .. name .. "' (" .. vtype .. ")")
	end

	return 
end

function save_item_simple(value, out, indent)
	local vtype = type(value)

	if vtype == "number" or vtype == "string" or vtype == "boolean" then
		table.insert(out, basicSerialize(value))
	elseif vtype == "table" then
		table.insert(out, "{\n")

		for k, v in pairs(value) do
			table.insert(out, string.rep("\t", indent))

			if not string.find(k, "^[_%a][_%a%d]*$") or lua_reserved_words[k] then
				table.insert(out, "[" .. basicSerialize(k) .. "] = ")
			else
				table.insert(out, k .. " = ")
			end

			save_item_simple(v, out, indent + 1)
			table.insert(out, ",\n")
		end

		table.insert(out, string.rep("\t", indent - 1) .. "}")
	else
		error("Cannot serialize " .. type(value))
	end

	return 
end

return serialize
