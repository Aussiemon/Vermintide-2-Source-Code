DataCounter = {}

local function count_table(t, seen_data, count)
	if seen_data[t] then
		return 0, 0
	end

	seen_data[t] = true
	local type = type
	local table_count = 0
	local value_count = 0

	for k, v in pairs(t) do
		local k_type = type(k)
		local v_type = type(v)

		if k_type == "table" then
			local recursed_table_count, recursed_value_count = count_table(k, seen_data, count + 1)
			table_count = table_count + recursed_table_count + 1
			value_count = value_count + recursed_value_count
			local str = ""

			for i = 1, count, 1 do
				str = str .. "\t"
			end

			printf(str .. "%s[%6d, %6d]", tostring(k), recursed_table_count, recursed_value_count)
		end

		if v_type == "table" then
			local recursed_table_count, recursed_value_count = count_table(v, seen_data, count + 1)
			table_count = table_count + recursed_table_count + 1
			value_count = value_count + recursed_value_count
			local str = ""

			for i = 1, count, 1 do
				str = str .. "\t"
			end

			printf(str .. "%s[%6d, %6d]", tostring(k), recursed_table_count, recursed_value_count)
		else
			value_count = value_count + 1
		end
	end

	return table_count, value_count
end

DataCounter.analyze_table = function (t, name, ...)
	local seen_data = {}

	for i = 1, select("#", ...), 1 do
		local value = select(i, ...)

		if value then
			seen_data[value] = true
		end
	end

	print(name)

	local num_tables, num_values = count_table(t, seen_data, 1)

	printf("Analyzed table %q with %d table counts and value counts of %d", name or "unknown", num_tables, num_values)

	return 
end

return 
