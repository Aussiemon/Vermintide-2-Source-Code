ImguiWeaponDebug = class(ImguiWeaponDebug)
local SHOULD_RELOAD = true
local min_power_level = 5

ImguiWeaponDebug.init = function (self)
	self._draw_hit_box = false
	self._draw_chain_action_data = true
	self._display_current_action = true
	self._action_list = {}
	self._sub_action_list = {}
	self._selected_action = 0
	self._selected_sub_action = 0
	self._unit_names = {}
	self._units = {}
	self._selected_unit = -1
	self._weapon_extensions = {}
	self._selected_weapon_extenstion_name = ""
	self._current_unit = nil
	self._current_weapon_extension = nil
	self._current_actions = nil
	self._damage_power_level = 200
	self._damage_hit_zone_id = 0
	self._damage_difficulty_id = 0
	self._hit_zone_names = {
		"head",
		"neck",
		"torso",
		"left_arm",
		"right_arm",
		"left_leg",
		"right_leg",
		"full"
	}
	self._difficulties = table.clone(Difficulties)
	self._breed_table = {
		Chaos = CHAOS,
		Skaven = SKAVEN,
		Beastmen = BEASTMEN,
		Elites = ELITES
	}
	self._combat_critical = false
	self._combat_power_boost = false
	self._combat_use_current_power_level = true
	self._combat_backstab_multiplier = 1
	self._combat_stagger_level = 0

	self:_refresh_unit_list()
end

ImguiWeaponDebug.update = function (self)
	if SHOULD_RELOAD then
		self:init()

		SHOULD_RELOAD = false
	end

	if self._current_unit and not Unit.alive(self._current_unit) then
		self._current_unit = nil
		self._current_weapon_extension = nil

		self:_refresh_unit_list()
	end

	Imgui.Begin("Weapon Debug")

	local selected_unit = Imgui.Combo("Unit", self._selected_unit, self._unit_names) - 1

	if selected_unit ~= self._selected_unit then
		self._selected_unit = selected_unit

		self:_initialize_unit(self._units[selected_unit + 1])
	end

	Imgui.SameLine()

	if Imgui.Button("Refresh") then
		self:_refresh_unit_list()
	end

	script_data.debug_weapons = Imgui.Checkbox("Draw Hit Box", script_data.debug_weapons)

	Imgui.SameLine()

	self._draw_chain_action_data = Imgui.Checkbox("Draw Action Chain", self._draw_chain_action_data)

	Imgui.SameLine()

	self._display_current_action = Imgui.Checkbox("Use Current Action", self._display_current_action)

	if not self._display_current_action then
		self._selected_action = Imgui.Combo("Action", self._selected_action, self._action_list) - 1
		local selected_action_name = self._selected_action >= 0 and self._action_list[self._selected_action + 1]
		local selected_sub_actions = (selected_action_name and self._sub_action_list[selected_action_name]) or {}
		self._selected_sub_action = Imgui.Combo("Sub Action", self._selected_sub_action, selected_sub_actions) - 1
	end

	local _first_weapon_entry = true

	for name, weapon in pairs(self._weapon_extensions) do
		if not _first_weapon_entry then
			Imgui.SameLine()
		end

		if name == "any" then
			weapon = nil
		end

		if Imgui.RadioButton(name, weapon == self._current_weapon_extension) then
			self._current_weapon_extension = weapon
			self._selected_weapon_extenstion_name = name
		end

		_first_weapon_entry = false
	end

	self:_draw_basic_info()
	self:_draw_damage_info()
	Imgui.End()
end

ImguiWeaponDebug.subwindow_count = function (self)
	return (self:_should_update() and 1) or 0
end

ImguiWeaponDebug.update_subwindow = function (self)
	if self._current_unit and not Unit.alive(self._current_unit) then
		self._current_unit = nil
		self._current_weapon_extension = nil

		self:_refresh_unit_list()
	end

	local owner_unit = self._current_unit
	local weapon_extension = self:_get_current_weapon()

	if owner_unit and weapon_extension and self._current_actions then
		local action = self:_get_current_action()

		if action then
			local current_time_in_action = (self._display_current_action and weapon_extension.weapon_system.t - weapon_extension.action_time_started) or 0

			if self._draw_chain_action_data and action then
				self:debug_draw_chain_data(current_time_in_action, action, owner_unit, weapon_extension)
			end
		end
	end
end

ImguiWeaponDebug._should_update = function (self)
	return self._draw_chain_action_data or self._draw_hit_box
end

