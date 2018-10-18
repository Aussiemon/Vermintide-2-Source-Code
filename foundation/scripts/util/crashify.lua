Crashify = {}

local function clean(str)
	local _, __, result = tostring(str):find("%W*([%w _-]*)%W*")

	return result:lower()
end

Crashify.print_property = function (key, value)
	key = clean(key)
	value = clean(value)
	local property = string.format("%s = %s", key, value)
	local output = string.format("<<crashify-property>>%s<</crashify-property>>", property)

	if PLATFORM ~= "win32" then
		Application.add_crash_property(key, value)
	end

	print(output)
end

Crashify.print_breadcrumb = function (crumb)
	local crumb = clean(crumb)
	local output = string.format("<<crashify-breadcrumb>>%s<</crashify-breadcrumb>>", crumb)

	print(output)
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
