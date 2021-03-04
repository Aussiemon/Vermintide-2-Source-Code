BuffUtils = BuffUtils or {}

if script_data then
	script_data.debug_legendary_traits = script_data.debug_legendary_traits or Development.parameter("debug_legendary_traits")
end

BuffUtils.apply_buff_tweak_data = function (buffs, tweak_data)
	for name, buff_data in pairs(buffs) do
		local data = tweak_data[name]

		if data then
			table.merge(buff_data.buffs[1], data)
		end
	end
end

BuffUtils.copy_talent_buff_names = function (buffs)
	for name, buff_data in pairs(buffs) do
		local buffs = buff_data.buffs

		fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

		local buff = buffs[1]
		buff.name = name
	end
end

BuffUtils.get_max_stacks = function (buff_name, buff_index)
	local buffs = BuffTemplates[buff_name].buffs
	local max_stacks = buffs[buff_index or 1].max_stacks

	return max_stacks or nil
end

BuffUtils.remove_stacked_buffs = function (buffed_unit, stacked_buff_ids)
	local buff_extension = buffed_unit and ScriptUnit.has_extension(buffed_unit, "buff_system")

	if not buff_extension then
		return
	end

	for _, buff_id in ipairs(stacked_buff_ids) do
		buff_extension:remove_buff(buff_id)
	end

	table.clear(stacked_buff_ids)
end

BuffUtils.buffs_from_rpc_params = function (num_buffs, buff_ids, buff_data_type_ids, buff_values)
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

BuffUtils.buffs_to_rpc_params = function (buffs)
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