ImguiWeaponDebug._refresh_unit_list = function (self)
	self._unit_names = {}
	self._units = {}
	self._selected_unit = -1

	table.insert(self._unit_names, "none")
	table.insert(self._units, false)

	local player_manager = Managers.player
	local players = player_manager:human_and_bot_players()

	for id, player in pairs(players) do
		if player then
			local profile_display_name = player:profile_display_name()

			table.insert(self._unit_names, profile_display_name)
			table.insert(self._units, player.player_unit)

			if player.local_player then
				self._selected_unit = #self._unit_names - 1

				self:_initialize_unit(player.player_unit)
			end
		end
	end
end

ImguiWeaponDebug._initialize_unit = function (self, unit)
	self._current_unit = unit
	self._weapon_extensions = {}
	self._current_weapon_extension = nil
	self._selected_weapon_extenstion_name = "any"
	self._action_list = {}
	self._sub_action_list = {}
	self._current_actions = {}

	if unit then
		local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")
		local lh_weapon_unit, rh_weapon_unit = inventory_extension:get_all_weapon_unit()
		local lh_weapon_extension = Unit.alive(lh_weapon_unit) and ScriptUnit.extension(lh_weapon_unit, "weapon_system")
		local rh_weapon_extension = Unit.alive(rh_weapon_unit) and ScriptUnit.extension(rh_weapon_unit, "weapon_system")
		self._weapon_extensions.left = lh_weapon_extension
		self._weapon_extensions.right = rh_weapon_extension
		self._weapon_extensions.any = lh_weapon_extension
		local extension = lh_weapon_extension or rh_weapon_extension

		if extension then
			local weapon = ItemMasterList[extension.item_name]
			local template = Weapons[weapon.template]
			local actions = template.actions
			self._current_actions = actions

			for name, action in pairs(actions) do
				table.insert(self._action_list, name)

				if not self._sub_action_list[name] then
					self._sub_action_list[name] = {}
				end

				local sub_action_list = self._sub_action_list[name]

				for sub_name, sub_action in pairs(action) do
					table.insert(sub_action_list, sub_name)
				end

				table.sort(sub_action_list)
			end

			table.sort(self._action_list)
		end
	end
end

ImguiWeaponDebug._draw_basic_info = function (self)
	local weapon_extension = self:_get_current_weapon()

	if self._current_unit and weapon_extension then
		local owner_unit = self._current_unit
		local weapon = ItemMasterList[weapon_extension.item_name]

		Imgui.Separator()
		Imgui.Text("Basic Information")
		Imgui.Text(string.format("Item Name:     %s", weapon_extension.item_name))
		Imgui.Text(string.format("Template Name: %s", weapon.template))
		Imgui.Text(string.format("Left Hand:     %s", weapon.left_hand_unit))
		Imgui.Text(string.format("Right Hand:    %s", weapon.right_hand_unit))
	end
end

ImguiWeaponDebug._draw_damage_info = function (self)
	Imgui.Separator()
	Imgui.Text("Damage Information")

	self._combat_use_current_power_level = Imgui.Checkbox("Use Current Power Level", self._combat_use_current_power_level)

	if self._combat_use_current_power_level then
		local unit = self._current_unit
		local career_ext = unit and Unit.alive(unit) and ScriptUnit.extension(unit, "career_system")
		local power_level = (career_ext and career_ext:get_career_power_level()) or min_power_level
		self._damage_power_level = power_level
	end

	self._damage_power_level = math.max(Imgui.InputFloat("Power Level", self._damage_power_level), min_power_level)
	self._damage_difficulty_id = Imgui.Combo("Difficulty", self._damage_difficulty_id, self._difficulties) - 1
	self._damage_hit_zone_id = Imgui.Combo("Hit Zone", self._damage_hit_zone_id, self._hit_zone_names) - 1
	local difficulty_level = self._difficulties[self._damage_difficulty_id + 1]
	local hit_zone_name = self._hit_zone_names[self._damage_hit_zone_id + 1]
	self._combat_backstab_multiplier = Imgui.SliderFloat("Backstab Mult", self._combat_backstab_multiplier, 1, 2)
	self._combat_stagger_level = math.floor(Imgui.SliderFloat("Stagger Level", self._combat_stagger_level, 0, 3))
	self._combat_critical = Imgui.Checkbox("Critical", self._combat_critical)

	Imgui.SameLine()

	self._combat_power_boost = Imgui.Checkbox("Power Boost", self._combat_power_boost)
	local action = self:_get_current_action()
	local action_hand = action and action.weapon_action_hand
	local damage_profile_name_1, damage_profile_name_2 = self:_get_damage_profile_name(action, action_hand)

	Imgui.Text(string.format("Damage Profile: %s / %s", tostring(damage_profile_name_1), tostring(damage_profile_name_2)))

	for breed_table_name, breed_table in pairs(self._breed_table) do
		if difficulty_level and hit_zone_name and Imgui.TreeNode(breed_table_name) then
			self:_draw_faction_combat_info(breed_table, difficulty_level, hit_zone_name, self._damage_power_level, self._combat_stagger_level, self._combat_critical, self._combat_backstab_multiplier, self._combat_power_boost)
			Imgui.TreePop()
		end
	end
