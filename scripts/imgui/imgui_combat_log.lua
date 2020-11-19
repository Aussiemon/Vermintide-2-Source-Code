ImguiCombatLog = class(ImguiCombatLog)
local SHOULD_RELOAD = false
local DEFAULT_WINDOW_X = 800
local DEFAULT_WINDOW_Y = 500

local function format_timestamp(time)
	local miliseconds = time % 60
	local seconds = math.floor(time)

	return os.date("%H:%M", seconds) .. string.format(":%06.3f", miliseconds)
end

ImguiCombatLog.init = function (self)
	self._log = {}
	self._max_lines = 1000
	self._start_time = os.time() - os.clock()
	self.categories = {
		{
			name = "Damage",
			enabled = true,
			type = "damage"
		},
		{
			name = "Heal",
			enabled = true,
			type = "heal"
		},
		{
			name = "Buff",
			enabled = true,
			type = "buff"
		},
		{
			name = "Buff Proc",
			enabled = true,
			type = "buff_proc"
		},
		{
			name = "Action",
			enabled = true,
			type = "action"
		}
	}
	self._type_ids = {}
	self._settings = {
		auto_start_recording = true,
		show_timestamp = true,
		show_type = true
	}
	self._first_run = true

	self:_make_log_type_lookup()
	self:register_events()
	self:_load_settings()
end

ImguiCombatLog.register_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:register(self, "combat_log_damage", "log_damage")
		event_manager:register(self, "combat_log_heal", "log_heal")
		event_manager:register(self, "combat_log_action", "log_action")
		event_manager:register(self, "combat_log_proc", "log_proc")
		event_manager:register(self, "combat_log_buff", "log_buff")
	end
end

ImguiCombatLog.unregister_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:unregister("combat_log_damage", self)
		event_manager:unregister("combat_log_heal", self)
		event_manager:unregister("combat_log_action", self)
		event_manager:unregister("combat_log_proc", self)
		event_manager:unregister("combat_log_buff", self)
	end
end

ImguiCombatLog.on_round_start = function (self)
	if self._settings.auto_start_recording then
		self:register_events()
	end

	self:_save_settings()
end

ImguiCombatLog.on_round_end = function (self)
	self:unregister_events()
	self:_save_settings()
end

ImguiCombatLog.destroy = function (self)
	self:unregister_events()
	self:_save_settings()
end

ImguiCombatLog.update = function (self)
	if SHOULD_RELOAD then
		self:unregister_events()
		self:init()

		SHOULD_RELOAD = false
	end
end

ImguiCombatLog.is_persistent = function (self)
	return true
end

ImguiCombatLog.draw = function (self, is_open)
	if self._first_run then
		Imgui.set_next_window_size(DEFAULT_WINDOW_X, DEFAULT_WINDOW_Y)

		self._first_run = false
	end

	Imgui.begin_window("Combat Log")

	self._settings.show_timestamp = Imgui.checkbox("Timestamp", self._settings.show_timestamp)

	Imgui.same_line()

	self._settings.show_type = Imgui.checkbox("Type", self._settings.show_type)

	Imgui.same_line()

	self._settings.auto_start_recording = Imgui.checkbox("Auto Start Recording", self._settings.auto_start_recording)
	local categories = self.categories

	for i = 1, #categories, 1 do
		if i > 1 then
			Imgui.same_line()
		end

		local category = categories[i]
		category.enabled = Imgui.checkbox(category.name, category.enabled)
	end

	if Imgui.button("Start", 100, 20) then
		self:register_events()
	end

	Imgui.same_line()

	if Imgui.button("Stop", 100, 20) then
		self:unregister_events()
	end

	Imgui.same_line()

	if Imgui.button("Copy Visible", 100, 20) then
		self:copy_to_clipboard(false)
	end

	Imgui.same_line()

	if Imgui.button("Copy All", 100, 20) then
		self:copy_to_clipboard(true)
	end

	Imgui.same_line()

	if Imgui.button("Clear", 40, 20) then
		self:clear()
	end

	local show_timestamp = self._settings.show_timestamp
	local show_type = self._settings.show_type
	local window_size_x, window_size_y = Imgui.get_window_size()

	Imgui.begin_child_window("Log:", window_size_x - 15, window_size_y - 105, false, "no_title_bar", "always_auto_resize", "horisontal_scrollbar")

	for line_id = 1, #self._log, 1 do
		local line = self._log[line_id]

		if categories[line.type_id].enabled then
			local line_contents = line.content

			if show_timestamp then
				Imgui.text(line.timestamp)
				Imgui.same_line()
			end

			if show_type then
				Imgui.text(line.type_name)
				Imgui.same_line()
			end

			local line_content_num = #line_contents

			for i = 1, line_content_num, 1 do
				local data = line_contents[i]
				local text = data[1]
				local color = data[2]

				Imgui.text_colored(text, color[2], color[3], color[4], color[1])

				if i ~= line_content_num then
					Imgui.same_line()
				end
			end
		end
	end

	Imgui.end_child_window()
	Imgui.end_window("Combat Log")
