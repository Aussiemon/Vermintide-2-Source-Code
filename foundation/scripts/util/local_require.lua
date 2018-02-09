local file_required_since_last_hot_reload = {}

function local_require(filename)
	if file_required_since_last_hot_reload[filename] == nil then
		file_required_since_last_hot_reload[filename] = true
		package.loaded[filename] = nil

		require(filename)

		package.load_order[#package.load_order] = nil
	end

	return require(filename)
end

return 