end

ImguiWeaponDebug._draw_faction_combat_info = function (self, breed_table, difficulty_level, hit_zone_name, power_level, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)
	local start_target_index = 1
	local max_target_index = 8
	local target_damage = {}
	local target_hits = {}

	for breed_name, _ in pairs(breed_table) do
		local breed = Breeds[breed_name]
		local armor_type, _, primary_armor_type, _ = ActionUtils.get_target_armor(hit_zone_name, breed, 1)
		local node_name = string.format("Breed: %s (Armor: %d / Primary Armor: %d)", breed_name, armor_type or 0, primary_armor_type or 0)

		if Imgui.TreeNode(node_name) then
			table.clear(target_damage)
			table.clear(target_hits)

			local max_health = 0

			for i = start_target_index, max_target_index, 1 do
				local damage, hits = nil
				damage, max_health, hits = self:get_damage(power_level, difficulty_level, hit_zone_name, breed, i, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)

				table.insert(target_damage, damage)
				table.insert(target_hits, hits)
			end

			Imgui.Text(string.format("Health:    %6.2f", max_health))
			Imgui.Text(string.format("Hit Index:", max_health))

			for i = 1, #target_damage, 1 do
				Imgui.SameLine()
				Imgui.Text(string.format("%6d", i))
			end

			Imgui.Text(string.format("Damage:   "))

			for i = 1, #target_damage, 1 do
				Imgui.SameLine()
				Imgui.Text(string.format("%6.2f", target_damage[i]))
			end

			Imgui.Text(string.format("Hits:     "))

			for i = 1, #target_hits, 1 do
				Imgui.SameLine()
				Imgui.Text(string.format("%6d", target_hits[i]))
			end

			Imgui.TreePop()
		end

		Imgui.Separator()
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
		local selected_action_name = self._selected_action >= 0 and self._action_list[self._selected_action + 1]
		local selected_sub_actions = (selected_action_name and self._sub_action_list[selected_action_name]) or {}
		local selected_sub_action_name = self._selected_sub_action >= 0 and selected_sub_actions[self._selected_sub_action + 1]
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
	local res_x = RESOLUTION_LOOKUP.res_w
	local res_y = RESOLUTION_LOOKUP.res_h
	local start_x = res_x / 2 - (max_size_x - input_name_width) / 2
	local start_y = res_y * 0.25 + max_size_y / 2
	local font_size = 16
	local font = "gw_arial_16"
	local font_mtrl = "materials/fonts/" .. font
	local font_color = Color(255, 255, 255, 255)
	local chain_time_scale = action.anim_time_scale or 1
	chain_time_scale = ActionUtils.apply_attack_speed_buff(chain_time_scale, owner_unit)
	chain_time_scale = ActionUtils.apply_charge_speed_buff_chain_window(chain_time_scale, owner_unit, action)
	local action_length = action.total_time
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
	Gui.text(gui, string.format("%.2f", action_min_length), font_mtrl, 12, font, Vector3(action_min_x + 5, start_y, 0.5), Color(255, 255, 0, 0))

	local max_action_end_x = start_x + max_action_length * width_per_second

	ScriptGUI.hud_line(gui, Vector3(max_action_end_x, start_y, 0.5), Vector3(max_action_end_x, start_y - max_size_y, 0.5), 3, 2, Color(255, 255, 255, 255))

	local action_end_x = start_x + clamped_action_length * width_per_second

	ScriptGUI.hud_line(gui, Vector3(action_end_x, start_y, 1), Vector3(action_end_x, start_y - max_size_y, 1), 3, 2, Color(255, 255, 0, 0))
	Gui.text(gui, string.format("%.2f", action_length), font_mtrl, 12, font, Vector3(action_end_x + 5, start_y, 0.5), Color(255, 255, 0, 0))

	if action.damage_window_start and action.damage_window_end then
		local anim_time_scale = action.anim_time_scale or 1
		anim_time_scale = ActionUtils.apply_attack_speed_buff(anim_time_scale, owner_unit)
		local damage_window_start = action.damage_window_start
		damage_window_start = damage_window_start / anim_time_scale
		local damage_window_end = action.damage_window_end or action.total_time or math.huge
		damage_window_end = damage_window_end / anim_time_scale
		local damage_start_x = start_x + damage_window_start * width_per_second
		local damage_size_x = (damage_window_end - damage_window_start) * width_per_second

		Gui.rect(gui, Vector3(damage_start_x, start_y - max_size_y, 0), Vector3(damage_size_x, max_size_y, 0), Color(128, 255, 0, 0))
	end

	local num_sperators = math.floor(clamped_action_length / seperator_size)

	for i = 0, num_sperators, 1 do
		local x = start_x + i * seperator_size * width_per_second

		ScriptGUI.hud_line(gui, Vector3(x, start_y, 0.1), Vector3(x, start_y - max_size_y, 0.1), 3, 2, Color(50, 255, 255, 255))
		Gui.text(gui, string.format("%.2f", i * seperator_size), font_mtrl, 12, font, Vector3(x, start_y - max_size_y, 0.1), font_color)
	end

	local lookup_data = action.lookup_data

	if lookup_data then
		Gui.text(gui, lookup_data.action_name, font_mtrl, 12, font, Vector3(start_x - input_name_width, start_y + 20, 0.1), font_color)
		Gui.text(gui, lookup_data.sub_action_name, font_mtrl, 12, font, Vector3(start_x - input_name_width, start_y + 5, 0.1), font_color)
	end

	local damage_profile_name = action.damage_profile
	local damage_profile = damage_profile_name and DamageProfileTemplates[damage_profile_name]

	if damage_profile then
		local damge_profile_text_x = start_x + max_size_x + 10
		local damge_profile_text_y = start_y - 15
		local damge_profile_text_row = 15
		local default_target_settings = damage_profile.default_target
		local default_boost_curve_type = default_target_settings and default_target_settings.boost_curve_type

		Gui.text(gui, string.format("[damage profile] %s", damage_profile_name), font_mtrl, 12, font, Vector3(damge_profile_text_x, damge_profile_text_y, 0.1), font_color)

		if default_target_settings then
			Gui.text(gui, string.format("[default] %s", tostring(default_boost_curve_type)), font_mtrl, 12, font, Vector3(damge_profile_text_x, damge_profile_text_y - damge_profile_text_row, 0.1), font_color)
		end

		local target_settings = damage_profile.targets

		for i = 1, #target_settings, 1 do
			local target = target_settings[i]
			local boost_curve_type = target and target.boost_curve_type

			Gui.text(gui, string.format("[%d] %s", i, tostring(boost_curve_type)), font_mtrl, 12, font, Vector3(damge_profile_text_x, damge_profile_text_y - damge_profile_text_row * (i + 1), 0.1), font_color)
		end
	end

	local allowed_chain_actions = action.allowed_chain_actions

	for i = 1, #allowed_chain_actions, 1 do
		local chain_action = allowed_chain_actions[i]
		local chain_action_name = tostring(chain_action.action) .. "/" .. tostring(chain_action.sub_action)
		local input_name = (chain_action.auto_chain and "auto_chain") or tostring(chain_action.input)
		local chain_start_time = chain_action.start_time / chain_time_scale
		local chain_end_time = (chain_action.end_time and chain_action.end_time / chain_time_scale) or math.huge
		local action_color = (clamped_time_in_action < chain_start_time and Colors.get("orange")) or (chain_end_time <= clamped_time_in_action and Colors.get("red")) or Colors.get("green")
		local row_number = i
		local x = start_x + chain_start_time * width_per_second
		local y = start_y - row_number * row_height
		local action_box_pos = Vector3(x, y, 0.1)
		local clamped_chain_end_time = math.min(chain_end_time, max_action_length)
		local width = (clamped_chain_end_time - chain_start_time) * width_per_second
		local action_box_size = Vector3(width, height, 0)

		Gui.rect(gui, action_box_pos, action_box_size, action_color)

		local chain_box_name = chain_action_name .. string.format(" [%.2f - %.2f]", chain_start_time, chain_end_time)

		Gui.text(gui, chain_box_name, font_mtrl, font_size, font, action_box_pos, font_color)

		local action_input_pos = Vector3(start_x - input_name_width, y, 0.1)

		Gui.text(gui, input_name, font_mtrl, font_size, font, action_input_pos, font_color)
	end

	local timeline_start_x = start_x + clamped_time_in_action * width_per_second
	local timeline_start_y = start_y + 10
	local timeline_end_x = timeline_start_x
	local timeline_end_y = timeline_start_y - max_size_y - 20

	ScriptGUI.hud_line(gui, Vector3(timeline_start_x, timeline_start_y, 1), Vector3(timeline_end_x, timeline_end_y, 1), 3, 2, Color(255, 255, 255, 255))
	Gui.text(gui, string.format("%.2f", current_time_in_action), font_mtrl, font_size, font, Vector3(timeline_start_x + 5, timeline_start_y, 1), font_color)
