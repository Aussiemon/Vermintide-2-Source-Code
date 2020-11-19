ImguiBuffsDebug = class(ImguiBuffsDebug)
local SHOULD_RELOAD = true

ImguiBuffsDebug.init = function (self)
	self._buff_system = nil
	self._unit_names = {}
	self._units = {}
	self._selected_unit = -1
	self._stat_base_value = 1
	self._filter_text = ""
	self._buff_list = {}
	self._filtered_buff_list = {}
	self._selected_buff_id = 0
	self._buff_advanced_params_enabled = false
	self._buff_bonus_enabled = false
	self._buff_multiplier_enabled = false
	self._buff_value_enabled = false
	self._buff_proc_chance_enabled = false
	self._buff_duration_enabled = false
	self._buff_range_enabled = false
	self._buff_bonus = 0
	self._buff_multiplier = 0
	self._buff_value = 0
	self._buff_proc_chance = 0
	self._buff_duration = 0
	self._buff_range = 0
	self._buff_power_level = 0
	self._current_unit = nil
	self._buff_extension = nil

	self:_get_buff_templates()

	self._filtered_buff_list = self:_apply_buff_filter(self._filter_text, self._buff_list)
end

ImguiBuffsDebug._get_buff_templates = function (self)
	table.clear(self._buff_list)

	for name, template in pairs(BuffTemplates) do
		table.insert(self._buff_list, name)
	end

	table.sort(self._buff_list)

	self._selected_buff_id = 0
end

ImguiBuffsDebug._apply_buff_filter = function (self, filter_text, buff_list)
	if filter_text == "" then
		return buff_list
	end

	local filtered_list = {}
	local search_string = string.gsub(filter_text, "[_ ]", "")

	for i = 1, #buff_list, 1 do
		local buff = buff_list[i]
		local search_buff_name = string.gsub(buff, "[_ ]", "")

		if search_buff_name:find(search_string, 1, true) then
			table.insert(filtered_list, buff)
		end
	end

	return filtered_list
end

ImguiBuffsDebug.update = function (self)
	if SHOULD_RELOAD then
		self:init()

		SHOULD_RELOAD = false
	end

	if self._current_unit and not Unit.alive(self._current_unit) then
		self._current_unit = nil

		self:_refresh_unit_list()
	end
end

ImguiBuffsDebug.is_persistent = function (self)
	return true
end

ImguiBuffsDebug.draw = function (self, is_open)
	Imgui.Begin("Buff Debug")
	self:_update_controls()

	local buffs = self._buff_extension and self._buff_extension._buffs
	local stat_buffs = self._buff_extension and self._buff_extension._stat_buffs
	local event_buffs = self._buff_extension and self._buff_extension._event_buffs

	self:_display_buffs(buffs)
	self:_display_perks(buffs)
	self:_display_stat_buffs(stat_buffs)
	self:_display_event_buffs(event_buffs)
	Imgui.End()
end

