local function format_error_message(message, ...)
	local args = {}

	for i = 1, select("#", ...), 1 do
		args[i] = tostring(select(i, ...))
	end

	return string.format(message, unpack(args))
end

Application.warning = function (...)
	print_warning(format_error_message(...))

	return 
end
Application.error = function (...)
	print_error(format_error_message(...))

	return 
end

function fassert(condition, message, ...)
	if not condition then
		local message = format_error_message(message, ...)

		assert(false, message)
	end

	return 
end

function ferror(message, ...)
	local message = format_error_message(message, ...)

	error(message)

	return 
end

return 
