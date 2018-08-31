Crashify = {}

local function clean(str)
	local _, __, result = tostring(str):find("%W*([%w_-]*)%W*")

	return result
end

Crashify.print_property = function (key, value)
	local property = string.format("<<crashify-property>>%s = %s<</crashify-property>>", clean(key), clean(value))

	print(property)
end

Crashify.print_breadcrumb = function (crumb)
	local crumb = string.format("<<crashify-breadcrumb>>%s<</crashify-breadcrumb>>", clean(crumb))

	print(crumb)
end

Crashify.print_exception = function (system, message)
	Application.set_exit_code(57005)

	local exception = string.format([[
<<crashify-exception>>
			<<system>>%s<</system>>
			<<message>>%s<</message>>
			<<callstack>>%s<</callstack>>
		<</crashify-exception>>]], clean(system), clean(message), Script.callstack())

	print(exception)
end

return
