-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local bpc = dofile("scripts/settings/bpc")
script_data.buff_debug = script_data.buff_debug or Development.parameter("buff_debug")
BuffExtension = class(BuffExtension)
buff_extension_function_params = buff_extension_function_params or {}
local E = 0.001
BuffExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self.world = extension_init_context.world
	self._breed = Unit.get_data(unit, "breed")
	self._buffs = {}
	self._stat_buffs = {}
	self._event_buffs = {}
	self._deactivation_sounds = {}
	self._continuous_screen_effects = {}
	self._deactivation_screen_effects = {}
	local num_stat_buffs = table.size(StatBuffIndex)

	for i = 1, num_stat_buffs, 1 do
		self._stat_buffs[i] = {}
	end

	for i = 1, #ProcEvents, 1 do
		local proc_event = ProcEvents[i]
		self._event_buffs[proc_event] = {}
	end

	self.is_server = Managers.player.is_server
	self.is_husk = extension_init_data.is_husk
	self.id = 1
	self.individual_stat_buff_index = 1

	return 
end
BuffExtension.extensions_ready = function (self, world, unit)
	local breed = Unit.get_data(unit, "breed")

	if breed then
		return 
	end

	local buff_system = Managers.state.entity:system("buff_system")
	local group_buffs = buff_system.get_player_group_buffs(buff_system)
	local num_group_buffs = #group_buffs

	if 0 < num_group_buffs then
		for i = 1, num_group_buffs, 1 do
			local group_buff_data = group_buffs[i]
			local group_buff_template_name = group_buff_data.group_buff_template_name
			local group_buff = GroupBuffTemplates[group_buff_template_name]
			local buff_per_instance = group_buff.buff_per_instance
			local recipients = group_buff_data.recipients
			local id = self.add_buff(self, buff_per_instance)
			recipients[unit] = id
		end
	end

	return 
end
BuffExtension.destroy = function (self)
	local buffs = self._buffs
	local num_buffs = #buffs
	local end_time = Managers.time:time("game")
	local i = 1

	while i <= num_buffs do
		local buff = buffs[i]
		buff_extension_function_params.bonus = buff.bonus
		buff_extension_function_params.multiplier = buff.multiplier
		buff_extension_function_params.t = end_time
		buff_extension_function_params.end_time = end_time
		buff_extension_function_params.attacker_unit = buff.attacker_unit

		self._remove_sub_buff(self, buff, i, buff_extension_function_params)

		num_buffs = num_buffs - 1
	end

	self._buffs = nil

	return 
