function cprint(...)
	print(...)
	CommandWindow.print(...)

	return 
end

function cprintf(f, ...)
	local s = sprintf(f, ...)

	print(s)
	CommandWindow.print(s)

	return 
end

string.split = function (str, sep)
	local fields = {}
	local pattern = string.format("([^%s]+)", sep or " ")

	str.gsub(str, pattern, function (part)
		fields[#fields + 1] = part

		return 
	end)

	return fields
end
table.remove_unordered_items = function (t, filter)
	local num_items = #t
	local i = 1

	while i <= num_items do
		local t_item = t[i]

		if filter(t_item) then
			t[i] = t[num_items]
			t[num_items] = nil
			num_items = num_items - 1
		else
			i = i + 1
		end
	end

	return 
end

return 
