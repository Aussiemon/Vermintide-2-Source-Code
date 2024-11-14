-- chunkname: @scripts/imgui/imgui_weapon_debug.lua

ImguiWeaponDebug = class(ImguiWeaponDebug)

local SHOULD_RELOAD = true
local min_power_level = 5
local font = "arial"
local font_mtrl = "materials/fonts/" .. font

local function gui_shadow_text(gui, string, size, position, color)
	local font_offset = Vector3(0, 2, 0)
	local shadow_offset_amount = size * 0.07
	local font_shadow_offset = Vector3(shadow_offset_amount, -shadow_offset_amount, 0) + font_offset

	Gui.text(gui, string, font_mtrl, size, font, position + font_shadow_offset, Color(255, 0, 0, 0))
	Gui.text(gui, string, font_mtrl, size, font, position + font_offset, color)
end

ImguiWeaponDebug.init = function (self)
	self._draw_hit_box = false
	self._draw_chain_action_data = true
	self._display_current_action = true
	self._action_list = {}
	self._sub_action_list = {}
	self._selected_action = 1
	self._selected_sub_action = 1
	self._unit_names = {}
	self._units = {}
	self._selected_unit = -1
	self._weapon_extensions = {}
	self._selected_weapon_extenstion_name = ""
	self._current_unit = nil
	self._weapon_unit_left = nil
	self._weapon_unit_right = nil
	self._current_weapon_extension = nil
	self._current_inventory_extension = nil
	self._previous_wield_slot = ""
	self._current_actions = nil
	self._damage_power_level = 200
	self._damage_hit_zone_id = 1
	self._damage_difficulty_id = 1
	self._hit_zone_names = {
		"head",
		"neck",
		"torso",
		"left_arm",
		"right_arm",
		"left_leg",
		"right_leg",
		"full",
	}
	self._difficulties = table.clone(Difficulties)
	self._breed_table = {
		Chaos = CHAOS,
		Skaven = SKAVEN,
		Beastmen = BEASTMEN,
		Elites = ELITES,
		VS = PlayerBreeds,
	}
	self._combat_critical = false
	self._combat_power_boost = false
	self._combat_use_current_power_level = true
	self._combat_pop_settings = false
	self._combat_backstab_multiplier = 1
	self._combat_stagger_level = 0
	self._combat_hit_actions = {}
	self._combat_push_actions = {}
	self._combat_current_weapon = nil
	self._combat_current_weapon_name = nil
	self._attack_armor_modifiers = {}
	self._armor_modifiers_charge_value = {}

	self:_refresh_unit_list()
end

ImguiWeaponDebug.update = function (self)
	if SHOULD_RELOAD then
		self:init()

		SHOULD_RELOAD = false
	end

	local slot_changed = false

	if self._current_inventory_extension then
		local slot_name = self._current_inventory_extension:get_wielded_slot_name()

		if self._previous_wield_slot ~= slot_name then
			self._previous_wield_slot = slot_name
			slot_changed = true
		end
	end

	if self._current_unit and not Unit.alive(self._current_unit) or self._weapon_unit_left and not Unit.alive(self._weapon_unit_left) or self._weapon_unit_right and not Unit.alive(self._weapon_unit_right) or self._weapon_unit_left == nil and self._weapon_unit_right == nil or slot_changed then
		self._current_unit = nil
		self._current_weapon_extension = nil

		self:_refresh_unit_list()
	end

	local owner_unit = self._current_unit
	local weapon_extension = self:_get_current_weapon()

	if owner_unit and weapon_extension and self._current_actions then
		local action = self:_get_current_action()

		if action then
			local current_time_in_action = self._display_current_action and weapon_extension.weapon_system.t - weapon_extension.action_time_started or 0

			if self._draw_chain_action_data and action then
				self:debug_draw_chain_data(current_time_in_action, action, owner_unit, weapon_extension)
			end
		end
	end
end

ImguiWeaponDebug.is_persistent = function (self)
	return self._draw_chain_action_data or self._draw_hit_box
end

ImguiWeaponDebug.draw = function (self)
	local do_close = Imgui.begin_window("Weapon Debug", "menu_bar")

	if Imgui.begin_menu_bar() then
		if Imgui.begin_menu("Run Test") then
			if Imgui.menu_item("Verify Crit Damage") then
				self:_verify_crits()
			end

			if Imgui.menu_item("Dump Weapon Performace") then
				self:_dump_weapon_performance()
			end

			if Imgui.menu_item("Check Missing or Unused Actions") then
				self:_check_missing_unused_actions()
			end

			Imgui.end_menu()
		end

		Imgui.end_menu_bar()
	end

	local selected_unit = Imgui.combo("Unit", self._selected_unit, self._unit_names)

	if selected_unit ~= self._selected_unit then
		self._selected_unit = selected_unit

		self:_initialize_unit(self._units[selected_unit])
	end

	Imgui.same_line()

	if Imgui.button("Refresh") then
		self:_refresh_unit_list()
	end

	if script_data and script_data.debug_weapons ~= nil then
		script_data.debug_weapons = Imgui.checkbox("Draw Hit Box", script_data.debug_weapons)

		Imgui.same_line()
	end

	self._draw_chain_action_data = Imgui.checkbox("Draw Action Chain", self._draw_chain_action_data)

	Imgui.same_line()

	self._display_current_action = Imgui.checkbox("Use Current Action", self._display_current_action)

	if not self._display_current_action then
		self._selected_action = Imgui.combo("Action", self._selected_action, self._action_list)

		local selected_action_name = self._selected_action > 0 and self._action_list[self._selected_action]
		local selected_sub_actions = selected_action_name and self._sub_action_list[selected_action_name] or {}

		self._selected_sub_action = Imgui.combo("Sub Action", self._selected_sub_action, selected_sub_actions)
	end

	local _first_weapon_entry = true

	for name, weapon in pairs(self._weapon_extensions) do
		if not _first_weapon_entry then
			Imgui.same_line()
		end

		if name == "any" then
			weapon = nil
		end

		if Imgui.radio_button(name, weapon == self._current_weapon_extension) then
			self._current_weapon_extension = weapon
			self._selected_weapon_extenstion_name = name
		end

		_first_weapon_entry = false
	end

	self:_draw_basic_info()
	self:_draw_damage_info()
	Imgui.end_window()

	return do_close
