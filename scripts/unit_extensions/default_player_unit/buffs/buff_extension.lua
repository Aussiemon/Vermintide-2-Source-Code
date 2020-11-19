-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
require("scripts/helpers/pseudo_random_distribution")

local bpc = dofile("scripts/settings/bpc")
script_data.buff_debug = script_data.buff_debug or Development.parameter("buff_debug")
BuffExtension = class(BuffExtension)
buff_extension_function_params = buff_extension_function_params or {}
local E = 0.001

BuffExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self.world = extension_init_context.world
	self._breed = extension_init_data.breed
	self._initial_buff_names = extension_init_data.initial_buff_names
	self._buffs = {}
	self._stat_buffs = {}
	self._event_buffs = {}
	self._event_buffs_index = 1
	self._deactivation_sounds = {}
	self._continuous_screen_effects = {}
	self._deactivation_screen_effects = {}

	for stat_buff_name, _ in pairs(StatBuffApplicationMethods) do
		self._stat_buffs[stat_buff_name] = {}
	end

	for i = 1, #ProcEvents, 1 do
		local proc_event = ProcEvents[i]
		self._event_buffs[proc_event] = {}
	end

	self.is_server = Managers.player.is_server
	self.is_husk = extension_init_data.is_husk
	self.id = 1
	self.individual_stat_buff_index = 1
	self._prd_states = {}
end

BuffExtension.extensions_ready = function (self, world, unit)
	self:_activate_initial_buffs()

	local breed = Unit.get_data(unit, "breed")

	if not breed or not breed.is_player then
		return
	end

	if breed.is_hero then
		local buff_system = Managers.state.entity:system("buff_system")
		local group_buffs = buff_system:get_player_group_buffs()
		local num_group_buffs = #group_buffs

		if num_group_buffs > 0 then
			for i = 1, num_group_buffs, 1 do
				local group_buff_data = group_buffs[i]
				local group_buff_template_name = group_buff_data.group_buff_template_name
				local group_buff = GroupBuffTemplates[group_buff_template_name]
				local buff_per_instance = group_buff.buff_per_instance
				local recipients = group_buff_data.recipients
				local id = self:add_buff(buff_per_instance)
				recipients[unit] = id
			end
		end
	end

	if #self._buffs > 0 then
		Managers.state.entity:system("buff_system"):set_buff_ext_active(self._unit, true)
	end
end

BuffExtension.destroy = function (self)
	self:clear()
end

BuffExtension.freeze = function (self)
	self:clear()
end

BuffExtension.clear = function (self)
	local buffs = self._buffs
	local num_buffs = #buffs
	local end_time = Managers.time:time("game")

	while num_buffs > 0 do
		local buff = buffs[num_buffs]
		buff_extension_function_params.bonus = buff.bonus
		buff_extension_function_params.multiplier = buff.multiplier
		buff_extension_function_params.value = buff.value
		buff_extension_function_params.t = end_time
		buff_extension_function_params.end_time = end_time
		buff_extension_function_params.attacker_unit = buff.attacker_unit
		buff_extension_function_params.source_attacker_unit = buff.source_attacker_unit

		self:_remove_sub_buff(buff, num_buffs, buff_extension_function_params)

		num_buffs = #buffs
	end

	Managers.state.entity:system("buff_system"):set_buff_ext_active(self._unit, false)
end

