if not DLCUtils then
	DLCUtils = {
		check_dupes = true
	}
else
	DLCUtils.check_dupes = false
end

DLCUtils.map = function (table_path, func)
	for dlc_name, dlc in pairs(DLCSettings) do
		local val = dlc[table_path]

		if val then
			func(dlc[table_path])
		end
	end
end

DLCUtils.map_list = function (table_path, func)
	for dlc_name, dlc in pairs(DLCSettings) do
		local list = dlc[table_path]

		if list then
			for _, val in pairs(list) do
				func(val)
			end
		end
	end
end

DLCUtils.require = function (table_path, force_local_require)
	return DLCUtils.map(table_path, force_local_require and local_require or require)
end

DLCUtils.require_list = function (table_path, force_local_require)
	return DLCUtils.map_list(table_path, force_local_require and local_require or require)
end

DLCUtils.dofile = function (table_path)
	return DLCUtils.map(table_path, dofile)
end

DLCUtils.dofile_list = function (table_path)
	return DLCUtils.map_list(table_path, dofile)
end

DLCUtils.append = function (table_path, dst, allow_dupes)
	local n = #dst

	for dlc_name, dlc in pairs(DLCSettings) do
		local val = dlc[table_path]

		if val then
			for i = 1, #val do
				n = n + 1
				dst[n] = val[i]
			end
		end
	end
end

DLCUtils.merge = function (table_path, dst, allow_dupes)
	for dlc_name, dlc in pairs(DLCSettings) do
		local src = dlc[table_path]

		if src then
			table.merge_recursive(dst, src)
		end
	end
end
