function ensure_user_id_in_save_data(save_data)
	if save_data.machine_id == nil then
		local function ensure_length_16(str)
			return string.rep("0", 16 - #str) .. str
		end

		local function make_64_bit_random()
			return ensure_length_16(Application.make_hash(Math.random(2147483647), Math.random(2147483647), Math.random(2147483647), Math.random(2147483647)))
		end

		local random_data = {}
		local a = make_64_bit_random()
		local b = make_64_bit_random()
		save_data.machine_id = string.sub(a, 1, 8) .. "-" .. string.sub(a, 9, 12) .. "-4" .. string.sub(a, 13, 15) .. "-8" .. string.sub(b, 1, 3) .. "-" .. string.sub(b, 5, 16)
	end
end

function populate_crashify(save_data)
	local id = "0"

	if save_data.machine_id ~= nil then
		id = save_data.machine_id
	end

	Crashify.print_property("machine_id", id)
end
