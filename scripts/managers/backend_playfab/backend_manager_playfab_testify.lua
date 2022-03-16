local BackendManagerPlayFabTestify = {
	clear_backend_inventory = function (_, backend_manager_playfab)
		local backend_mirror = backend_manager_playfab:get_backend_mirror()

		backend_mirror:snippet_clear_inventory()
	end,
	request_magic_weapons_for_career = function (career_name, backend_manager_playfab)
		local items = backend_manager_playfab:get_interface("items"):get_all_backend_items()

		return table.filter(items, function (item)
			local is_weapon = item.data.slot_type == "melee" or item.data.slot_type == "ranged"
			local is_magic = item.data.rarity == "magic"
			local can_wield = table.contains(item.data.can_wield, career_name)

			return is_weapon and can_wield and is_magic
		end)
	end,
	request_non_magic_weapons_for_career = function (career_name, backend_manager_playfab)
		local items = backend_manager_playfab:get_interface("items"):get_all_backend_items()

		return table.filter(items, function (item)
			local is_weapon = item.data.slot_type == "melee" or item.data.slot_type == "ranged"
			local is_magic = item.data.rarity == "magic"
			local can_wield = table.contains(item.data.can_wield, career_name)

			return is_weapon and can_wield and not is_magic
		end)
	end,
	wait_for_playfab_response = function (cloudscript_function, backend_manager_playfab)
		return Testify.RETRY
	end
}

return BackendManagerPlayFabTestify