end

ImguiCombatLog.log_damage = function (self, attacker_unit, victim_unit, networkified_damage_amount, hit_zone_name, damage_type, damage_source, is_critical_strike, backstab_multiplier, added_dot, target_index, first_hit, total_hits, power_level)
	local attacker_unit_breed = Unit.alive(attacker_unit) and Unit.get_data(attacker_unit, "breed")
	local victim_unit_breed = Unit.alive(victim_unit) and Unit.get_data(victim_unit, "breed")
	local network_manager = Managers.state.network
	local unit_id = network_manager and network_manager:unit_game_object_id(victim_unit)
	local line = self:_add_line("damage")

	self:_add_colored_segment(line, string.format("%s -> %s (%d) (%.2f %s), Power(%.2f), hit (%s) using (%s) Crit: %s, Backstab Mult: %.2f, Target Index: %d", tostring((attacker_unit_breed and attacker_unit_breed.name) or attacker_unit), tostring((victim_unit_breed and victim_unit_breed.name) or victim_unit), unit_id or 0, networkified_damage_amount or 0, tostring(damage_type), power_level or 0, tostring(hit_zone_name), tostring(damage_source), tostring(is_critical_strike), backstab_multiplier or 1, target_index or 0), Colors.get_table("orange"))
end

ImguiCombatLog.log_heal = function (self, healer_unit, unit, buffed_heal_amount, heal_type)
	local healer_unit_breed = Unit.alive(healer_unit) and Unit.get_data(healer_unit, "breed")
	local unit_breed = Unit.alive(unit) and Unit.get_data(unit, "breed")
	local line = self:_add_line("heal")

	self:_add_colored_segment(line, string.format("%s -> %s (%.2f %s)", tostring((healer_unit_breed and healer_unit_breed.name) or healer_unit), tostring((unit_breed and unit_breed.name) or unit), buffed_heal_amount or 0, tostring(heal_type)), Colors.get_table("lime"))
end

ImguiCombatLog.log_action = function (self, unit, item_name, kind, action_name, sub_action_name, power_level, started, reason)
	local unit_breed = Unit.alive(unit) and Unit.get_data(unit, "breed")
	local line = self:_add_line("action")

	if started then
		self:_add_colored_segment(line, string.format("[Start] %s (%s - power %.2f) - %s/%s/%s", tostring((unit_breed and unit_breed.name) or unit), tostring(kind), power_level or 0, tostring(item_name), tostring(action_name), tostring(sub_action_name)), Colors.get_table("white"))
	else
		self:_add_colored_segment(line, string.format("[End] %s (%s - power %.2f), Reason: %s - %s/%s/%s ", tostring((unit_breed and unit_breed.name) or unit), tostring(kind), power_level or 0, tostring(reason), tostring(item_name), tostring(action_name), tostring(sub_action_name)), Colors.get_table("white"))
	end
end

ImguiCombatLog.log_proc = function (self, player, event, buff, params, success)
	local unit = player and player.player_unit
	local unit_breed = Unit.alive(unit) and Unit.get_data(unit, "breed")
	local line = self:_add_line("buff_proc")

	self:_add_colored_segment(line, string.format("%s (%s) -> %s", tostring((unit_breed and unit_breed.name) or unit), event or "-", tostring(buff.buff_type)), Colors.get_table("silver"))
end