ImguiBuffsDebug._update_controls = function (self)
	local selected_unit = Imgui.Combo("Unit", self._selected_unit, self._unit_names) - 1

	if selected_unit ~= self._selected_unit then
		self._selected_unit = selected_unit

		self:_initialize_unit(self._units[selected_unit + 1])
	end

	Imgui.SameLine()

	if Imgui.Button("Refresh") then
		self:_refresh_unit_list()
	end

	if Imgui.TreeNode("Add Buff Settings") then
		local old_filter = self._filter_text
		self._filter_text = Imgui.InputText("Search", self._filter_text)

		if self._filter_text ~= old_filter then
			self._filtered_buff_list = self:_apply_buff_filter(self._filter_text, self._buff_list)
		end

		self._selected_buff_id = Imgui.ListBox("Buff To Add", self._selected_buff_id, self._filtered_buff_list) - 1
		self._buff_advanced_params_enabled = Imgui.Checkbox("Advanced Params", self._buff_advanced_params_enabled)

		if self._buff_advanced_params_enabled then
			Imgui.TreePush("bonus_input")

			self._buff_bonus_enabled = Imgui.Checkbox("Bonus", self._buff_bonus_enabled)

			if self._buff_bonus_enabled then
				Imgui.SameLine()

				self._buff_bonus = Imgui.InputFloat("", self._buff_bonus)
			end

			Imgui.TreePop()
			Imgui.TreePush("mult_input")

			self._buff_multiplier_enabled = Imgui.Checkbox("Multiplier", self._buff_multiplier_enabled)

			if self._buff_multiplier_enabled then
				Imgui.SameLine()

				self._buff_multiplier = Imgui.InputFloat("", self._buff_multiplier)
			end

			Imgui.TreePop()
			Imgui.TreePush("val_input")

			self._buff_value_enabled = Imgui.Checkbox("Value", self._buff_value_enabled)

			if self._buff_value_enabled then
				Imgui.SameLine()

				self._buff_value = Imgui.InputFloat("", self._buff_value)
			end

			Imgui.TreePop()
			Imgui.TreePush("proc_input")

			self._buff_proc_chance_enabled = Imgui.Checkbox("Proc Chance", self._buff_proc_chance_enabled)

			if self._buff_proc_chance_enabled then
				Imgui.SameLine()

				self._buff_proc_chance = Imgui.InputFloat("", self._buff_proc_chance)
			end

			Imgui.TreePop()
			Imgui.TreePush("duration_input")

			self._buff_duration_enabled = Imgui.Checkbox("Duration", self._buff_duration_enabled)

			if self._buff_duration_enabled then
				Imgui.SameLine()

				self._buff_duration = Imgui.InputFloat("", self._buff_duration)
			end

			Imgui.TreePop()
			Imgui.TreePush("range_input")

			self._buff_range_enabled = Imgui.Checkbox("Range", self._buff_range_enabled)

			if self._buff_range_enabled then
				Imgui.SameLine()

				self._buff_range = Imgui.InputFloat("", self._buff_range)
			end

			Imgui.TreePop()
			Imgui.TreePush("power_input")
			Imgui.Dummy(15, 15)
			Imgui.SameLine()
			Imgui.Text("Power Level")
			Imgui.SameLine()

			self._buff_power_level = Imgui.InputFloat("", self._buff_power_level)

			Imgui.TreePop()
		end

		if Imgui.Button("Add", 100, 20) then
			local buff_to_add = self._filtered_buff_list[self._selected_buff_id + 1]

			if self._buff_advanced_params_enabled then
				local params = {
					external_optional_bonus = self._buff_bonus_enabled and self._buff_bonus,
					external_optional_multiplier = self._buff_multiplier_enabled and self._buff_multiplier,
					external_optional_value = self._buff_value_enabled and self._buff_value,
					external_optional_proc_chance = self._buff_proc_chance_enabled and self._buff_proc_chance,
					external_optional_duration = self._buff_duration_enabled and self._buff_duration,
					external_optional_range = self._buff_range_enabled and self._buff_range,
					power_level = self._buff_power_level
				}
			end

			self:_add_buff(self._buff_extension, buff_to_add, params)
		end

		if Imgui.Button("Add with buff system", 200, 20) then
			local buff_to_add = self._filtered_buff_list[self._selected_buff_id + 1]

			self:_add_buff_with_buff_system(buff_to_add)
		end

		Imgui.Dummy(10, 10)
		Imgui.TreePop()
	end
end

ImguiBuffsDebug._display_buffs = function (self, buffs)
	if Imgui.TreeNode("Buffs") then
		if buffs then
			local buffs_to_remove = nil

			for i = 1, #buffs, 1 do
				local buff = buffs[i]

				if Imgui.TreeNode(buff.buff_type .. "(" .. buff.id .. ")") then
					for name, data in pairs(buff) do
						if name == "template" and Imgui.TreeNode(name) then
							for template_name, template_data in pairs(data) do
								Imgui.Text(template_name)
								Imgui.SameLine()
								Imgui.Text(tostring(template_data))
							end

							Imgui.TreePop()
						end

						if type(data) ~= "function" and type(data) ~= "table" and name ~= "buff_type" and name ~= "id" then
							Imgui.Text(name)
							Imgui.SameLine()
							Imgui.Text(tostring(data))
						end
					end

					if Imgui.Button("Remove") then
						buffs_to_remove = buffs_to_remove or {}

						table.insert(buffs_to_remove, buff.id)
					end

					Imgui.TreePop()
				end

				Imgui.Separator()
			end

			if buffs_to_remove then
				for i = 1, #buffs_to_remove, 1 do
					self:_remove_buff(self._buff_extension, buffs_to_remove[i])
				end
			end
		end

		Imgui.Dummy(10, 10)
		Imgui.TreePop()
	end
end