end

ImguiWeaponDebug._refresh_unit_list = function (self)
	self._unit_names = {}
	self._units = {}
	self._selected_unit = -1

	table.insert(self._unit_names, "none")
	table.insert(self._units, false)

	local player_manager = Managers.player

	if player_manager then
		local players = player_manager:human_and_bot_players()

		for id, player in pairs(players) do
			if player then
				local profile_display_name = player:profile_display_name()

				table.insert(self._unit_names, profile_display_name)
				table.insert(self._units, player.player_unit)

				if player.local_player then
					self._selected_unit = #self._unit_names

					self:_initialize_unit(player.player_unit)
				end
			end
		end
	end
end

ImguiWeaponDebug._initialize_unit = function (self, unit)
	self._current_unit = unit
	self._weapon_unit_left = nil
	self._weapon_unit_right = nil
	self._weapon_extensions = {}
	self._current_weapon_extension = nil
	self._current_inventory_extension = nil
	self._selected_weapon_extenstion_name = "any"
	self._action_list = {}
	self._sub_action_list = {}
	self._current_actions = {}
	self._combat_hit_actions = {}
	self._combat_push_actions = {}
	self._combat_current_weapon = nil
	self._combat_current_weapon_name = nil
	self._attack_armor_modifiers = {}
	self._armor_modifiers_charge_value = {}

	if unit then
		local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")

		self._current_inventory_extension = inventory_extension

		local lh_weapon_unit, rh_weapon_unit = inventory_extension:get_all_weapon_unit()

		self._weapon_unit_left = lh_weapon_unit
		self._weapon_unit_right = rh_weapon_unit

		local lh_weapon_extension = Unit.alive(lh_weapon_unit) and ScriptUnit.extension(lh_weapon_unit, "weapon_system")
		local rh_weapon_extension = Unit.alive(rh_weapon_unit) and ScriptUnit.extension(rh_weapon_unit, "weapon_system")

		self._weapon_extensions.left = lh_weapon_extension
		self._weapon_extensions.right = rh_weapon_extension
		self._weapon_extensions.any = lh_weapon_extension

		local extension = lh_weapon_extension or rh_weapon_extension

		if extension then
			local weapon = ItemMasterList[extension.item_name]
			local template = WeaponUtils.get_weapon_template(weapon.template) or WeaponUtils.get_weapon_template(weapon.temporary_template)
			local armor_modifier_values = {
				0,
				0,
				0,
				0,
				0,
				0,
			}
			local mod_count = 0
			local armor_mod_per_charge = {}

			if template then
				local actions = template.actions

				self._current_actions = actions
				self._combat_current_weapon = weapon
				self._combat_current_weapon_name = extension.item_name

				for name, action in pairs(actions) do
					table.insert(self._action_list, name)

					if not self._sub_action_list[name] then
						self._sub_action_list[name] = {}
					end

					local sub_action_list = self._sub_action_list[name]

					for sub_name, sub_action in pairs(action) do
						table.insert(sub_action_list, sub_name)

						local left, right = self:_get_damage_profile_for_action(sub_action)

						if left or right then
							self._combat_hit_actions[sub_name] = sub_action

							if left then
								local charge_value = sub_name .. "_L"
								local charge_data = armor_mod_per_charge[charge_value] or {
									count = 0,
									values = {},
								}
								local perf = ActionUtils.get_damage_profile_performance_scores(left)

								for i = 1, #perf do
									armor_modifier_values[i] = (armor_modifier_values[i] or 0) + perf[i]
									charge_data.values[i] = (charge_data.values[i] or 0) + perf[i]
								end

								mod_count = mod_count + 1
								charge_data.count = charge_data.count + 1
								armor_mod_per_charge[charge_value] = charge_data
							end

							if right then
								local charge_value = sub_name .. "_R"
								local charge_data = armor_mod_per_charge[charge_value] or {
									count = 0,
									values = {},
								}
								local perf = ActionUtils.get_damage_profile_performance_scores(right)

								for i = 1, #perf do
									armor_modifier_values[i] = (armor_modifier_values[i] or 0) + perf[i]
									charge_data.values[i] = (charge_data.values[i] or 0) + perf[i]
								end

								mod_count = mod_count + 1
								charge_data.count = charge_data.count + 1
								armor_mod_per_charge[charge_value] = charge_data
							end
						end

						local inner, outer = ActionUtils.get_push_damage_profile(sub_action)

						if inner or outer then
							self._combat_push_actions[sub_name] = {
								inner = inner,
								outer = outer,
							}
						end
					end

					table.sort(sub_action_list)
				end
			end

			table.sort(self._action_list)

			for i = 1, #armor_modifier_values do
				armor_modifier_values[i] = mod_count == 0 and 0 or armor_modifier_values[i] / mod_count
			end

			self._attack_armor_modifiers = armor_modifier_values

			for charge_type, data in pairs(armor_mod_per_charge) do
				for i = 1, #data.values do
					data.values[i] = data.count == 0 and 0 or data.values[i] / data.count
				end

				self._armor_modifiers_charge_value[charge_type] = data.values
			end
		end
	end
