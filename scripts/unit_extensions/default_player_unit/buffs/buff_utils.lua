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

return