ImguiBuffsDebug._display_perks = function (self, buffs)
	if Imgui.TreeNode("Perks") then
		if buffs then
			for i = 1, #buffs, 1 do
				local buff = buffs[i]
				local template = buff.template
				local perk = template and template.perk

				if perk then
					Imgui.Text(perk)
				end
			end
		end

		Imgui.Dummy(10, 10)
		Imgui.TreePop()
	end
end

ImguiBuffsDebug._display_stat_buffs = function (self, stat_buffs)
	if Imgui.TreeNode("Stat Buffs") then
		self._stat_base_value = Imgui.InputFloat("Base Stat Value", self._stat_base_value)

		if stat_buffs then
			Imgui.Separator()
			Imgui.Text(string.format("%-36s%8s%12s%13s%14s%15s", "Name", "Bonus", "Multiplier", "Value", "Proc Chance", "Final Value"))
			Imgui.Separator()

			for name, data in pairs(stat_buffs) do
				if not table.is_empty(data) then
					local final_value = self._stat_base_value

					for index, buff in pairs(data) do
						local bonus = buff.bonus or 0
						local multiplier = buff.multiplier or 0
						local proc_chance = buff.proc_chance or 0
						local value = buff.value
						local display_value = value or 0
						final_value = value or final_value * (1 + multiplier) + bonus

						Imgui.Text(string.format("%-36s%8.2f%12.2f%13.2f%14.2f%15.2f", name, bonus, multiplier, display_value, proc_chance, final_value))
					end

					Imgui.Separator()
				end
			end
		end

		Imgui.Dummy(10, 10)
		Imgui.TreePop()
	end
end

ImguiBuffsDebug._display_event_buffs = function (self, event_buffs)
	if Imgui.TreeNode("Event Buffs") then
		if event_buffs then
			Imgui.Separator()
			Imgui.Text(string.format("%-53s%8s%12s%13s%14s", "Name", "Bonus", "Multiplier", "Value", "Proc Chance"))
			Imgui.Separator()

			for name, data in pairs(event_buffs) do
				if not table.is_empty(data) then
					if Imgui.TreeNode(name) then
						for index, buff in pairs(data) do
							local buff_name = buff.buff_type or ""
							local bonus = buff.bonus or 0
							local value = buff.value or 0
							local multiplier = buff.multiplier or 0
							local proc_chance = buff.proc_chance or 1

							Imgui.Text(string.format("%-50s%8.2f%12.2f%13.2f%14.2f", buff_name, bonus, multiplier, value, proc_chance))
						end

						Imgui.TreePop()
					end

					Imgui.Separator()
				end
			end
		end

		Imgui.Dummy(10, 10)
		Imgui.TreePop()
	end
end

ImguiBuffsDebug._refresh_unit_list = function (self)
	self._unit_names = {}
	self._units = {}
	self._selected_unit = -1

	table.insert(self._unit_names, "none")
	table.insert(self._units, false)

	local position = nil
	local player_manager = Managers.player

	if player_manager then
		local players = player_manager:human_and_bot_players()

		for id, player in pairs(players) do
			if player then
				local profile_display_name = player:profile_display_name()

				table.insert(self._unit_names, profile_display_name)
				table.insert(self._units, player.player_unit)

				if player.local_player then
					position = POSITION_LOOKUP[player.player_unit]
					self._selected_unit = #self._unit_names - 1

					self:_initialize_unit(player.player_unit)
				end
			end
		end
	end

	local broadphase_query = {}

	AiUtils.broadphase_query(position, 10, broadphase_query)

	for _, ai_unit in ipairs(broadphase_query) do
		table.insert(self._unit_names, Unit.debug_name(ai_unit))
		table.insert(self._units, ai_unit)
	end
end

ImguiBuffsDebug._initialize_unit = function (self, unit)
	self._current_unit = unit

	if unit and Unit.alive(unit) then
		self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	end
end

ImguiBuffsDebug._add_buff = function (self, buff_extension, buff_name, params)
	if self._buff_extension and buff_name then
		self._buff_extension:add_buff(buff_name, params)
	end
end

ImguiBuffsDebug._add_buff_with_buff_system = function (self, buff_name)
	if self._current_unit then
		local buff_system = Managers.state.entity:system("buff_system")

		if buff_system then
			buff_system:add_buff(self._current_unit, buff_name, self._current_unit)
		end
	end
end

ImguiBuffsDebug._remove_buff = function (self, buff_extension, buff_id)
	if self._buff_extension and buff_id then
		self._buff_extension:remove_buff(buff_id)
	end
end

return