end

ImguiWeaponDebug._draw_basic_info = function (self)
	local weapon = self._combat_current_weapon
	local weapon_name = self._combat_current_weapon_name or "-"

	if weapon then
		Imgui.separator()

		if Imgui.tree_node("Basic Information") then
			Imgui.text(string.format("Item Name:     %s", weapon_name))
			Imgui.text(string.format("Template Name: %s", weapon.template))
			Imgui.text(string.format("Left Hand:     %s", weapon.left_hand_unit))
			Imgui.text(string.format("Right Hand:    %s", weapon.right_hand_unit))
			Imgui.separator()
			Imgui.columns(3, true)
			Imgui.text("Damage Profiles")
			Imgui.next_column()
			Imgui.text("left")
			Imgui.next_column()
			Imgui.text("right")
			Imgui.next_column()
			Imgui.separator()

			local damage_actions = self._combat_hit_actions

			for action_name, sub_action in pairs(damage_actions) do
				local action_hand = sub_action and sub_action.weapon_action_hand
				local damage_profile_name_1, damage_profile_name_2 = ActionUtils.get_damage_profile_name(sub_action, action_hand)

				Imgui.text(action_name)
				Imgui.next_column()
				Imgui.text(tostring(damage_profile_name_1))
				Imgui.next_column()
				Imgui.text(tostring(damage_profile_name_2))
				Imgui.next_column()
			end

			Imgui.separator()
			Imgui.columns(7, true)
			Imgui.text("category\\armor type")

			for i = 1, 6 do
				Imgui.next_column()
				Imgui.text(tostring(i))
			end

			Imgui.separator()

			for charge_type, values in pairs(self._armor_modifiers_charge_value) do
				Imgui.next_column()
				Imgui.text(charge_type)

				for i = 1, 6 do
					Imgui.next_column()
					Imgui.text(string.format("%.2f", values[i] or 0))
				end
			end

			Imgui.next_column()
			Imgui.text("total average")

			for i = 1, 6 do
				Imgui.next_column()
				Imgui.text(string.format("%.2f", self._attack_armor_modifiers[i] or 0))
			end

			Imgui.columns(1)
			Imgui.tree_pop()
		end
	end
end

ImguiWeaponDebug._draw_damage_info = function (self)
	Imgui.separator()
	Imgui.text("Damage Information")

	self._combat_pop_settings = Imgui.checkbox("Pop Combat Settings", self._combat_pop_settings)

	if self._combat_pop_settings then
		Imgui.begin_window("Combat Settings (Weapon Debug)")
		self:_update_combat_settings()
		Imgui.end_window()
	else
		self:_update_combat_settings()
	end

	local difficulty_level = self._difficulties[self._damage_difficulty_id]
	local hit_zone_name = self._hit_zone_names[self._damage_hit_zone_id]

	for breed_table_name, breed_table in pairs(self._breed_table) do
		if difficulty_level and hit_zone_name and Imgui.tree_node(breed_table_name) then
			Imgui.separator()
			self:_draw_faction_combat_info(breed_table, difficulty_level, hit_zone_name, self._damage_power_level, self._combat_stagger_level, self._combat_critical, self._combat_backstab_multiplier, self._combat_power_boost)
			Imgui.tree_pop()
		end
	end
end

ImguiWeaponDebug._update_combat_settings = function (self)
	self._combat_use_current_power_level = Imgui.checkbox("Use Current Power Level", self._combat_use_current_power_level)

	if self._combat_use_current_power_level then
		local unit = self._current_unit
		local career_ext = unit and Unit.alive(unit) and ScriptUnit.extension(unit, "career_system")
		local power_level = career_ext and career_ext:get_career_power_level() or min_power_level

		self._damage_power_level = power_level
	end

	self._damage_power_level = math.max(Imgui.input_float("Power Level", self._damage_power_level), min_power_level)
	self._damage_difficulty_id = Imgui.combo("Difficulty", self._damage_difficulty_id, self._difficulties)
	self._damage_hit_zone_id = Imgui.combo("Hit Zone", self._damage_hit_zone_id, self._hit_zone_names)
	self._combat_backstab_multiplier = Imgui.slider_float("Backstab Mult", self._combat_backstab_multiplier, 1, 2)
	self._combat_stagger_level = math.floor(Imgui.slider_float("Stagger Level", self._combat_stagger_level, 0, 3))
	self._combat_critical = Imgui.checkbox("Critical", self._combat_critical)

	Imgui.same_line()

	self._combat_power_boost = Imgui.checkbox("Power Boost", self._combat_power_boost)

	for power_type, _ in pairs(POWER_LEVEL_DIFF_RATIO) do
		local difficulty_level = self._difficulties[self._damage_difficulty_id]
		local scaled_power_level = ActionUtils.scale_power_levels(self._damage_power_level, power_type, self._current_unit, difficulty_level)

		Imgui.text(string.format("Scaled - %-8s: %s", power_type, scaled_power_level))
	end
