BuffUtils = BuffUtils or {}
script_data.debug_legendary_traits = script_data.debug_legendary_traits or Development.parameter("debug_legendary_traits")

BuffUtils.apply_buff_tweak_data = function (buffs, tweak_data)
	for name, buff_data in pairs(buffs) do
		local data = tweak_data[name]

		if data then
			local buff = buff_data.buffs[1]

			for key, value in pairs(data) do
				buff[key] = value
			end
		end
	end
end

BuffUtils.weave_buffs_from_rpc_params = function (num_buffs, buff_ids, buff_data_type_ids, buff_values)
	local lookup_templates = NetworkLookup.buff_templates
	local lookup_data_types = NetworkLookup.buff_data_types
	local buffs = {}

	for i = 1, num_buffs, 1 do
		local id = buff_ids[i]
		local data_type_id = buff_data_type_ids[i]
		local value = buff_values[i]
		local name = lookup_templates[id]
		local data_type = lookup_data_types[data_type_id]
		buffs[name] = {
			[data_type] = value
		}
	end

	return buffs
end

BuffUtils.weave_buffs_to_rpc_params = function (buffs)
	local lookup_templates = NetworkLookup.buff_templates
	local lookup_data_types = NetworkLookup.buff_data_types
	local num_buffs = 0
	local buff_ids = {}
	local buff_data_type_ids = {}
	local buff_values = {}

	for name, data in pairs(buffs) do
		num_buffs = num_buffs + 1
		local id = lookup_templates[name]
		local data_type, value = next(data)
		local data_type_id = lookup_data_types[data_type]
		buff_ids[num_buffs] = id
		buff_data_type_ids[num_buffs] = data_type_id
		buff_values[num_buffs] = value or 1
	end

	return {
		num_buffs,
		buff_ids,
		buff_data_type_ids,
		buff_values
	}
end

return
