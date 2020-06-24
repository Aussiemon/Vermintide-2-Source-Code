DLCUtils = {
	require = function (table_path)
		for dlc_name, dlc in pairs(DLCSettings) do
			local files = dlc[table_path]

			if files then
				for i = 1, #files, 1 do
					require(files[i])
				end
			end
		end
	end
}

return