end

ImguiWeaponDebug._draw_faction_combat_info = function (self, breed_table, difficulty_level, hit_zone_name, power_level, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)
	local start_target_index = 1
	local max_target_index = 8
	local hit_index_format = string.format("%7s%6s", "%2d", "")
	local damage_actions = self._combat_hit_actions
	local push_actions = self._combat_push_actions
	local target_damage = {}
	local target_hits = {}

	for breed_name, _ in pairs(breed_table) do
		Imgui.separator()

		local breed = Breeds[breed_name] or PlayerBreeds[breed_name]
		local armor_type, _, primary_armor_type, _ = ActionUtils.get_target_armor(hit_zone_name, breed, 1)
		local node_name = string.format("Breed: %s (Armor: %d / Primary Armor: %d)", breed_name, armor_type or 0, primary_armor_type or 0)

		if Imgui.tree_node(node_name) then
			local breed_health = self:get_breed_health(difficulty_level, breed)
			local stagger_threshold_light, stagger_threshold_medium, stagger_threshold_heavy = self:get_breed_stagger(difficulty_level, breed)

			Imgui.text(string.format("Health: %.2f", breed_health))
			Imgui.text(string.format("Stagger Thresholds: %.2f / %.2f / %.2f", stagger_threshold_light, stagger_threshold_medium, stagger_threshold_heavy))
			Imgui.separator()
			Imgui.columns(9, true)
			Imgui.text("Hit Index")

			for i = start_target_index, max_target_index do
				Imgui.next_column()
				Imgui.text(i)
			end

			Imgui.separator()

			for action_name, sub_action in pairs(damage_actions) do
				table.clear(target_damage)
				table.clear(target_hits)

				for i = start_target_index, max_target_index do
					local damage = self:get_damage(sub_action, power_level, difficulty_level, hit_zone_name, breed, i, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)
					local hits_to_kill = damage > 0 and math.ceil(breed_health / damage) or 0

					table.insert(target_damage, damage)
					table.insert(target_hits, hits_to_kill)
				end

				Imgui.next_column()
				Imgui.text(action_name)

				for i = 1, #target_damage do
					Imgui.next_column()
					Imgui.text(string.format("%6.2f - %-3d", target_damage[i], target_hits[i]))
				end
			end

			Imgui.columns(1)
			Imgui.dummy(10, 10)
			Imgui.separator()
			Imgui.columns(6, true)
			Imgui.text("Name")
			Imgui.next_column()
			Imgui.text("Type")
			Imgui.next_column()
			Imgui.text("Duration")
			Imgui.next_column()
			Imgui.text("Distance")
			Imgui.next_column()
			Imgui.text("Value")
			Imgui.next_column()
			Imgui.text("Strength")
			Imgui.separator()

			for action_name, damage_profiles in pairs(push_actions) do
				Imgui.next_column()
				Imgui.text(action_name .. " Inner")

				local inner_damage_profile = DamageProfileTemplates[damage_profiles.inner]
				local type, duration, distance, value, strength = self:get_ai_stagger(inner_damage_profile, power_level, difficulty_level, hit_zone_name, breed, 1, is_critical_strike, has_power_boost)

				Imgui.next_column()
				Imgui.text(string.format("%.2f", type))
				Imgui.next_column()
				Imgui.text(string.format("%.2f", duration))
				Imgui.next_column()
				Imgui.text(string.format("%.2f", distance))
				Imgui.next_column()
				Imgui.text(string.format("%.2f", value))
				Imgui.next_column()
				Imgui.text(string.format("%.2f", strength))

				local outer_damage_profile = DamageProfileTemplates[damage_profiles.inner]
				local type, duration, distance, value, strength = self:get_ai_stagger(outer_damage_profile, power_level, difficulty_level, hit_zone_name, breed, 1, is_critical_strike, has_power_boost)

				Imgui.next_column()
				Imgui.text(action_name .. " Outer")
				Imgui.next_column()
				Imgui.text(string.format("%.2f", type))
				Imgui.next_column()
				Imgui.text(string.format("%.2f", duration))
				Imgui.next_column()
				Imgui.text(string.format("%.2f", distance))
				Imgui.next_column()
				Imgui.text(string.format("%.2f", value))
				Imgui.next_column()
				Imgui.text(string.format("%.2f", strength))
			end

			Imgui.columns(1)
			Imgui.tree_pop()
		end
	end
end

ImguiWeaponDebug._get_current_weapon = function (self)
	if not self._display_current_action then
		for name, extension in pairs(self._weapon_extensions) do
			if extension then
				return extension
			end
		end
	end

	if self._current_weapon_extension then
		return self._current_weapon_extension
	else
		for name, extension in pairs(self._weapon_extensions) do
			if extension and extension.current_action_settings then
				return extension
			end
		end
	end

	return nil
end

ImguiWeaponDebug._get_current_action = function (self)
	if not self._display_current_action then
		local selected_action_name = self._selected_action >= 0 and self._action_list[self._selected_action]
		local selected_sub_actions = selected_action_name and self._sub_action_list[selected_action_name] or {}
		local selected_sub_action_name = self._selected_sub_action >= 0 and selected_sub_actions[self._selected_sub_action]
		local action = selected_action_name and self._current_actions[selected_action_name]
		local sub_action = action and action[selected_sub_action_name]

		return sub_action
	end

	if self._current_weapon_extension then
		return self._current_weapon_extension.current_action_settings
	else
		for name, extension in pairs(self._weapon_extensions) do
			if extension and extension.current_action_settings then
				return extension.current_action_settings
			end
		end
	end

	return nil
