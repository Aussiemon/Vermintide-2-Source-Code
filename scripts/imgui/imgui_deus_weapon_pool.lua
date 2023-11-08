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

ImguiDeusWeaponPool.draw = function (self, is_open)
	local do_close = Imgui.begin_window("DeusWeaponPool", "always_auto_resize")
	local deus_weapon_groups = DeusWeaponGroups
	local state_managers = Managers.state
	local game_mode_manager = state_managers and state_managers.game_mode
	local game_mode_key = game_mode_manager and game_mode_manager:game_mode_key()

	if game_mode_key ~= "deus" then
		Imgui.text("This UI only works when playing in the deus game mode.")
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
			local panel_height = 120 + max_entries * 25

			Imgui.begin_child_window("Panel_" .. rarity, 300, panel_height, true)

			local color = Colors.get_table(rarity)

			Imgui.text_colored(string.upper(rarity), color[2], color[3], color[4], color[1])

			local ordered_draw_data = {}

			for weapon_group, weapon_key in pairs(base_weapon_pool[rarity]) do
				local in_pool = weapon_pool[rarity][weapon_group]
				local button_text = in_pool and "-" or "+"
				local text_color = in_pool and Colors.get_table("white") or Colors.get_table("gray")
				local slot_type = deus_weapon_groups[weapon_group].slot_type
				local order = slot_type == "melee" and 1 or 0
				local draw_data = {
					weapon_key = weapon_key,
					button_text = button_text,
					in_pool = in_pool,
					text_color = text_color,
					slot_type = slot_type,
					order = order
				}

				table.insert(ordered_draw_data, draw_data)
			end

			table.sort(ordered_draw_data, function (a, b)
				return b.order < a.order
			end)

			local melee_drawn = false
			local ranged_drawn = false

			for _, draw_data in ipairs(ordered_draw_data) do
				local weapon_key = draw_data.weapon_key

				if draw_data.slot_type == "melee" and not melee_drawn then
					melee_drawn = true

					Imgui.text("MELEE")
				elseif draw_data.slot_type == "ranged" and not ranged_drawn then
					ranged_drawn = true

					Imgui.text("RANGED")
				end

				Imgui.tree_push(weapon_key)

				if Imgui.button(draw_data.button_text, 20, 20) then
					if draw_data.in_pool then
						run_controller:debug_remove_weapon_from_pool(rarity, weapon_key)
					else
						run_controller:debug_add_weapon_to_pool(rarity, weapon_key)
					end
				end

				Imgui.same_line()

				local text_color = draw_data.text_color

				Imgui.text_colored(weapon_key, text_color[2], text_color[3], text_color[4], text_color[1])
				Imgui.tree_pop()
			end

			Imgui.end_child_window()
			Imgui.same_line()
		end
	end

	Imgui.end_window()

	return do_close
end