BuffExtension.add_buff = function (self, template_name, params)
	if FROZEN[self._unit] then
		return
	end

	local buff_template = BuffTemplates[template_name]
	local buffs = buff_template.buffs
	local start_time = Managers.time:time("game")
	local id = self.id
	local world = self.world
	self.id = id + 1

	if #self._buffs == 0 then
		Managers.state.entity:system("buff_system"):set_buff_ext_active(self._unit, true)
	end

	for i, sub_buff_template in ipairs(buffs) do
		repeat
			local duration = sub_buff_template.duration
			local stacks = 0
			local max_stacks = sub_buff_template.max_stacks
			local end_time = duration and start_time + duration

			if max_stacks then
				local has_max_stacks = false

				for j = 1, #self._buffs, 1 do
					local existing_buff = self._buffs[j]

					if existing_buff.buff_type == sub_buff_template.name then
						if existing_buff.area_buff_unit and sub_buff_template.refresh_buff_area_position then
							local buff_area_extension = ScriptUnit.has_extension(existing_buff.area_buff_unit, "buff_area_system")

							if buff_area_extension then
								buff_area_extension:set_unit_position(POSITION_LOOKUP[self._unit])
							end
						end

						if duration and sub_buff_template.refresh_durations then
							if existing_buff.area_buff_unit then
								local buff_area_extension = ScriptUnit.has_extension(existing_buff.area_buff_unit, "buff_area_system")

								if buff_area_extension then
									buff_area_extension:set_duration(duration)
								end
							end

							existing_buff.start_time = start_time
							existing_buff.duration = duration
							existing_buff.end_time = end_time
							existing_buff.attacker_unit = (params and params.attacker_unit) or nil
							existing_buff.source_attacker_unit = (params and params.source_attacker_unit) or nil
							local reapply_buff_func = sub_buff_template.reapply_buff_func

							if reapply_buff_func then
								buff_extension_function_params.bonus = existing_buff.bonus
								buff_extension_function_params.multiplier = existing_buff.multiplier
								buff_extension_function_params.value = existing_buff.value
								buff_extension_function_params.t = start_time
								buff_extension_function_params.end_time = end_time
								buff_extension_function_params.attacker_unit = existing_buff.attacker_unit
								buff_extension_function_params.source_attacker_unit = existing_buff.source_attacker_unit

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

				if has_max_stacks then
					local on_max_stacks_overflow_func = MaxStackFunctions[sub_buff_template.on_max_stacks_overflow_func]

					if on_max_stacks_overflow_func then
						local player = Managers.player:owner(self._unit)

						if player then

							-- Decompilation error in this vicinity:
							on_max_stacks_overflow_func(player, sub_buff_template)

							break

							local buff = {
								id = id,
								parent_id = params and params.parent_id,
								start_time = start_time,
								template = sub_buff_template,
								buff_type = sub_buff_template.name
							}

							if sub_buff_template.buff_area then
								local unit_spawner = Managers.state.unit_spawner
								local extension_init_data = {
									buff_area_system = {
										removal_proc_function_name = sub_buff_template.exit_area_func,
										add_proc_function_name = sub_buff_template.enter_area_func,
										duration = sub_buff_template.duration,
										radius = sub_buff_template.area_radius,
										sub_buff_template = sub_buff_template,
										owner_player = Managers.player:owner(self._unit)
									}
								}
								local buff_unit, buff_unit_go_id = unit_spawner:spawn_network_unit(sub_buff_template.area_unit_name, "buff_aoe_unit", extension_init_data, POSITION_LOOKUP[self._unit], Quaternion.identity(), nil)
								buff.area_buff_unit = buff_unit
							end

							buff.attacker_unit = (params and params.attacker_unit) or nil
							buff.source_attacker_unit = (params and params.source_attacker_unit) or nil
							local bonus = sub_buff_template.bonus
							local value = sub_buff_template.value
							local multiplier = sub_buff_template.multiplier
							local proc_chance = sub_buff_template.proc_chance
							local range = sub_buff_template.range
							local damage_source, power_level = nil

							if params then
								local variable_value = params.variable_value

								if variable_value then
									local variable_bonus_table = sub_buff_template.variable_bonus

									if variable_bonus_table then
										local bonus_index = (variable_value == 1 and #variable_bonus_table) or 1 + math.floor(variable_value / (1 / #variable_bonus_table))
										bonus = variable_bonus_table[bonus_index]
									end

									local variable_multiplier_table = sub_buff_template.variable_multiplier

									if variable_multiplier_table then
										local min_multiplier = variable_multiplier_table[1]
										local max_multiplier = variable_multiplier_table[2]
										multiplier = math.lerp(min_multiplier, max_multiplier, variable_value)
									end

									local variable_bonus_max = sub_buff_template.variable_bonus_max

									if variable_bonus_max then
										bonus = math.lerp(0, variable_bonus_max, variable_value)
									end

									local variable_multiplier_max = sub_buff_template.variable_multiplier_max

									if variable_multiplier_max then
										multiplier = math.lerp(0, variable_multiplier_max, variable_value)
									end
								end

								bonus = params.external_optional_bonus or bonus
								multiplier = params.external_optional_multiplier or multiplier
								value = params.external_optional_value or value
								proc_chance = params.external_optional_proc_chance or proc_chance
								duration = params.external_optional_duration or duration
								range = params.external_optional_range or range
								damage_source = params.damage_source
								power_level = params.power_level
							end

							if sub_buff_template.duration_modifier_func then
								duration = sub_buff_template:duration_modifier_func(duration)
							end

							buff.bonus = bonus
							buff.multiplier = multiplier
							buff.proc_chance = proc_chance
							buff.value = value
							buff.duration = duration
							buff.range = range
							buff.damage_source = damage_source
							buff.power_level = power_level
							buff_extension_function_params.bonus = bonus
							buff_extension_function_params.multiplier = multiplier
							buff_extension_function_params.value = value
							buff_extension_function_params.t = start_time
							buff_extension_function_params.end_time = end_time
							buff_extension_function_params.attacker_unit = buff.attacker_unit
							buff_extension_function_params.source_attacker_unit = buff.source_attacker_unit
							local apply_buff_func = sub_buff_template.apply_buff_func

							if apply_buff_func then
								BuffFunctionTemplates.functions[apply_buff_func](self._unit, buff, buff_extension_function_params, world)
							end

							if sub_buff_template.stat_buff then
								local index = self:_add_stat_buff(sub_buff_template, buff)
								buff.stat_buff_index = index
							end

							if sub_buff_template.event_buff then
								local buff_func = sub_buff_template.buff_func
								local event = sub_buff_template.event
								buff.buff_func = buff_func
								local event_buffs = self._event_buffs[event]
								local index = self._event_buffs_index
								buff.event_buff_index = index
								event_buffs[index] = buff
								self._event_buffs_index = index + 1
							end

							if sub_buff_template.buff_after_delay then
								local delayed_buff_name = sub_buff_template.delayed_buff_name
								buff.delayed_buff_name = delayed_buff_name
							end

							if sub_buff_template.continuous_effect then
								self._continuous_screen_effects[id] = self:_play_screen_effect(sub_buff_template.continuous_effect)
							end

							self._buffs[#self._buffs + 1] = buff
						end
					end
				end
			end
		until true
	end

	local activation_sound = buff_template.activation_sound

	if activation_sound then
		self:_play_buff_sound(activation_sound)
	end

	local activation_effect = buff_template.activation_effect

	if activation_effect then
		self:_play_screen_effect(activation_effect)
	end

	local deactivation_effect = buff_template.deactivation_effect

	if deactivation_effect then
		self._deactivation_screen_effects[id] = deactivation_effect
	end

	local deactivation_sound = buff_template.deactivation_sound

	if deactivation_sound then
		self._deactivation_sounds[id] = deactivation_sound
	end

	return id
end

BuffExtension._add_stat_buff = function (self, sub_buff_template, buff)
	if FROZEN[self._unit] then
		return
	end

	local bonus = buff.bonus or 0
	local multiplier = buff.multiplier or 0
	local proc_chance = buff.proc_chance or 1
	local value = buff.value
	local stat_buffs = self._stat_buffs
	local stat_buff_type = sub_buff_template.stat_buff
	local stat_buff = stat_buffs[stat_buff_type]
	local application_method = StatBuffApplicationMethods[stat_buff_type]

	if sub_buff_template.wind_mutator then
		local wind_strength = Managers.weave:get_wind_strength()
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local wind_settings = Managers.weave:get_active_wind_settings()

		if wind_settings and difficulty_name and wind_strength then
			multiplier = wind_settings[sub_buff_template.stat_buff][difficulty_name][wind_strength]
		end
	end

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
		index = (application_method == "stacking_multiplier_multiplicative" and sub_buff_template.name) or 1

		if not stat_buff[index] then
			stat_buff[index] = {
				bonus = bonus,
				multiplier = multiplier,
				proc_chance = proc_chance,
				value = value
			}
		elseif application_method == "stacking_bonus" then
			local current_bonus = stat_buff[index].bonus
			stat_buff[index].bonus = current_bonus + bonus
		elseif application_method == "stacking_multiplier" or application_method == "stacking_multiplier_multiplicative" then
			local current_multiplier = stat_buff[index].multiplier
			stat_buff[index].multiplier = current_multiplier + multiplier
		elseif application_method == "stacking_bonus_and_multiplier" then
			local current_bonus = stat_buff[index].bonus
			local current_multiplier = stat_buff[index].multiplier
			stat_buff[index].bonus = current_bonus + bonus
			stat_buff[index].multiplier = current_multiplier + multiplier
		elseif application_method == "min" then
			local min_stat_buff = stat_buff[index]

			if not min_stat_buff.all_values then
				min_stat_buff.all_values = {
					min_stat_buff.value
				}
			end

			min_stat_buff.all_values[#min_stat_buff.all_values + 1] = value
			local prev_value = min_stat_buff.value or math.huge
			min_stat_buff.value = math.min(prev_value, value)
		end
	end

	return index
end

BuffExtension.update = function (self, unit, input, dt, context, t)
	local world = self.world
	local buffs = self._buffs
	local unit = self._unit
	local num_buffs = #buffs
	local i = 1

	while num_buffs >= i do
		local buff = buffs[i]
		local template = buff.template
		local end_time = buff.duration and buff.start_time + buff.duration
		buff_extension_function_params.bonus = buff.bonus
		buff_extension_function_params.multiplier = buff.multiplier
		buff_extension_function_params.value = buff.value
		buff_extension_function_params.t = t
		buff_extension_function_params.end_time = end_time
		buff_extension_function_params.attacker_unit = buff.attacker_unit

		if end_time and end_time <= t then
			self:_remove_sub_buff(buff, i, buff_extension_function_params)

			if template.buff_after_delay then
				local delayed_buff_name = buff.delayed_buff_name

				self:add_buff(delayed_buff_name)
			end
		else
			local update_func = template.update_func

			if update_func then
				local next_update_t = buff._next_update_t

				if not next_update_t or next_update_t < t then
					local time_into_buff = t - buff.start_time
					local time_left_on_buff = end_time and end_time - t
					buff_extension_function_params.time_into_buff = time_into_buff
					buff_extension_function_params.time_left_on_buff = time_left_on_buff

					BuffFunctionTemplates.functions[update_func](unit, buff, buff_extension_function_params, world)

					buff._next_update_t = t + (buff.template.update_frequency or 0)
				end
			end

			i = i + 1
		end

		num_buffs = #buffs
	end

	if num_buffs == 0 then
		Managers.state.entity:system("buff_system"):set_buff_ext_active(unit, false)
	end
end

BuffExtension.update_stat_buff = function (self, stat_buff_type, difference, index)
	local stat_buffs = self._stat_buffs
	local stat_buff = stat_buffs[stat_buff_type]
	local application_method = StatBuffApplicationMethods[stat_buff_type]
	index = index or 1

	if application_method == "stacking_bonus" then
		local current_bonus = stat_buff[index].bonus
		stat_buff[index].bonus = current_bonus + difference

		return stat_buff[index].bonus
	elseif application_method == "stacking_multiplier" or application_method == "stacking_multiplier_multiplicative" then
		local current_multiplier = stat_buff[index].multiplier
		stat_buff[index].multiplier = current_multiplier + difference

		return stat_buff[index].multiplier
	else
		fassert(false, "trying to update a stat with an incompatible application method")
	end
end

BuffExtension.remove_buff = function (self, id)
	local buffs = self._buffs
	local num_buffs = #buffs
	local end_time = Managers.time:time("game")
	local num_buffs_removed = 0
	local i = 1

	while num_buffs >= i do
		local buff = buffs[i]
		local template = buff.template
		buff_extension_function_params.bonus = buff.bonus
		buff_extension_function_params.multiplier = buff.multiplier
		buff_extension_function_params.value = buff.value
		buff_extension_function_params.t = end_time
		buff_extension_function_params.end_time = end_time
		buff_extension_function_params.attacker_unit = buff.attacker_unit

		if buff.id == id or (buff.parent_id and buff.parent_id == id) then
			self:_remove_sub_buff(buff, i, buff_extension_function_params)

			local new_buff_count = #buffs
			num_buffs_removed = num_buffs_removed + num_buffs - new_buff_count
			num_buffs = new_buff_count
		else
			i = i + 1
		end
	end

	if num_buffs == 0 then
		Managers.state.entity:system("buff_system"):set_buff_ext_active(self._unit, false)
	end

	return num_buffs_removed
end

BuffExtension._remove_sub_buff = function (self, buff, index, buff_extension_function_params)
	local world = self.world
	local template = buff.template
	local remove_buff_func = template.remove_buff_func

	if remove_buff_func then
		BuffFunctionTemplates.functions[remove_buff_func](self._unit, buff, buff_extension_function_params, world)
	end

	if template.stat_buff then
		self:_remove_stat_buff(buff)
	end

	local buff_to_remove = template.buff_to_add

	if buff_to_remove and remove_buff_func ~= "add_buff" then
		for i, buff in ipairs(self._buffs) do
			local buff_type = buff.buff_type

			if buff_type == buff_to_remove and not buff.duration then
				buff.duration = 0
			end
		end
	end

	if template.event_buff then
		local event = template.event
		local event_buff_index = buff.event_buff_index
		self._event_buffs[event][event_buff_index] = nil
	end

	table.remove(self._buffs, index)

	if #self._buffs == 0 then
		Managers.state.entity:system("buff_system"):set_buff_ext_active(self._unit, false)
	end

	local id = buff.id
	local deactivation_sound = self._deactivation_sounds[id]

	if deactivation_sound then
		self:_play_buff_sound(deactivation_sound)
	end

	local continuous_screen_effect_id = self._continuous_screen_effects[id]

	if continuous_screen_effect_id then
		self:_stop_screen_effect(continuous_screen_effect_id)
	end

	local deactivation_screen_effect = self._deactivation_screen_effects[id]

	if deactivation_screen_effect then
		self:_play_screen_effect(deactivation_screen_effect)
	end
end

BuffExtension._remove_stat_buff = function (self, buff)
	local sub_buff_template = buff.template
	local bonus = buff.bonus or 0
	local multiplier = buff.multiplier or 0
	local proc_chance = buff.proc_chance or 1
	local value = buff.value
	local stat_buff = sub_buff_template.stat_buff
	local stat_buffs = self._stat_buffs[stat_buff]
	local application_method = StatBuffApplicationMethods[stat_buff]

	if sub_buff_template.wind_mutator then
		local wind_strength = Managers.weave:get_wind_strength()
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local wind_settings = Managers.weave:get_active_wind_settings()

		if wind_settings and difficulty_name and wind_strength then
			multiplier = wind_settings[sub_buff_template.stat_buff][difficulty_name][wind_strength]
		end
	end

	local index = buff.stat_buff_index

	if application_method == "proc" then
		stat_buffs[index] = nil
	elseif application_method == "stacking_bonus" then
		local current_bonus = stat_buffs[index].bonus
		stat_buffs[index].bonus = current_bonus - bonus
	elseif application_method == "stacking_multiplier" or application_method == "stacking_multiplier_multiplicative" then
		local current_multiplier = stat_buffs[index].multiplier
		stat_buffs[index].multiplier = current_multiplier - multiplier
	elseif application_method == "stacking_bonus_and_multiplier" then
		local current_bonus = stat_buffs[index].bonus
		local current_multiplier = stat_buffs[index].multiplier
		stat_buffs[index].bonus = current_bonus - bonus
		stat_buffs[index].multiplier = current_multiplier - multiplier
	elseif application_method == "min" then
		local min_stat_buff = stat_buffs[index]

		if min_stat_buff.all_values then
			local index_to_remove = table.index_of(min_stat_buff.all_values, value)

			fassert(index_to_remove ~= -1, "buff needs to be there when removed, if it's not then something went wrong")
			table.swap_delete(min_stat_buff.all_values, index_to_remove)

			if #min_stat_buff.all_values == 0 then
				min_stat_buff.value = nil
			else
				min_stat_buff.value = min_stat_buff.all_values[1]

				for _, other_buff_value in ipairs(min_stat_buff.all_values) do
					min_stat_buff.value = math.min(min_stat_buff.value, other_buff_value)
				end
			end
		else
			fassert(min_stat_buff.value == value, "buff needs to be there when removed, if it's not then something went wrong")

			min_stat_buff.value = nil
		end
	end
end

BuffExtension.get_buff_type = function (self, buff_type)
	local buffs = self._buffs
	local num_buffs = #buffs

	for i = 1, num_buffs, 1 do
		local buff = buffs[i]

		if buff.buff_type == buff_type then
			return buff
		end
	end

	return nil
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

BuffExtension.num_buff_perk = function (self, perk_name)
	local buffs = self._buffs
	local num_buffs = #buffs
	local num_buff_perk = 0

	for i = 1, num_buffs, 1 do
		local buff = buffs[i]
		local buff_template = buff.template

		if buff_template.perk == perk_name then
			num_buff_perk = num_buff_perk + 1
		end
	end

	return num_buff_perk
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

BuffExtension.has_procced = function (self, proc_chance, key)
	local prd_states = self._prd_states
	local success = nil
	local prev_state = prd_states[key]
	success, prd_states[key] = PseudoRandomDistribution.flip_coin(prev_state, proc_chance)

	return success
end

BuffExtension.trigger_procs = function (self, event, ...)
	local event_buffs = self._event_buffs[event]
	local num_event_buffs = table.size(event_buffs)

	if num_event_buffs == 0 then
		return
	end

	local player = Managers.player:owner(self._unit)
	local num_args = select("#", ...)
	local params = FrameTable.alloc_table()
	local event_buffs_to_remove = FrameTable.alloc_table()

	for i = 1, num_args, 1 do
		local arg = select(i, ...)
		params[i] = arg
	end

	for index, buff in pairs(event_buffs) do
		local proc_chance = buff.proc_chance or 1

		if self:has_procced(proc_chance, buff) then
			local buff_func = ProcFunctions[buff.buff_func]
			local success = buff_func(player, buff, params)

			if success and buff.template.remove_on_proc then
				event_buffs_to_remove[#event_buffs_to_remove + 1] = buff
			end
		end
	end

	for i = 1, #event_buffs_to_remove, 1 do
		local buff = event_buffs_to_remove[i]
		local id = buff.id

		self:remove_buff(id)
	end
end

BuffExtension.get_buff_value = function (self, stat_buff)
	local unit = self._unit
	local stat_buffs = self._stat_buffs[stat_buff]
	local procced = false
	local is_proc = StatBuffApplicationMethods[stat_buff] == "proc"
	local final_value, id = nil

	for name, stat_buff_data in pairs(stat_buffs) do
		local proc_chance = stat_buff_data.proc_chance

		if math.random() <= proc_chance then
			final_value = stat_buff_data.value

			if is_proc then
				procced = true
				id = stat_buff_data.id

				break
			end
		end
	end

	return final_value, procced, id
end

BuffExtension.apply_buffs_to_value = function (self, value, stat_buff)
	local unit = self._unit
	local stat_buffs = self._stat_buffs[stat_buff]
	local final_value = value
	local procced = false
	local is_proc = StatBuffApplicationMethods[stat_buff] == "proc"
	local id = nil

	for name, stat_buff_data in pairs(stat_buffs) do
		local proc_chance = stat_buff_data.proc_chance

		if self:has_procced(proc_chance, stat_buff) then
			local bonus = stat_buff_data.bonus
			local multiplier = stat_buff_data.multiplier

			if type(multiplier) == "table" then
				local wind_strength = Managers.weave:get_wind_strength()
				multiplier = multiplier[wind_strength]
			end

			multiplier = multiplier + 1
			final_value = final_value * multiplier + bonus

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

		first_person_extension:play_hud_sound_event(sound_event)
	end
end

BuffExtension._play_screen_effect = function (self, effect)
	local unit = self._unit

	if ScriptUnit.has_extension(unit, "first_person_system") then
		local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
		local effect_id = first_person_extension:create_screen_particles(effect)

		return effect_id
	end

	return nil
end

BuffExtension._stop_screen_effect = function (self, effect_id)
	local unit = self._unit

	if effect_id and ScriptUnit.has_extension(unit, "first_person_system") then
		local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

		first_person_extension:stop_spawning_screen_particles(effect_id)
	end
end

BuffExtension.active_buffs = function (self)
	return self._buffs
end

BuffExtension.initial_buff_names = function (self)
	return self._initial_buff_names
end

BuffExtension.get_persistent_buff_names = function (self)
	local persistent_buffs = {}

	for _, buff_data in pairs(self._buffs) do
		local template = buff_data.template

		if template.is_persistent then
			table.insert(persistent_buffs, template.name)
		end
	end

	return persistent_buffs
end

BuffExtension._activate_initial_buffs = function (self)
	local initial_buff_names = self._initial_buff_names

	if initial_buff_names then
		for _, buff_name in ipairs(initial_buff_names) do
			self:add_buff(buff_name)
		end
	end
end

return