end

ImguiWeaponDebug.debug_draw_chain_data = function (self, current_time_in_action, action, owner_unit, weapon_extension)
	local gui = Debug.gui
	local width_per_second = 150
	local height = 20
	local row_height = height + 5
	local max_action_length = 5
	local max_size_x = width_per_second * max_action_length
	local max_size_y = row_height * 7 + 20
	local input_name_width = 150
	local seperator_size = 0.25
	local res_x, res_y = RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h
	local start_x = res_x / 2 - (max_size_x - input_name_width) / 2
	local start_y = res_y * 0.25 + max_size_y / 2
	local small_font_size = 12
	local font_size = 16
	local font_color = Color(255, 255, 255, 255)
	local action_time_scale = ActionUtils.get_action_time_scale(owner_unit, action)
	local action_length = action.total_time / ActionUtils.get_action_time_scale(owner_unit, action)
	local action_min_length = weapon_extension:get_scaled_min_hold_time(action)
	local clamped_action_length = math.min(action_length, max_action_length)
	local clamped_time_in_action = math.min(current_time_in_action, clamped_action_length)
	local color = Colors.get_color_with_alpha("black", 150)
	local pos = Vector3(start_x - input_name_width, start_y - max_size_y, 0)
	local size = Vector3(max_size_x + input_name_width, max_size_y, 0)

	Gui.rect(gui, pos, size, color)
	ScriptGUI.hud_line(gui, Vector3(start_x, start_y, 1), Vector3(start_x, start_y - max_size_y, 1), 3, 2, Color(255, 255, 255, 255))

	local action_min_x = start_x + action_min_length * width_per_second

	ScriptGUI.hud_line(gui, Vector3(action_min_x, start_y, 0.5), Vector3(action_min_x, start_y - max_size_y, 0.5), 3, 2, Color(255, 255, 0, 0))
	gui_shadow_text(gui, string.format("%.2f", action_min_length), small_font_size, Vector3(action_min_x + 5, start_y, 0.5), Color(255, 255, 0, 0))

	local max_action_end_x = start_x + max_action_length * width_per_second

	ScriptGUI.hud_line(gui, Vector3(max_action_end_x, start_y, 0.5), Vector3(max_action_end_x, start_y - max_size_y, 0.5), 3, 2, Color(255, 255, 255, 255))

	local action_end_x = start_x + clamped_action_length * width_per_second

	ScriptGUI.hud_line(gui, Vector3(action_end_x, start_y, 1), Vector3(action_end_x, start_y - max_size_y, 1), 3, 2, Color(255, 255, 0, 0))
	gui_shadow_text(gui, string.format("%.2f", action_length), small_font_size, Vector3(action_end_x + 5, start_y, 0.5), Color(255, 255, 0, 0))

	if action.damage_window_start and action.damage_window_end then
		local damage_window_start = action.damage_window_start

		damage_window_start = damage_window_start / action_time_scale

		local damage_window_end = action.damage_window_end or action.total_time or math.huge

		damage_window_end = damage_window_end / action_time_scale

		local damage_start_x = start_x + damage_window_start * width_per_second
		local damage_size_x = (damage_window_end - damage_window_start) * width_per_second

		Gui.rect(gui, Vector3(damage_start_x, start_y - max_size_y, 0), Vector3(damage_size_x, max_size_y, 0), Color(128, 255, 0, 0))
	end

	local num_sperators = math.floor(clamped_action_length / seperator_size)

	for i = 0, num_sperators do
		local x = start_x + i * seperator_size * width_per_second

		ScriptGUI.hud_line(gui, Vector3(x, start_y, 0.1), Vector3(x, start_y - max_size_y, 0.1), 3, 2, Color(50, 255, 255, 255))
		gui_shadow_text(gui, string.format("%.2f", i * seperator_size), small_font_size, Vector3(x, start_y - max_size_y, 0.1), font_color)
	end

	local lookup_data = action.lookup_data

	if lookup_data then
		gui_shadow_text(gui, lookup_data.action_name, small_font_size, Vector3(start_x - input_name_width, start_y + 20, 0.1), font_color)
		gui_shadow_text(gui, lookup_data.sub_action_name, small_font_size, Vector3(start_x - input_name_width, start_y + 5, 0.1), font_color)
	end

	local damage_profile_name = action.damage_profile
	local damage_profile = damage_profile_name and DamageProfileTemplates[damage_profile_name]

	if damage_profile then
		local damge_profile_text_x = start_x + max_size_x + 10
		local damge_profile_text_y = start_y - 15
		local damge_profile_text_row = 15
		local default_target_settings = damage_profile.default_target
		local default_boost_curve_type = default_target_settings and default_target_settings.boost_curve_type

		gui_shadow_text(gui, string.format("[damage profile] %s", damage_profile_name), small_font_size, Vector3(damge_profile_text_x, damge_profile_text_y, 0.1), font_color)

		if default_target_settings then
			gui_shadow_text(gui, string.format("[default] %s", tostring(default_boost_curve_type)), small_font_size, Vector3(damge_profile_text_x, damge_profile_text_y - damge_profile_text_row, 0.1), font_color)
		end

		local target_settings = damage_profile.targets

		for i = 1, #target_settings do
			local target = target_settings[i]
			local boost_curve_type = target and target.boost_curve_type

			gui_shadow_text(gui, string.format("[%d] %s", i, tostring(boost_curve_type)), small_font_size, Vector3(damge_profile_text_x, damge_profile_text_y - damge_profile_text_row * (i + 1), 0.1), font_color)
		end
	end

	local allowed_chain_actions = action.allowed_chain_actions

	for i = 1, #allowed_chain_actions do
		local chain_action = allowed_chain_actions[i]
		local chain_action_name = tostring(chain_action.action) .. "/" .. tostring(chain_action.sub_action)
		local input_name = chain_action.auto_chain and "auto_chain" or tostring(chain_action.input)

		if chain_action.hold_allowed then
			input_name = input_name .. "(hold)"
		end

		local chain_start_time = chain_action.start_time / action_time_scale
		local chain_end_time = chain_action.end_time and chain_action.end_time / action_time_scale or math.huge
		local action_color = clamped_time_in_action < chain_start_time and Colors.get("orange") or chain_end_time <= clamped_time_in_action and Colors.get("red") or Colors.get("green")
		local row_number = i
		local x = start_x + chain_start_time * width_per_second
		local y = start_y - row_number * row_height
		local action_box_pos = Vector3(x, y, 0.1)
		local clamped_chain_end_time = math.min(chain_end_time, max_action_length)
		local width = (clamped_chain_end_time - chain_start_time) * width_per_second
		local action_box_size = Vector3(width, height, 0)

		Gui.rect(gui, action_box_pos, action_box_size, action_color)

		local chain_box_name = chain_action_name .. string.format(" [%.2f - %.2f]", chain_start_time, chain_end_time)

		gui_shadow_text(gui, chain_box_name, font_size, action_box_pos, font_color)

		local action_input_pos = Vector3(start_x - input_name_width, y, 0.1)

		gui_shadow_text(gui, input_name, font_size, action_input_pos, font_color)
	end

	local timeline_start_x = start_x + clamped_time_in_action * width_per_second
	local timeline_start_y = start_y + 10
	local timeline_end_x = timeline_start_x
	local timeline_end_y = timeline_start_y - max_size_y - 20

	ScriptGUI.hud_line(gui, Vector3(timeline_start_x, timeline_start_y, 1), Vector3(timeline_end_x, timeline_end_y, 1), 3, 2, Color(255, 255, 255, 255))
	gui_shadow_text(gui, string.format("%.2f", current_time_in_action), font_size, Vector3(timeline_start_x + 5, timeline_start_y, 1), font_color)