end

ImguiWeaponDebug.get_damage = function (self, power_level, difficulty_level, hit_zone_name, breed, target_index, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)
	local unit = self._current_unit
	local item = self:_get_current_item()
	local action = self:_get_current_action()

	if item and unit and action and breed then
		local action_hand = action.weapon_action_hand

		if action_hand == "both" and self._selected_weapon_extenstion_name ~= "any" then
			action_hand = self._selected_weapon_extenstion_name
		end

		local damage_profile_name_left, damage_profile_name_right = self:_get_damage_profile_name(action, action_hand)
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
			local breed_health_table = breed.max_health
			local difficulty_rank = difficulty_settings.rank
			local breed_health = (breed_health_table and breed_health_table[difficulty_rank]) or 0
			local hits_to_kill = (damage > 0 and math.ceil(breed_health / damage)) or 0

			return damage, breed_health, hits_to_kill
		end
	end

	return 0, 0, 0
end

ImguiWeaponDebug._calculate_damage = function (self, unit, item, damage_profile, difficulty_settings, power_level, difficulty_level, hit_zone_name, breed, target_index, stagger_level, is_critical_strike, backstab_multiplier, has_power_boost)
	local damage_source = item.name
	local target_settings = (damage_profile.targets and damage_profile.targets[target_index]) or damage_profile.default_target
	local boost_curve = BoostCurves[target_settings.boost_curve_type]
	local boost_damage_multiplier = nil
	local dropoff_scalar = 0
	local dummy_unit_armor = 1
	local armor_type, _, primary_armor_type, _ = ActionUtils.get_target_armor(hit_zone_name, breed, dummy_unit_armor)
	local damage = DamageUtils.calculate_damage_tooltip(unit, damage_source, power_level, hit_zone_name, damage_profile, target_index, boost_curve, boost_damage_multiplier, is_critical_strike, backstab_multiplier, breed, dropoff_scalar, has_power_boost, difficulty_level, armor_type, primary_armor_type)
	damage = self:_add_stagger_damage(damage, difficulty_settings, damage_profile, stagger_level)

	return damage
