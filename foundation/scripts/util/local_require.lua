local file_required_since_last_hot_reload = {}

function local_require(filename)
	if file_required_since_last_hot_reload[filename] == nil then
		file_required_since_last_hot_reload[filename] = true
		package.loaded[filename] = nil
		local load_order_index = #package.load_order + 1

		require(filename)
		table.remove(package.load_order, load_order_index)
	end

	return require(filename)
end

return
