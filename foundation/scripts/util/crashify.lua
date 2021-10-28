local Crashify = {
	print_property = function (key, value)
		if key == nil then
			Application.warning("[Crashify] Property key can't be nil")

			return
		end

		if value == nil then
			Application.warning("[Crashify] Property value can't be nil")

			return
		end

		local property = string.format("%s = %s", key, value)
		local output = string.format("<<crashify-property>>%s<</crashify-property>>", property)

		if not IS_WINDOWS then
			Application.add_crash_property(key, tostring(value))
		end

		print(output)
	end,
	print_breadcrumb = function (crumb)
		if crumb == nil then
			Application.warning("[Crashify] Breadcrumb can't be nil")

			return
		end

		local output = string.format([[
<<crashify-breadcrumb>>
			<<timestamp>%f<</timestamp>>
			<<value>>%s<</value>>
		<</crashify-breadcrumb>>]], Application.time_since_launch(), crumb)

		print(output)
	end,
	print_exception = function (system, message_format, ...)
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

		local exception = string.format([[
<<crashify-exception>>
			<<system>>%s<</system>>
			<<message>>%s<</message>>
			<<callstack>>%s<</callstack>>
		<</crashify-exception>>]], system, message, Script.callstack())

		print(exception)
	end
}

return Crashify
