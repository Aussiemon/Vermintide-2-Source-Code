local BackendManagerPlayFabTestify = {
	request_non_magic_weapons_for_career = function (career_name, backend_manager_playfab)
		local items = backend_manager_playfab:get_interface("items"):get_all_backend_items()

		return table.filter(items, function (item)
			local is_weapon = item.data.slot_type == "melee" or item.data.slot_type == "ranged"
			local is_magic = item.data.rarity == "magic"
			local can_wield = table.contains(item.data.can_wield, career_name)

			return is_weapon and can_wield and not is_magic
		end)
	end,
	request_magic_weapons_for_career = function (career_name, backend_manager_playfab)
		local items = backend_manager_playfab:get_interface("items"):get_all_backend_items()

		return table.filter(items, function (item)
			local is_weapon = item.data.slot_type == "melee" or item.data.slot_type == "ranged"
			local is_magic = item.data.rarity == "magic"
			local can_wield = table.contains(item.data.can_wield, career_name)

			return is_weapon and can_wield and is_magic
		end)
	end
}

return BackendManagerPlayFabTestify