end

ImguiWeaponDebug.get_breed_health = function (self, difficulty_level, breed)
	local breed_health = 0
	local difficulty_settings = DifficultySettings[difficulty_level]

	if difficulty_settings and breed then
		local breed_health_table = breed.max_health
		local difficulty_rank = difficulty_settings.rank

		breed_health = breed_health_table and breed_health_table[difficulty_rank] or 0
	end

	return breed_health
end

ImguiWeaponDebug.get_breed_stagger = function (self, difficulty_level, breed)
	local stagger_threshold_light = 0
	local stagger_threshold_medium = 0
	local stagger_threshold_heavy = 0
	local finesse_hit = false
	local difficulty_settings = DifficultySettings[difficulty_level]

	if difficulty_settings and breed then
		local difficulty_rank = difficulty_settings.rank
		local stagger_resistance = breed.diff_stagger_resist and breed.diff_stagger_resist[difficulty_rank] or breed.stagger_resistance or 2

		stagger_threshold_light = finesse_hit and 0 or breed.stagger_threshold_light and breed.stagger_threshold_light * stagger_resistance or 0.25 * stagger_resistance
		stagger_threshold_medium = breed.stagger_threshold_medium and breed.stagger_threshold_medium * stagger_resistance or 1 * stagger_resistance
		stagger_threshold_heavy = breed.stagger_threshold_heavy and breed.stagger_threshold_heavy * stagger_resistance or 2.5 * stagger_resistance
	end

	return stagger_threshold_light, stagger_threshold_medium, stagger_threshold_heavy
end

ImguiWeaponDebug.get_damage = function (self, sub_action, power_level, difficulty_level, hit_zone_name, breed, target_index, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)
	local unit = self._current_unit
	local item = self._combat_current_weapon

	if item and unit and sub_action and breed then
		local action_hand = sub_action.weapon_action_hand

		if action_hand == "both" and self._selected_weapon_extenstion_name ~= "any" then
			action_hand = self._selected_weapon_extenstion_name
		end

		local damage_profile_name_left, damage_profile_name_right = ActionUtils.get_damage_profile_name(sub_action, action_hand)
		local damage_profile_left = damage_profile_name_left and DamageProfileTemplates[damage_profile_name_left]
		local damage_profile_right = damage_profile_name_right and DamageProfileTemplates[damage_profile_name_right]
		local difficulty_settings = DifficultySettings[difficulty_level]

		if difficulty_settings then
			local damage_left = 0
			local damage_right = 0

			if damage_profile_left then
				damage_left = self:_calculate_damage(unit, item, damage_profile_left, difficulty_settings, power_level, difficulty_level, hit_zone_name, breed, target_index, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)
			end

			if damage_profile_right then
				damage_right = self:_calculate_damage(unit, item, damage_profile_right, difficulty_settings, power_level, difficulty_level, hit_zone_name, breed, target_index, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)
			end

			local damage = damage_left + damage_right

			return damage
		end
	end

	return 0
