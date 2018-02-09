local CALL_LIST = {}
local COUNTER = 0
local CALL_DATA = {}

local function on_function_call(event)
	local res = debug.getinfo(2)

	if res then
		COUNTER = COUNTER + 1
		local func_name = tostring(res.name)
		local currentline = res.currentline
		local name = nil

		if currentline ~= -1 then
			name = res.short_src .. ":" .. tostring(currentline) .. " " .. func_name .. "()"
		else
			name = res.short_src .. " " .. func_name .. "()"
		end

		local index = CALL_LIST[name]

		if not index then
			index = #CALL_LIST + 1
			CALL_LIST[index] = name
			CALL_LIST[name] = index
			CALL_DATA[index] = {
				num = 1,
				position = name
			}
		end

		CALL_DATA[index].num = CALL_DATA[index].num + 1
	end

	return 
end

local function compare(e1, e2)
	return e2.num < e1.num
end

function start_function_call_collection()
	debug.sethook(on_function_call, "c")

	return 
end

function end_function_call_collection()
	if 0 < COUNTER then
		debug.sethook()
		print("Counter", COUNTER)
		table.sort(CALL_DATA, compare)

		for ii = 1, 100, 1 do
			local elem = CALL_DATA[ii]

			if not elem then
				break
			end

			print(elem.num, elem.position)
		end

		CALL_LIST = {}
		COUNTER = 0
		CALL_DATA = {}
	end

	return 
end

return 