ImguiCombatLog.log_buff = function (self, unit, buff, added, stack_count, max_stacks)
	local owner_breed = Unit.alive(unit) and Unit.get_data(unit, "breed")
	local attacker_unit = buff and buff.attacker_unit
	local attacker_breed = Unit.alive(attacker_unit) and Unit.get_data(attacker_unit, "breed")
	local line = self:_add_line("buff")

	if added then
		self:_add_colored_segment(line, string.format("[Added] %s -> %s (mult: %.2f)", tostring((owner_breed and owner_breed.name) or unit), tostring(buff.buff_type), buff.multiplier or 1), Colors.get_table("lime"))

		if stack_count and max_stacks then
			self:_add_colored_segment(line, string.format("(stacks: %d/%d)", stack_count, max_stacks), Colors.get_table("lime"))
		end

		if attacker_unit then
			self:_add_colored_segment(line, string.format("(%s)", tostring((attacker_breed and attacker_breed.name) or attacker_unit)), Colors.get_table("lime"))
		end
	else
		self:_add_colored_segment(line, string.format("[Removed] %s -> %s", tostring((owner_breed and owner_breed.name) or unit), tostring(buff.buff_type)), Colors.get_table("yellow"))

		if attacker_unit then
			self:_add_colored_segment(line, string.format("(%s)", tostring((attacker_breed and attacker_breed.name) or attacker_unit)), Colors.get_table("yellow"))
		end
	end
end

ImguiCombatLog._make_log_type_lookup = function (self)
	local categories = self.categories

	for i = 1, #categories, 1 do
		self._type_ids[categories[i].type] = i
	end
end

ImguiCombatLog._get_type_name = function (self, type)
	if type then
		local id = self._type_ids[type]
		local category = self.categories[id]
		local type_name = (category and category.name) or tostring(type)

		return type_name
	end

	return tostring("Unknown")
end

ImguiCombatLog._add_line = function (self, type)
	local new_line = {
		timestamp = "[" .. format_timestamp(self._start_time + os.clock()) .. "]",
		content = {},
		type_id = self._type_ids[type] or 0,
		type_name = "[" .. self:_get_type_name(type) .. "]"
	}

	table.insert(self._log, 1, new_line)

	local num_lines = #self._log

	if self._max_lines < num_lines then
		table.remove(self._log, num_lines)
	end

	return new_line
end

ImguiCombatLog._add_colored_segment = function (self, line, text, color)
	local text_to_add = text or ""
	local color_to_add = color or Colors.get_table("white")

	table.insert(line.content, {
		text_to_add,
		color_to_add
	})
end

ImguiCombatLog.clear = function (self)
	self._log = {}
end

ImguiCombatLog.copy_to_clipboard = function (self, copy_all)
	local output = ""
	local categories = self.categories
	local show_type = self._settings.show_type

	for line_id = 1, #self._log, 1 do
		local line = self._log[line_id]

		if copy_all or categories[line.type_id].enabled then
			local line_contents = line.content

			if copy_all or self._show_timestamp then
				output = output .. line.timestamp
			end

			if copy_all or show_type then
				output = output .. " " .. line.type_name
			end

			for i = 1, #line_contents, 1 do
				local data = line_contents[i]
				local text = data[1]
				output = output .. " " .. text
			end

			output = output .. "\n"
		end
	end

	Clipboard.put(output)
end

ImguiCombatLog._save_settings = function (self)
	local categories = self.categories
	local saved_settings = {
		categories = {},
		settings = self._settings
	}

	for i = 1, #categories, 1 do
		local type = categories[i].type
		saved_settings.categories[type] = categories[i].enabled
	end

	Development.set_setting("ImguiCombatLog_settings", saved_settings)
	Application.save_user_settings()
end

ImguiCombatLog._load_settings = function (self)
	local saved_settings = Development.setting("ImguiCombatLog_settings")

	if saved_settings then
		local category_settings = saved_settings.categories

		if category_settings then
			local categories = self.categories

			for i = 1, #categories, 1 do
				local type = categories[i].type
				local new_val = category_settings[type]

				if new_val ~= nil then
					categories[i].enabled = new_val
				end
			end
		end

		local general_settings = saved_settings.settings

		if general_settings then
			table.merge(self._settings, general_settings)
		end
	end
end

return