end

ImguiWeaponDebug.get_ai_stagger = function (self, damage_profile, power_level, difficulty_level, hit_zone_name, breed, target_index, is_critical_strike, has_power_boost)
	local unit = self._current_unit
	local item = self._combat_current_weapon

	if item and unit and damage_profile and breed then
		return self:_calculate_ai_stagger(unit, item, damage_profile, power_level, difficulty_level, hit_zone_name, breed, target_index, is_critical_strike, has_power_boost)
	end

	return 0, 0, 0, 0, 0
end

ImguiWeaponDebug._calculate_damage = function (self, unit, item, damage_profile, difficulty_settings, power_level, difficulty_level, hit_zone_name, breed, target_index, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)
	local damage_source = item.name
	local boost_damage_multiplier
	local range_scalar_multiplier = 0

	if damage_profile.no_stagger_damage_reduction_ranged then
		local stagger_number_override = 1

		stagger_level = math.max(stagger_number_override, stagger_level)
	end

	local damage = DamageUtils.custom_calculate_damage(unit, damage_source, power_level, damage_profile, target_index, range_scalar_multiplier, is_critical_strike, backstab_multiplier, has_power_boost, boost_damage_multiplier, breed, hit_zone_name, stagger_level, difficulty_level)

	damage = DamageUtils.networkify_damage(damage)

	return damage
end

ImguiWeaponDebug._calculate_ai_stagger = function (self, unit, item, damage_profile, power_level, difficulty_level, hit_zone_name, breed, target_index, is_critical_strike, has_power_boost)
	local blocked = false
	local damage_source = item.name
	local range_scalar_multiplier = 0
	local type, duration, distance, value, strength = DamageUtils.calculate_stagger_player_tooltip(breed, unit, hit_zone_name, power_level, is_critical_strike, damage_profile, target_index, blocked, damage_source, difficulty_level, has_power_boost, range_scalar_multiplier)

	return type, duration, distance, value, strength
end

ImguiWeaponDebug._get_damage_profile_for_action = function (self, sub_action)
	if sub_action then
		local action_hand = sub_action.weapon_action_hand

		if action_hand == "both" and self._selected_weapon_extenstion_name ~= "any" then
			action_hand = self._selected_weapon_extenstion_name
		end

		return ActionUtils.get_damage_profile_name(sub_action, action_hand)
	end

	return nil, nil
end

ImguiWeaponDebug._verify_crits = function (self)
	print("STARTING TEST: verify_crits")

	local unit = self._current_unit
	local item = ItemMasterList.we_1h_axe
	local difficulty_level = "normal"
	local difficulty_settings = DifficultySettings[difficulty_level]
	local power_level = 300
	local target_index = 1
	local stagger_level = 0
	local backstab_multiplier
	local dummy_unit_armor = 1
	local damage_profile_exclusion_list = table.mirror_array_inplace({
		"tutorial_longbow_charged",
	})
	local breed_exclusion_list = table.mirror_array_inplace({
		"chaos_raider",
		"chaos_raider_tutorial",
		"chaos_dummy_sorcerer",
		"chaos_dummy_exalted_sorcerer_drachenfels",
		"skaven_stormfiend",
		"skaven_stormfiend_demo",
		"skaven_stormfiend_boss",
	})
	local hit_zones = {
		"head",
		"torso",
	}

	for damage_profile_name, damage_profile in pairs(DamageProfileTemplates) do
		local valid_damage_profile = not string.ends_with(damage_profile_name, "_no_damage") and not damage_profile_exclusion_list[damage_profile_name]

		if valid_damage_profile then
			for breed_table_name, breed_table in pairs(self._breed_table) do
				for breed_name, _ in pairs(breed_table) do
					if not breed_exclusion_list[breed_name] then
						local breed = Breeds[breed_name]
						local hit_zone_name = hit_zones[1]
						local is_critical_strike = false
						local has_power_boost = false
						local normal_dmg = self:_calculate_damage(unit, item, damage_profile, difficulty_settings, power_level, difficulty_level, hit_zone_name, breed, target_index, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)

						is_critical_strike = true
						has_power_boost = false

						local crit_dmg = self:_calculate_damage(unit, item, damage_profile, difficulty_settings, power_level, difficulty_level, hit_zone_name, breed, target_index, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)

						is_critical_strike = false
						has_power_boost = true

						local power_dmg = self:_calculate_damage(unit, item, damage_profile, difficulty_settings, power_level, difficulty_level, hit_zone_name, breed, target_index, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)

						is_critical_strike = true
						has_power_boost = true

						local power_crit_dmg = self:_calculate_damage(unit, item, damage_profile, difficulty_settings, power_level, difficulty_level, hit_zone_name, breed, target_index, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)

						hit_zone_name = hit_zones[2]

						local is_critical_strike = false
						local has_power_boost = false
						local normal_dmg_torso = self:_calculate_damage(unit, item, damage_profile, difficulty_settings, power_level, difficulty_level, hit_zone_name, breed, target_index, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)

						is_critical_strike = true
						has_power_boost = false

						local crit_dmg_torso = self:_calculate_damage(unit, item, damage_profile, difficulty_settings, power_level, difficulty_level, hit_zone_name, breed, target_index, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)

						is_critical_strike = false
						has_power_boost = true

						local power_dmg_torso = self:_calculate_damage(unit, item, damage_profile, difficulty_settings, power_level, difficulty_level, hit_zone_name, breed, target_index, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)

						is_critical_strike = true
						has_power_boost = true

						local power_crit_dmg_torso = self:_calculate_damage(unit, item, damage_profile, difficulty_settings, power_level, difficulty_level, hit_zone_name, breed, target_index, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)
						local armor_type, _, primary_armor_type, _ = ActionUtils.get_target_armor(hit_zone_name, breed, dummy_unit_armor)

						armor_type = armor_type or 0
						primary_armor_type = primary_armor_type or 0

						if crit_dmg < normal_dmg then
							print(string.format("%s / %s (%s)(%d/%d) Crit dealt less damage - normal %.2f, crit %.2f", damage_profile_name, breed_name, hit_zone_name, armor_type, primary_armor_type, normal_dmg, crit_dmg))
						end

						if power_dmg < normal_dmg then
							print(string.format("%s / %s (%s)(%d/%d) Power boosted attack dealt less damage - normal %.2f, power boosted %.2f", damage_profile_name, breed_name, hit_zone_name, armor_type, primary_armor_type, normal_dmg, power_dmg))
						end

						if power_crit_dmg < power_dmg then
							print(string.format("%s / %s (%s)(%d/%d) Power boosted crit attack dealt less damage - power booster %.2f, power boosted crit %.2f", damage_profile_name, breed_name, hit_zone_name, armor_type, primary_armor_type, power_dmg, power_crit_dmg))
						end

						if normal_dmg < normal_dmg_torso then
							print(string.format("%s / %s (%s)(%d/%d) More dmg on torso than head - NORMAL torso %.2f, head %.2f", damage_profile_name, breed_name, hit_zone_name, armor_type, primary_armor_type, normal_dmg_torso, normal_dmg))
						end

						if crit_dmg < crit_dmg_torso then
							print(string.format("%s / %s (%s)(%d/%d) More dmg on torso than head - CRIT torso %.2f, head %.2f", damage_profile_name, breed_name, hit_zone_name, armor_type, primary_armor_type, crit_dmg_torso, crit_dmg))
						end

						if power_dmg < power_dmg_torso then
							print(string.format("%s / %s (%s)(%d/%d) More dmg on torso than head - POWER torso %.2f, head %.2f", damage_profile_name, breed_name, hit_zone_name, armor_type, primary_armor_type, power_dmg_torso, power_dmg))
						end

						if power_crit_dmg < power_crit_dmg_torso then
							print(string.format("%s / %s (%s)(%d/%d) More dmg on torso than head - POWER CRIT torso %.2f, head %.2f", damage_profile_name, breed_name, hit_zone_name, armor_type, primary_armor_type, power_crit_dmg_torso, power_crit_dmg))
						end
					end
				end
			end
		end
	end

	print("Done!")
