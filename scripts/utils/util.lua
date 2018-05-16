function cprint(...)
	print(...)
	CommandWindow.print(...)
end

function cprintf(f, ...)
	local s = sprintf(f, ...)

	print(s)
	CommandWindow.print(s)
end

string.split = function (str, sep)
	local fields = {}
	local pattern = string.format("([^%s]+)", sep or " ")

	str:gsub(pattern, function (part)
		fields[#fields + 1] = part
	end)

	return fields
end

table.remove_unordered_items = function (t, filter)
	local num_items = #t
	local i = 1

	while num_items >= i do
		local t_item = t[i]

		if filter(t_item) then
			t[i] = t[num_items]
			t[num_items] = nil
			num_items = num_items - 1
		else
			i = i + 1
		end
	end
end

return
