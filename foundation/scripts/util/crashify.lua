Crashify = {
	print_property = function (key, value)
		if key == nil then
			return Application.warning("[Crashify] Property key can't be nil")
		end

		if value == nil then
			return Application.warning("[Crashify] Property value can't be nil")
		end

		local property = string.format("%s = %s", key, value)
		local output = string.format("<<crashify-property>>%s<</crashify-property>>", property)

		if PLATFORM ~= "win32" then
			Application.add_crash_property(key, value)
		end

		print(output)
	end,
	print_breadcrumb = function (crumb)
		if crumb == nil then
			return Application.warning("[Crashify] Breadcrumb can't be nil")
		end

		local output = string.format([[
<<crashify-breadcrumb>>
			<<timestamp>%f<</timestamp>>
			<<value>>%s<</value>>
		<</crashify-breadcrumb>>]], Application.time_since_launch(), crumb)

		print(output)
	end,
	print_exception = function (system, message)
		Application.set_exit_code(57005)

		if system == nil then
			return Application.warning("[Crashify] System can't be nil")
		end

		if message == nil then
			return Application.warning("[Crashify] Message can't be nil")
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

return