end
BuffExtension.add_buff = function (self, template_name, params)
	local buff_template = BuffTemplates[template_name]
	local buffs = buff_template.buffs
	local start_time = Managers.time:time("game")
	local id = self.id
	local world = self.world

	for i, sub_buff_template in ipairs(buffs) do
		local duration = sub_buff_template.duration
		local max_stacks = sub_buff_template.max_stacks
		local end_time = duration and start_time + duration

		if max_stacks then
			local has_max_stacks = false
			local stacks = 0

			for j = 1, #self._buffs, 1 do
				local existing_buff = self._buffs[j]

				if existing_buff.buff_type == sub_buff_template.name then
					if duration and sub_buff_template.refresh_durations then
						existing_buff.start_time = start_time
						existing_buff.duration = duration
						existing_buff.end_time = end_time
						existing_buff.attacker_unit = (params and params.attacker_unit) or nil
						local reapply_buff_func = sub_buff_template.reapply_buff_func

						if reapply_buff_func then
							buff_extension_function_params.bonus = existing_buff.bonus
							buff_extension_function_params.multiplier = existing_buff.multiplier
							buff_extension_function_params.t = start_time
							buff_extension_function_params.end_time = end_time
							buff_extension_function_params.attacker_unit = existing_buff.attacker_unit

							BuffFunctionTemplates.functions[reapply_buff_func](self._unit, existing_buff, buff_extension_function_params, world)
						end
					end

					stacks = stacks + 1

					if stacks == max_stacks then
						has_max_stacks = true

						break
					end
				end
			end
		else
			local buff = {
				id = id,
				parent_id = params and params.parent_id,
				start_time = start_time,
				template = sub_buff_template,
				buff_type = sub_buff_template.name,
				attacker_unit = (params and params.attacker_unit) or nil
			}
			local bonus = sub_buff_template.bonus
			local multiplier = sub_buff_template.multiplier
			local proc_chance = sub_buff_template.proc_chance
			local range = sub_buff_template.range
			local damage_source, power_level, spawned_unit_go_id = nil

			if params then
				local variable_value = params.variable_value

				if variable_value then
					local variable_bonus_table = sub_buff_template.variable_bonus

					if variable_bonus_table then
						local bonus_index = (variable_value == 1 and #variable_bonus_table) or math.floor(variable_value/#variable_bonus_table/1) + 1
						bonus = variable_bonus_table[bonus_index]
					end

					local variable_multiplier_table = sub_buff_template.variable_multiplier

					if variable_multiplier_table then
						local min_multiplier = variable_multiplier_table[1]
						local max_multiplier = variable_multiplier_table[2]
						multiplier = math.lerp(min_multiplier, max_multiplier, variable_value)
					end
				end

				if not params.external_optional_bonus then
				end

				if not params.external_optional_multiplier then
				end

				if not params.external_optional_proc_chance then
				end

				if not params.external_optional_duration then
				end

				if not params.external_optional_range then
				end

				damage_source = params.damage_source
				power_level = params.power_level
				spawned_unit_go_id = params.spawned_unit_go_id
			end

			buff.bonus = bonus
			buff.multiplier = multiplier
			buff.proc_chance = proc_chance
			buff.duration = duration
			buff.range = range
			buff.damage_source = damage_source
			buff.power_level = power_level
			buff.spawned_unit_go_id = spawned_unit_go_id
			buff_extension_function_params.bonus = bonus
			buff_extension_function_params.multiplier = multiplier
			buff_extension_function_params.t = start_time
			buff_extension_function_params.end_time = end_time
			buff_extension_function_params.attacker_unit = buff.attacker_unit
			local apply_buff_func = sub_buff_template.apply_buff_func

			if apply_buff_func then
				BuffFunctionTemplates.functions[apply_buff_func](self._unit, buff, buff_extension_function_params, world)
			end

			if sub_buff_template.stat_buff then
				local index = self._add_stat_buff(self, sub_buff_template, buff)
				buff.stat_buff_index = index
			end

			if sub_buff_template.event_buff then
				local buff_func = sub_buff_template.buff_func
				local event = sub_buff_template.event
				buff.buff_func = buff_func
				local event_buffs = self._event_buffs[event]
				local index = #event_buffs + 1
				buff.event_buff_index = index
				event_buffs[index] = buff
			end

			if sub_buff_template.buff_after_delay then
				local delayed_buff_name = sub_buff_template.delayed_buff_name
				buff.delayed_buff_name = delayed_buff_name
			end

			self._buffs[#self._buffs + 1] = buff
		end
	end

	local activation_sound = buff_template.activation_sound

	if activation_sound then
		self._play_buff_sound(self, activation_sound)
	end

	local activation_effect = buff_template.activation_effect

	if activation_effect then
		self._play_screen_effect(self, activation_effect)
	end

	local continuous_effect = buff_template.continuous_effect

	if continuous_effect then
		self._continuous_screen_effects[id] = self._play_screen_effect(self, continuous_effect)
	end

	local deactivation_effect = buff_template.deactivation_effect

	if deactivation_effect then
		self._deactivation_screen_effects[id] = deactivation_effect
	end

	local deactivation_sound = buff_template.deactivation_sound

	if deactivation_sound then
		self._deactivation_sounds[id] = deactivation_sound
	end

	self.id = id + 1

	return id
end
BuffExtension._add_stat_buff = function (self, sub_buff_template, buff)
	local bonus = buff.bonus or 0
	local multiplier = buff.multiplier or 0
	local proc_chance = buff.proc_chance or 1
	local stat_buffs = self._stat_buffs
	local stat_buff_index = sub_buff_template.stat_buff
	local stat_buff = stat_buffs[stat_buff_index]
	local application_method = StatBuffApplicationMethods[stat_buff_index]
	local index = nil

	if application_method == "proc" then
		index = self.individual_stat_buff_index
		stat_buff[index] = {
			bonus = bonus,
			multiplier = multiplier,
			proc_chance = proc_chance,
			parent_id = buff.parent_id
		}
		self.individual_stat_buff_index = index + 1
	else
		index = 1

		if not stat_buff[index] then
			stat_buff[index] = {
				bonus = bonus,
				multiplier = multiplier,
				proc_chance = proc_chance
			}
		elseif application_method == "stacking_bonus" then
			local current_bonus = stat_buff[index].bonus
			stat_buff[index].bonus = current_bonus + bonus
		elseif application_method == "stacking_multiplier" then
			local current_multiplier = stat_buff[index].multiplier
			stat_buff[index].multiplier = current_multiplier + multiplier
		elseif application_method == "stacking_bonus_and_multiplier" then
			local current_bonus = stat_buff[index].bonus
			local current_multiplier = stat_buff[index].multiplier
			stat_buff[index].bonus = current_bonus + bonus
			stat_buff[index].multiplier = current_multiplier + multiplier
		end
	end

	return index
end
BuffExtension.update = function (self, unit, input, dt, context, t)
	Profiler.start("BuffExtension:update :: buffs")
	self._update_buffs(self, dt, t)
	Profiler.stop("BuffExtension:update :: buffs")

	return 
end
BuffExtension._update_buffs = function (self, dt, t)
	local world = self.world
	local buffs = self._buffs
	local num_buffs = #buffs
	local i = 1

	while i <= num_buffs do
		local buff = buffs[i]
		local template = buff.template
		local end_time = buff.duration and buff.start_time + buff.duration
		buff_extension_function_params.bonus = buff.bonus
		buff_extension_function_params.multiplier = buff.multiplier
		buff_extension_function_params.t = t
		buff_extension_function_params.end_time = end_time
		buff_extension_function_params.attacker_unit = buff.attacker_unit

		if end_time and end_time <= t then
			self._remove_sub_buff(self, buff, i, buff_extension_function_params)

			if template.buff_after_delay then
				local delayed_buff_name = buff.delayed_buff_name

				self.add_buff(self, delayed_buff_name)
			else
				num_buffs = num_buffs - 1
			end
		else
			local update_func = template.update_func

			if update_func then
				local time_into_buff = t - buff.start_time
				local time_left_on_buff = end_time and end_time - t
				buff_extension_function_params.time_into_buff = time_into_buff
				buff_extension_function_params.time_left_on_buff = time_left_on_buff
				local removed_buff, amount = BuffFunctionTemplates.functions[update_func](self._unit, buff, buff_extension_function_params, world)

				if removed_buff then
					amount = amount or 1
					num_buffs = num_buffs - amount
				end
			end
		end

		i = i + 1
	end

	return 
end
BuffExtension.update_stat_buff = function (self, stat_buff_index, difference)
	local stat_buffs = self._stat_buffs
	local stat_buff = stat_buffs[stat_buff_index]
	local application_method = StatBuffApplicationMethods[stat_buff_index]
	local index = 1

	if application_method == "stacking_bonus" then
		local current_bonus = stat_buff[index].bonus
		stat_buff[index].bonus = current_bonus + difference
	elseif application_method == "stacking_multiplier" then
		local current_multiplier = stat_buff[index].multiplier
		stat_buff[index].multiplier = current_multiplier + difference
	else
		fassert(false, "trying to update a stat with an incompatible application method")
	end

	return 
end
BuffExtension.remove_buff = function (self, id)
	local buffs = self._buffs
	local num_buffs = #buffs
	local end_time = Managers.time:time("game")
	local i = 1

	while i <= num_buffs do
		local buff = buffs[i]
		local template = buff.template
		buff_extension_function_params.bonus = buff.bonus
		buff_extension_function_params.multiplier = buff.multiplier
		buff_extension_function_params.t = end_time
		buff_extension_function_params.end_time = end_time
		buff_extension_function_params.attacker_unit = buff.attacker_unit

		if buff.id == id or buff.parent_id == id then
			self._remove_sub_buff(self, buff, i, buff_extension_function_params)

			num_buffs = num_buffs - 1
		else
			i = i + 1
		end
	end

	return 
end
BuffExtension._remove_sub_buff = function (self, buff, index, buff_extension_function_params)
	local world = self.world
	local template = buff.template
	local remove_buff_func = template.remove_buff_func

	if remove_buff_func then
		BuffFunctionTemplates.functions[remove_buff_func](self._unit, buff, buff_extension_function_params, world)
	end

	if template.stat_buff then
		self._remove_stat_buff(self, buff)
	end

	if template.event_buff then
		local event = template.event
		local event_buff_index = buff.event_buff_index

		table.remove(self._event_buffs[event], event_buff_index)
	end

	table.remove(self._buffs, index)

	local id = buff.id
	local deactivation_sound = self._deactivation_sounds[id]

	if deactivation_sound then
		self._play_buff_sound(self, deactivation_sound)
	end

	local continuous_screen_effect_id = self._continuous_screen_effects[id]

	if continuous_screen_effect_id then
		self._stop_screen_effect(self, continuous_screen_effect_id)
	end

	local deactivation_screen_effect = self._deactivation_screen_effects[id]

	if deactivation_screen_effect then
		self._play_screen_effect(self, deactivation_screen_effect)
	end

	return 
end
BuffExtension._remove_stat_buff = function (self, buff)
	local sub_buff_template = buff.template
	local bonus = buff.bonus or 0
	local multiplier = buff.multiplier or 0
	local proc_chance = buff.proc_chance or 1
	local stat_buff = sub_buff_template.stat_buff
	local stat_buffs = self._stat_buffs[stat_buff]
	local application_method = StatBuffApplicationMethods[stat_buff]
	local index = buff.stat_buff_index

	if application_method == "proc" then
		stat_buffs[index] = nil
	elseif application_method == "stacking_bonus" then
		local current_bonus = stat_buffs[index].bonus
		stat_buffs[index].bonus = current_bonus - bonus
	elseif application_method == "stacking_multiplier" then
		local current_multiplier = stat_buffs[index].multiplier
		stat_buffs[index].multiplier = current_multiplier - multiplier
	elseif application_method == "stacking_bonus_and_multiplier" then
		local current_bonus = stat_buffs[index].bonus
		local current_multiplier = stat_buffs[index].multiplier
		stat_buffs[index].bonus = current_bonus - bonus
		stat_buffs[index].multiplier = current_multiplier - multiplier
	end

	return 
end
BuffExtension.has_buff_type = function (self, buff_type)
	local buffs = self._buffs
	local num_buffs = #buffs

	for i = 1, num_buffs, 1 do
		local buff = buffs[i]

		if buff.buff_type == buff_type then
			return true
		end
	end

	return false
end
BuffExtension.has_buff_perk = function (self, perk_name)
	local buffs = self._buffs
	local num_buffs = #buffs

	for i = 1, num_buffs, 1 do
		local buff = buffs[i]
		local buff_template = buff.template

		if buff_template.perk == perk_name then
			return true
		end
	end

	return false
end
BuffExtension.get_non_stacking_buff = function (self, buff_type)
	local buffs = self._buffs
	local num_buffs = #buffs

	for i = 1, num_buffs, 1 do
		local buff = buffs[i]

		if buff.buff_type == buff_type then
			fassert(buff.template.max_stacks and buff.template.max_stacks == 1, "Tried getting a stacking buff!")

			return buff
		end
	end

	return nil
end
BuffExtension.num_buff_type = function (self, buff_type)
	local buffs = self._buffs
	local num_buffs = #buffs
	local num_buff_type = 0

	for i = 1, num_buffs, 1 do
		local buff = buffs[i]

		if buff.buff_type == buff_type then
			num_buff_type = num_buff_type + 1
		end
	end

	return num_buff_type
end
local proc_data = {}
local event_buffs_to_remove = {}
BuffExtension.trigger_procs = function (self, event, ...)
	local event_buffs = self._event_buffs[event]
	local num_event_buffs = #event_buffs
	local player = Managers.player:owner(self._unit)
	local num_args = select("#", ...)

	table.clear(proc_data)
	table.clear(event_buffs_to_remove)

	for i = 1, num_args, 1 do
		local arg = select(i, ...)
		proc_data[#proc_data + 1] = arg
	end

	for i = 1, num_event_buffs, 1 do
		local buff = event_buffs[i]
		local proc_chance = buff.proc_chance or 1

		if math.random() <= proc_chance then
			local buff_func = buff.buff_func
			local success = buff_func(player, buff, proc_data)

			if success and buff.template.remove_on_proc then
				event_buffs_to_remove[#event_buffs_to_remove + 1] = buff
			end
		end
	end

	for i = 1, #event_buffs_to_remove, 1 do
		local buff = event_buffs_to_remove[i]
		local id = buff.id

		self.remove_buff(self, id)
	end

	return 
end
BuffExtension.apply_buffs_to_value = function (self, value, stat_buff)
	local unit = self._unit
	local stat_buffs = self._stat_buffs[stat_buff]
	local final_value = value
	local procced = false
	local is_proc = StatBuffApplicationMethods[stat_buff] == "proc"
	local id = nil

	for _, stat_buff_data in pairs(stat_buffs) do
		local proc_chance = stat_buff_data.proc_chance

		if math.random() <= proc_chance then
			local bonus = stat_buff_data.bonus
			local multiplier = stat_buff_data.multiplier + 1
			final_value = (final_value + bonus)*multiplier

			if is_proc then
				procced = true
				id = stat_buff_data.id

				break
			end
		end
	end

	return final_value, procced, id
end
BuffExtension._play_buff_sound = function (self, sound_event)
	local unit = self._unit

	if ScriptUnit.has_extension(unit, "first_person_system") then
		local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

		first_person_extension.play_hud_sound_event(first_person_extension, sound_event)
	end

	return 
end
BuffExtension._play_screen_effect = function (self, effect)
	local unit = self._unit

	if ScriptUnit.has_extension(unit, "first_person_system") then
		local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
		local effect_id = first_person_extension.create_screen_particles(first_person_extension, effect)

		return effect_id
	end

	return nil
end
BuffExtension._stop_screen_effect = function (self, effect_id)
	local unit = self._unit

	if effect_id and ScriptUnit.has_extension(unit, "first_person_system") then
		local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

		first_person_extension.stop_spawning_screen_particles(first_person_extension, effect_id)
	end

	return 
end
BuffExtension.active_buffs = function (self)
	return self._buffs
end

return 
