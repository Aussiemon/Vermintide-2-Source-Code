NOP = NOP or function ()
	return
end
FAKE_INPUT_SERVICE = {
	get = NOP,
	has = NOP
}
UICommon = UICommon or {}

UICommon.align = function (alignment, position, offset)
	if alignment == "right" or alignment == "top" then
		position = position + offset
	elseif alignment == "center" then
		position = position + 0.5 * offset
	end

	return position
end

UICommon.create_widgets = function (widget_definitions)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	return widgets, widgets_by_name
end

local next = next
local pairs = pairs
local tostring = tostring
local type = type
local concat = table.concat
local find = string.find
local format = string.format
local gsub = string.gsub

local function serializepush(b, x, q)
	local tx = type(x)

	if tx == "string" then
		b[#b + 1] = gsub(format("%q", x), "\\\n", "\\n")
	elseif tx == "number" or tx == "boolean" then
		b[#b + 1] = tostring(x)
	elseif tx ~= "table" then
		b[#b + 1] = "'" .. tostring(x) .. "'"
	else
		if b[x] then
			b[#b + 1] = "'table: loopback#" .. b[x] .. "'"

			return
		end

		b.l = b.l + 1
		b[x] = b.l

		if next(x) == nil then
			b[#b + 1] = "{}"

			return
		end

		b[#b + 1] = "{\n"
		local i = 1
		local qq = q .. "\t"

		for k, v in pairs(x) do
			b[#b + 1] = qq

			if k == i then
				serializepush(b, v, qq)

				i = i + 1
			elseif type(k) == "string" and find(k, "^[%a_][%w_]*$") then
				b[#b + 1] = k .. " = "

				serializepush(b, v, qq)
			else
				b[#b + 1] = "["

				serializepush(b, k, qq)

				b[#b + 1] = "] = "

				serializepush(b, v, qq)
			end

			b[#b + 1] = ",\n"
		end

		b[#b + 1] = q .. "}"
	end
end

UICommon.pretty_print = function (t, d)
	if t == nil then
		return "nil"
	end

	local b = {
		l = 1
	}

	serializepush(b, t, "")

	return concat(b)
end

return