end

ImguiWeaponDebug._add_stagger_damage = function (self, damage, difficulty_settings, damage_profile, stagger_number)
	if damage_profile and difficulty_settings then
		local min_stagger_damage_coefficient = difficulty_settings.min_stagger_damage_coefficient
		local stagger_damage_multiplier = difficulty_settings.stagger_damage_multiplier

		if stagger_damage_multiplier then
			if damage_profile.no_stagger_damage_reduction_ranged then
				local stagger_number_override = 1
				stagger_number = math.max(stagger_number_override, stagger_number)
			end

			local bonus_damage_percentage = stagger_number * stagger_damage_multiplier
			local stagger_damage = damage * (min_stagger_damage_coefficient + bonus_damage_percentage)

			return stagger_damage
		end
	end

	return damage
end

ImguiWeaponDebug._get_current_item = function (self)
	local weapon_extension = self:_get_current_weapon()

	if weapon_extension then
		return ItemMasterList[weapon_extension.item_name]
	end

	return nil
end

ImguiWeaponDebug._get_damage_profile_name = function (self, action, action_hand)
	if action then
		local impact_data = action.impact_data
		local damage_profile_name_either = (impact_data and impact_data.damage_profile) or action.damage_profile
		local damage_profile_name_left = (impact_data and impact_data.damage_profile_left) or action.damage_profile_left
		local damage_profile_name_right = (impact_data and impact_data.damage_profile_right) or action.damage_profile_right

		if action_hand == "both" then
			return damage_profile_name_left, damage_profile_name_right
		end

		if action_hand == "left" then
			local damage_profile_name = damage_profile_name_either or damage_profile_name_left

			return damage_profile_name, nil
		end

		if action_hand == "right" then
			local damage_profile_name = damage_profile_name_either or damage_profile_name_right

			return nil, damage_profile_name
		end

		return nil, damage_profile_name_either
	end

	return nil, nil
end

return
