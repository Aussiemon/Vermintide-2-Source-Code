ImguiDeusWeaponPool = class(ImguiDeusWeaponPool)

ImguiDeusWeaponPool.init = function (self)
	return
end

ImguiDeusWeaponPool.update = function (self)
	return
end

ImguiDeusWeaponPool.is_persistent = function (self)
	return true
end

local function display_slot_chances(run_controller, weapon_groups_pool)
	local chance_melee, chance_ranged = run_controller:get_slot_chances()
	chance_melee, chance_ranged = deus_get_combined_slot_chances(weapon_groups_pool, chance_melee, chance_ranged)
	local sum = chance_melee + chance_ranged
	chance_melee = chance_melee / sum * 100
	chance_ranged = chance_ranged / sum * 100

	Imgui.Text("Chances for the melee slot type:")
	Imgui.Text(string.format("Melee: %d%%", chance_melee))
	Imgui.Text(string.format("Ranged: %d%%", chance_ranged))
	Imgui.Spacing()
end

ImguiDeusWeaponPool.draw = function (self, is_open)
	Imgui.Begin("DeusWeaponPool", "always_auto_resize")

	local state_managers = Managers.state
	local game_mode_manager = state_managers and state_managers.game_mode
	local game_mode_key = game_mode_manager and game_mode_manager:game_mode_key()

	if game_mode_key ~= "deus" then
		Imgui.Text("This UI only works when playing in the deus game mode.")
	else
		local mechanism = Managers.mechanism:game_mechanism()
		local rarity_settings = RaritySettings
		local run_controller = mechanism:get_deus_run_controller()
		local weapon_pool = run_controller:get_weapon_pool()
		local base_weapon_pool = run_controller:get_base_weapon_pool()
		local max_entries = 0

		for _, entries in pairs(base_weapon_pool) do
			local num_entries = table.size(entries)

			if max_entries < num_entries then
				max_entries = num_entries
			end
		end

		local sorted_rarities = table.keys(base_weapon_pool)

		table.sort(sorted_rarities, function (a, b)
			local order_a = rarity_settings[a].order
			local order_b = rarity_settings[b].order

			return order_a < order_b
		end)

		for _, rarity in ipairs(sorted_rarities) do
			local panel_height = 80 + max_entries * 25

			Imgui.BeginChild("Panel_" .. rarity, 300, panel_height, true)
			display_slot_chances(run_controller, weapon_pool[rarity])

			local color = Colors.get_table(rarity)

			Imgui.TextColored(string.upper(rarity), color[2], color[3], color[4], color[1])

			for weapon_group, weapon_key in pairs(base_weapon_pool[rarity]) do
				Imgui.TreePush(weapon_key)

				local in_pool = weapon_pool[rarity][weapon_group]
				local button_text = (in_pool and "-") or "+"

				if Imgui.Button(button_text, 20, 20) then
					if in_pool then
						run_controller:debug_remove_weapon_from_pool(rarity, weapon_key)
					else
						run_controller:debug_add_weapon_to_pool(rarity, weapon_key)
					end
				end

				Imgui.SameLine()

				color = (in_pool and Colors.get_table("white")) or Colors.get_table("gray")

				Imgui.TextColored(weapon_key, color[2], color[3], color[4], color[1])
				Imgui.TreePop()
			end

			Imgui.EndChild()
			Imgui.SameLine()
		end
	end

	Imgui.End()
end

return