end

ImguiWeaponDebug._dump_weapon_performance = function (self)
	for weapon_name in pairs(Weapons) do
		print(weapon_name)

		local template = WeaponUtils.get_weapon_template(weapon_name)
		local used_actions = WeaponUtils.get_used_actions(template)

		for action_name, action in pairs(used_actions) do
			local weapon_actions = template.actions[action_name]

			for sub_action_name, _ in pairs(action) do
				local performance_scores = ActionUtils.get_damage_profile_performance_scores(nil)
				local left, right = self:_get_damage_profile_for_action(weapon_actions[sub_action_name])

				if right then
					local right_peft = ActionUtils.get_damage_profile_performance_scores(right)

					for i = 1, #performance_scores do
						performance_scores[i] = performance_scores[i] + right_peft[i]
					end
				end

				if left then
					local left_perf = ActionUtils.get_damage_profile_performance_scores(left)

					for i = 1, #performance_scores do
						performance_scores[i] = performance_scores[i] + left_perf[i]
					end
				end

				local type_score_text = ""

				for i = 1, #performance_scores do
					type_score_text = type_score_text .. string.format("[%i] %.3f ", i, performance_scores[i])
				end

				print(string.format("%s.%s - %s", action_name, sub_action_name, type_score_text))
			end
		end
	end
end

ImguiWeaponDebug._check_missing_unused_actions = function (self)
	local ignored_unused_actions = {
		weapon_reload = {
			auto_reload_on_empty = true,
		},
		action_two = {
			give_item = true,
		},
	}

	print("CHECKING FOR MISSING OR UNUSED ACTIONS")

	for name in pairs(Weapons) do
		local template = WeaponUtils.get_weapon_template(weapon_name)
		local used_actions, missing_actions = WeaponUtils.get_used_actions(template)

		for action_name, action in pairs(missing_actions) do
			for sub_action_name, _ in pairs(action) do
				print(string.format("Missing referenced action [%s.%s] in template [%s]", action_name, sub_action_name, name))
			end
		end

		for action_name, action in pairs(template.actions) do
			local current_actions = used_actions[action_name]

			if not current_actions then
				print(string.format("Unused action [%s] in template [%s]", action_name, name))
			else
				for sub_action_name, _ in pairs(action) do
					if (not ignored_unused_actions[action_name] or not ignored_unused_actions[action_name][sub_action_name]) and not current_actions[sub_action_name] then
						print(string.format("Unused sub-action [%s.%s] in template [%s]", action_name, sub_action_name, name))
					end
				end
			end
		end
	end

	print("DONE")
end
