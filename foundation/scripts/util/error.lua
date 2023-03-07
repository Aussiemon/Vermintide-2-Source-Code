local function format_error_message(message, ...)
	local args = {}

	for i = 1, select("#", ...) do
		args[i] = tostring(select(i, ...))
	end

	return string.format(message, unpack(args))
end

Application.warning = function (...)
	print_warning(format_error_message(...))
end

Application.error = function (...)
	if Crashify and script_data.testify then
		Crashify.print_exception("Lua", format_error_message(...))
	else
		print_error(format_error_message(...))
	end
end

function fassert(condition, message, ...)
	if not condition then
		local message = format_error_message(message, ...)

		assert(false, message)
	end
end

function ferror(message, ...)
	local message = format_error_message(message, ...)

	error(message)
end
