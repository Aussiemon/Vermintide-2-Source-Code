-- chunkname: @foundation/scripts/util/crashify.lua

local Crashify = {}

Crashify.print_property = function (key, value)
	if key == nil then
		Application.warning("[Crashify] Property key can't be nil")

		return
	end

	if value == nil then
		Application.warning("[Crashify] Property value (%s) can't be nil", key)

		return
	end

	local property = string.format("%s = %s", key, value)
	local output = string.format("<<crashify-property>>%s<</crashify-property>>", property)

	if not IS_WINDOWS then
		Application.add_crash_property(key, tostring(value))
	end

	print(output)
end

Crashify.print_breadcrumb = function (crumb)
	if crumb == nil then
		Application.warning("[Crashify] Breadcrumb can't be nil")

		return
	end

	local output = string.format("<<crashify-breadcrumb>>\n\t\t\t<<timestamp>%f<</timestamp>>\n\t\t\t<<value>>%s<</value>>\n\t\t<</crashify-breadcrumb>>", Application.time_since_launch(), crumb)

	print(output)
end

Crashify.print_exception = function (system, message_format, ...)
	Application.set_exit_code(1, "silent_limited")

	if system == nil then
		Application.warning("[Crashify] System can't be nil")

		return
	end

	if message_format == nil then
		Application.warning("[Crashify] Message can't be nil")

		return
	end

	local fmt_ok, message = pcall(string.format, message_format, ...)

	if not fmt_ok then
		Application.warning("[Crashify] Error formatting exception")

		return
	end

	local exception = string.format("<<crashify-exception>>\n\t\t\t<<system>>%s<</system>>\n\t\t\t<<message>>%s<</message>>\n\t\t\t<<callstack>>%s<</callstack>>\n\t\t<</crashify-exception>>", system, message, Script.callstack())

	print(exception)

	if Script.do_break then
		Script.do_break(script_data.break_on_crashify_exceptions)
	end
end

return Crashify
