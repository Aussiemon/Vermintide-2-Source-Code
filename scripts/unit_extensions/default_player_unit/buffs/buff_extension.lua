require("scripts/helpers/pseudo_random_distribution")
dofile("scripts/settings/bpc")

local buff_perk_functions = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_functions")
local buff_perk_names = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
script_data.buff_debug = script_data.buff_debug or Development.parameter("buff_debug")
BuffExtension = class(BuffExtension)
buff_extension_function_params = buff_extension_function_params or Script.new_map(15)
local _removed_buff = {
	removed = true
}

BuffExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self.world = extension_init_context.world
	self._breed = extension_init_data.breed
	self._initial_buff_names = extension_init_data.initial_buff_names
	self._buffs = {}
	self._num_buffs = 0
	self._stat_buffs = {}
	self._event_buffs = {}
	self._event_buffs_index = 1
	self._any_buff_removed = false
	self._deactivation_sounds = {}
	self._deactivation_sounds_3p = {}
	self._continuous_screen_effects = {}
	self._deactivation_screen_effects = {}
	self._vfx = {}

	for stat_buff_name, _ in pairs(StatBuffApplicationMethods) do
		self._stat_buffs[stat_buff_name] = {}
	end

	for i = 1, #ProcEvents do
		local proc_event = ProcEvents[i]
		self._event_buffs[proc_event] = {}
	end

	self.is_server = Managers.player.is_server
	self.is_local = not Managers.player.remote
	self.is_husk = extension_init_data.is_husk
	self.id = 1
	self.individual_stat_buff_index = 1
	self._prd_states = {}
	self._perks = {}
	self._buff_id_refs = {}
	self._stacking_buffs = {}
	self.reset_material_cache = nil
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
			for i = 1, num_group_buffs do
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

	if self._num_buffs > 0 then
		Managers.state.entity:system("buff_system"):set_buff_ext_active(self._unit, true)
	end
end

BuffExtension.destroy = function (self)
	self:clear()
end

BuffExtension.freeze = function (self)
	self:clear()

	self._ai_frozen = true
end

BuffExtension.unfreeze = function (self)
	self._ai_frozen = nil
end

BuffExtension.clear = function (self)
	local buffs = self._buffs
	local end_time = Managers.time:time("game")
	local buff_extension_function_params = buff_extension_function_params
	buff_extension_function_params.t = end_time
	buff_extension_function_params.end_time = end_time

	for i = 1, self._num_buffs do
		local buff = buffs[i]

		if not buff.removed then
			buff_extension_function_params.bonus = buff.bonus
			buff_extension_function_params.multiplier = buff.multiplier
			buff_extension_function_params.value = buff.value
			buff_extension_function_params.attacker_unit = buff.attacker_unit
			buff_extension_function_params.source_attacker_unit = buff.source_attacker_unit

			self:_remove_sub_buff(buff, i, buff_extension_function_params, false)
		end
	end

	table.clear(buffs)
	table.clear(self._perks)
	table.clear(self._buff_id_refs)
	table.clear(self._stacking_buffs)

	self._num_buffs = 0
	self._id_to_local_sync = nil
	self._local_sync_to_id = nil
	self._synced_buff_owner = nil
	self._buff_to_sync_type = nil
	self._id_to_server_sync = nil
	self._server_sync_to_id = nil
	self._remove_buff_queue = nil

	Managers.state.entity:system("buff_system"):set_buff_ext_active(self._unit, false)
end

BuffExtension.add_buff = function (self, template_name, params)
	local unit = self._unit

	if FROZEN[unit] or self._ai_frozen then
		return
	end

	local buffs = self._buffs
	local buff_template = BuffTemplates[template_name]
	local sub_buffs = buff_template.buffs
	local time_offset = params and params._hot_join_sync_buff_age or 0
	local start_time = Managers.time:time("game") - time_offset
	local id = self:claim_buff_id()
	local world = self.world
	local is_server = self.is_server

	if self._num_buffs == 0 then
		Managers.state.entity:system("buff_system"):set_buff_ext_active(unit, true)
	end

	local parent_buff_shared_table = buff_template.create_parent_buff_shared_table and {}
	local sub_buffs_added = 0

	for i = 1, #sub_buffs do
		local sub_buff_template = sub_buffs[i]
		local condition = sub_buff_template.apply_condition

		if not condition or condition(unit, sub_buff_template, params) then
			local duration = sub_buff_template.duration
			local ticks = sub_buff_template.ticks
			local update_frequency = sub_buff_template.update_frequency
			local max_stacks = sub_buff_template.max_stacks
			local is_stacking_buff = max_stacks
			local parent_id = nil
			local bonus = sub_buff_template.bonus
			local value = sub_buff_template.value
			local multiplier = sub_buff_template.multiplier
			local proc_chance = sub_buff_template.proc_chance
			local proc_cooldown = sub_buff_template.proc_cooldown
			local range = sub_buff_template.range
			local damage_source, power_level, attacker_unit, source_attacker_unit = nil

			if params then
				local variable_value = params.variable_value

				if variable_value then
					local variable_bonus_table = sub_buff_template.variable_bonus

					if variable_bonus_table then
						local bonus_index = variable_value == 1 and #variable_bonus_table or 1 + math.floor(variable_value / (1 / #variable_bonus_table))
						bonus = variable_bonus_table[bonus_index]
					end

					local variable_bonus_max = sub_buff_template.variable_bonus_max

					if variable_bonus_max then
						bonus = math.lerp(0, variable_bonus_max, variable_value)
					end

					local variable_multiplier_table = sub_buff_template.variable_multiplier

					if variable_multiplier_table then
						local min_multiplier = variable_multiplier_table[1]
						local max_multiplier = variable_multiplier_table[2]
						multiplier = math.lerp(min_multiplier, max_multiplier, variable_value)
					end

					local variable_multiplier_max = sub_buff_template.variable_multiplier_max

					if variable_multiplier_max then
						multiplier = math.lerp(0, variable_multiplier_max, variable_value)
					end
				end

				parent_id = params.parent_id or parent_id
				bonus = params.external_optional_bonus or bonus
				multiplier = params.external_optional_multiplier or multiplier
				value = params.external_optional_value or value
				proc_chance = params.external_optional_proc_chance or proc_chance
				duration = params.external_optional_duration or duration
				ticks = params.external_optional_ticks or ticks
				range = params.external_optional_range or range
				damage_source = params.damage_source or damage_source
				power_level = params.power_level or power_level
				attacker_unit = params.attacker_unit or attacker_unit
				source_attacker_unit = params.source_attacker_unit or source_attacker_unit
			end

			if sub_buff_template.duration_modifier_func then
				duration, ticks = sub_buff_template:duration_modifier_func(duration, self, params)
			end

			local perks = sub_buff_template.perks

			if perks and table.find(perks, buff_perk_names.burning_balefire) then
				local source = source_attacker_unit or attacker_unit
				local source_buff_extension = ScriptUnit.has_extension(source, "buff_system")

				if source_buff_extension and not Managers.state.side:is_ally(unit, source) then
					local duration_multiplier = source_buff_extension:apply_buffs_to_value(1, "increased_balefire_dot_duration")
					duration = duration and duration * duration_multiplier
					ticks = ticks and math.floor(ticks * duration_multiplier)
					update_frequency = update_frequency and update_frequency * duration_multiplier
				end
			end

			local end_time = duration and start_time + duration

			if not is_stacking_buff or self:_add_stacking_buff(sub_buff_template, max_stacks, start_time, duration, end_time, params) then
				local buff = {
					id = id,
					start_time = start_time,
					template = sub_buff_template,
					buff_type = sub_buff_template.name,
					buff_template_name = template_name,
					parent_id = parent_id,
					bonus = bonus,
					multiplier = multiplier,
					value = value,
					proc_chance = proc_chance,
					proc_cooldown = proc_cooldown,
					duration = duration,
					ticks = ticks,
					current_ticks = ticks and 0 or nil,
					update_frequency = update_frequency,
					range = range,
					damage_source = damage_source,
					power_level = power_level,
					attacker_unit = attacker_unit,
					source_attacker_unit = source_attacker_unit,
					parent_buff_shared_table = parent_buff_shared_table
				}
				self._num_buffs = self._num_buffs + 1
				buffs[self._num_buffs] = buff
				sub_buffs_added = sub_buffs_added + 1

				if is_stacking_buff then
					local current_buff_stacks = self._stacking_buffs[sub_buff_template.name]

					if not current_buff_stacks then
						current_buff_stacks = {}
						self._stacking_buffs[sub_buff_template.name] = current_buff_stacks
						local on_stack_buff_first_add = StackingBuffFunctions[sub_buff_template.on_stack_buff_first_add]

						if on_stack_buff_first_add then
							on_stack_buff_first_add(self._unit, sub_buff_template, params)
						end
					end

					current_buff_stacks[#current_buff_stacks + 1] = buff
				end

				if perks then
					for perk_i = 1, #perks do
						local perk = perks[perk_i]
						local perk_count = self._perks[perk] or 0

						if perk_count == 0 then
							local perk_funcs = buff_perk_functions[perk]

							if perk_funcs and perk_funcs.added then
								perk_funcs.added(self, unit, buff, is_server)
							end
						end

						self._perks[perk] = perk_count + 1
					end
				end

				if sub_buff_template.buff_area then
					local unit_spawner = Managers.state.unit_spawner
					local extension_init_data = {
						buff_area_system = {
							removal_proc_function_name = sub_buff_template.exit_area_func,
							add_proc_function_name = sub_buff_template.enter_area_func,
							duration = duration,
							radius = sub_buff_template.area_radius,
							sub_buff_template = sub_buff_template,
							owner_unit = unit,
							source_unit = source_attacker_unit
						}
					}
					local position = params and params.buff_area_position or POSITION_LOOKUP[self._unit]
					local buff_unit, buff_unit_go_id = unit_spawner:spawn_network_unit(sub_buff_template.area_unit_name, "buff_aoe_unit", extension_init_data, position, Quaternion.identity(), nil)
					buff.area_buff_unit = buff_unit
				end

				if sub_buff_template.status_effect then
					Managers.state.status_effect:set_status(unit, sub_buff_template.status_effect, buff, true)
				end

				local apply_buff_func = sub_buff_template.apply_buff_func

				if apply_buff_func then
					buff_extension_function_params.bonus = bonus
					buff_extension_function_params.multiplier = multiplier
					buff_extension_function_params.value = value
					buff_extension_function_params.t = start_time
					buff_extension_function_params.end_time = end_time
					buff_extension_function_params.attacker_unit = buff.attacker_unit
					buff_extension_function_params.source_attacker_unit = buff.source_attacker_unit

					BuffFunctionTemplates.functions[apply_buff_func](unit, buff, buff_extension_function_params, world)
				end

				if sub_buff_template.stat_buff then
					local index = self:_add_stat_buff(sub_buff_template, buff)
					buff.stat_buff_index = index
				end

				local event = sub_buff_template.event

				if event then
					local buff_func = sub_buff_template.buff_func
					buff.buff_func = buff_func
					local index = self._event_buffs_index
					buff.event_buff_index = index
					local event_buffs = self._event_buffs[event]
					event_buffs[index] = buff
					self._event_buffs_index = index + 1
				end

				if sub_buff_template.duration_end_func then
					local delayed_func_name = sub_buff_template.duration_end_func
					buff.delayed_func_name = delayed_func_name
				end

				if sub_buff_template.continuous_effect then
					self._continuous_screen_effects[id] = self:_play_screen_effect(sub_buff_template.continuous_effect)
				end

				local particles = sub_buff_template.particles

				if particles then
					local target_unit = unit
					local is_first_person = false

					if self.is_local and not self.is_husk then
						local first_person_extension = ScriptUnit.has_extension(target_unit, "first_person_system")

						if first_person_extension and first_person_extension.first_person_unit then
							target_unit = first_person_extension.first_person_unit
							is_first_person = true
						end
					end

					self._vfx[id] = BuffUtils.create_attached_particles(world, particles, target_unit, is_first_person)
				end

				local sfx = sub_buff_template.sfx

				if sfx then
					local activation_sound = sfx.activation_sound

					if activation_sound then
						self:_play_buff_sound(activation_sound, sfx.activation_sound_3p)
					end
				end
			end
		end
	end

	self._buff_id_refs[id] = sub_buffs_added
	local activation_sound = buff_template.activation_sound

	if activation_sound then
		self:_play_buff_sound(activation_sound, buff_template.activation_sound_3p)
	end

	local activation_effect = buff_template.activation_effect

	if activation_effect then
		self:_play_screen_effect(activation_effect)
	end

	if sub_buffs_added > 0 then
		local deactivation_effect = buff_template.deactivation_effect

		if deactivation_effect then
			self._deactivation_screen_effects[id] = deactivation_effect
		end

		local deactivation_sound = buff_template.deactivation_sound

		if deactivation_sound then
			self._deactivation_sounds[id] = deactivation_sound

			if buff_template.activation_sound_3p then
				self._deactivation_sounds_3p[id] = buff_template.activation_sound_3p
			end
		end
	end

	return id, sub_buffs_added
end

BuffExtension._add_stacking_buff = function (self, sub_buff_template, max_stacks, start_time, duration, end_time, params)
	local current_buff_stacks = self._stacking_buffs[sub_buff_template.name]
	local num_stacks = current_buff_stacks and #current_buff_stacks or 0

	if duration and sub_buff_template.refresh_durations then
		for stack_idx = 1, num_stacks do
			local stack_buff = current_buff_stacks[stack_idx]

			self:_refresh_duration(stack_buff, start_time, duration, end_time, params, sub_buff_template)
		end
	end

	if sub_buff_template.refresh_buff_area_position then
		for stack_idx = 1, num_stacks do
			local stack_buff = current_buff_stacks[stack_idx]
			local area_buff_unit = stack_buff.area_buff_unit

			if area_buff_unit then
				local buff_area_extension = ScriptUnit.has_extension(area_buff_unit, "buff_area_system")

				if buff_area_extension then
					buff_area_extension:set_unit_position(POSITION_LOOKUP[self._unit])
				end
			end
		end
	end

	if params and params.refresh_duration_only and num_stacks > 0 then
		return false
	end

	local should_add_buff = true

	if max_stacks <= num_stacks then
		local on_max_stacks_overflow_func = StackingBuffFunctions[sub_buff_template.on_max_stacks_overflow_func]

		if on_max_stacks_overflow_func then
			should_add_buff = on_max_stacks_overflow_func(self._unit, sub_buff_template, params)
		else
			should_add_buff = false
		end
	elseif num_stacks == max_stacks - 1 then
		local on_max_stacks_func = StackingBuffFunctions[sub_buff_template.on_max_stacks_func]

		if on_max_stacks_func then
			on_max_stacks_func(self._unit, sub_buff_template, params)
		end

		if sub_buff_template.reset_on_max_stacks then
			local buffs = self._buffs

			for i = 1, self._num_buffs do
				local buff = buffs[i]

				if buff.buff_type == sub_buff_template.name then
					buff_extension_function_params.bonus = buff.bonus
					buff_extension_function_params.multiplier = buff.multiplier
					buff_extension_function_params.value = buff.value
					buff_extension_function_params.t = start_time
					buff_extension_function_params.end_time = buff.duration and buff.start_time + buff.duration
					buff_extension_function_params.attacker_unit = buff.attacker_unit
					buff_extension_function_params.source_attacker_unit = buff.source_attacker_unit

					self:_remove_sub_buff(buff, i, buff_extension_function_params, true)
				end
			end

			should_add_buff = false
		end
	end

	return should_add_buff
end

BuffExtension._refresh_duration = function (self, buff, start_time, duration, end_time, params, template)
	if buff.area_buff_unit then
		local buff_area_extension = ScriptUnit.has_extension(buff.area_buff_unit, "buff_area_system")

		if buff_area_extension then
			buff_area_extension:set_duration(duration)
		end
	end

	buff.start_time = start_time
	buff.duration = duration
	buff.end_time = end_time
	buff.attacker_unit = params and params.attacker_unit or nil
	buff.source_attacker_unit = params and params.source_attacker_unit or nil
	local reapply_buff_func = template.reapply_buff_func

	if reapply_buff_func then
		buff_extension_function_params.bonus = buff.bonus
		buff_extension_function_params.multiplier = buff.multiplier
		buff_extension_function_params.value = buff.value
		buff_extension_function_params.t = start_time
		buff_extension_function_params.end_time = end_time
		buff_extension_function_params.attacker_unit = buff.attacker_unit
		buff_extension_function_params.source_attacker_unit = buff.source_attacker_unit
		local world = self.world

		BuffFunctionTemplates.functions[reapply_buff_func](self._unit, buff, buff_extension_function_params, world)
	end
end

BuffExtension._add_stat_buff = function (self, sub_buff_template, buff)
	if FROZEN[self._unit] or self._ai_frozen then
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
		index = application_method == "stacking_multiplier_multiplicative" and (sub_buff_template.stacking_name or sub_buff_template.name) or 1

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
	local buff_extension_function_params = buff_extension_function_params
	buff_extension_function_params.t = t
	local queue = self._remove_buff_queue

	if queue then
		self._remove_buff_queue = nil

		for i = 1, #queue do
			self:remove_buff(queue[i])
		end
	end

	for i = 1, self._num_buffs do
		local buff = buffs[i]

		if not buff.removed then
			local template = buff.template
			local end_time = buff.duration and buff.start_time + buff.duration
			local ticks = buff.ticks
			local current_ticks = buff.current_ticks
			buff_extension_function_params.bonus = buff.bonus
			buff_extension_function_params.multiplier = buff.multiplier
			buff_extension_function_params.value = buff.value
			buff_extension_function_params.end_time = end_time
			buff_extension_function_params.attacker_unit = buff.attacker_unit
			buff_extension_function_params.source_attacker_unit = buff.source_attacker_unit
			local done_ticking = ticks and ticks <= current_ticks

			if end_time and end_time <= t or not end_time and done_ticking then
				if template.remove_buff_on_duration_end then
					self:remove_buff(buff.id)
				else
					self:_remove_sub_buff(buff, i, buff_extension_function_params, true)
				end

				local delayed_func_name = buff.delayed_func_name

				if delayed_func_name and not buff.aborted then
					local delayed_func = BuffFunctionTemplates.functions[delayed_func_name]

					delayed_func(unit, buff, buff_extension_function_params, world)
				end
			elseif not done_ticking then
				local update_func = template.update_func

				if update_func then
					local next_update_t = buff._next_update_t

					if not next_update_t then
						next_update_t = t + (buff.template.update_start_delay or 0)
						buff._next_update_t = next_update_t
					end

					if next_update_t <= t then
						buff_extension_function_params.time_into_buff = t - buff.start_time
						buff_extension_function_params.time_left_on_buff = end_time and end_time - t
						local override_update_t = BuffFunctionTemplates.functions[update_func](unit, buff, buff_extension_function_params, world)
						buff._next_update_t = override_update_t or t + (buff.update_frequency or 0)

						if current_ticks then
							buff.current_ticks = current_ticks + 1
						end
					end
				end
			end
		end
	end

	local i = 1
	local removed = 0

	while i <= self._num_buffs - removed do
		buffs[i] = buffs[i + removed]

		if not buffs[i] then
			break
		elseif buffs[i].removed then
			removed = removed + 1
		else
			i = i + 1
		end
	end

	for j = i, self._num_buffs do
		buffs[j] = nil
	end

	self._num_buffs = self._num_buffs - removed

	if self._num_buffs == 0 then
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

BuffExtension.num_sub_buffs = function (self, id)
	local buffs = self._buffs
	local parent_buff_index = table.find_by_key(buffs, "id", id)

	if not parent_buff_index then
		return -1
	end

	local parent_buff = buffs[parent_buff_index]
	local sub_buff_name = parent_buff.template.buff_to_add

	if not sub_buff_name then
		return -1
	end

	local counter = 0

	for i = 1, self._num_buffs do
		local buff = buffs[i]

		if buff.buff_type == sub_buff_name then
			counter = counter + 1
		end
	end

	return counter
end

BuffExtension.remove_buff = function (self, id, skip_net_sync)
	if not id then
		return
	end

	local buffs = self._buffs
	local end_time = Managers.time:time("game")
	local num_buffs_removed = 0
	local buff_extension_function_params = buff_extension_function_params
	buff_extension_function_params.t = end_time
	buff_extension_function_params.end_time = end_time

	for i = 1, self._num_buffs do
		local buff = buffs[i]

		if buff.id == id or buff.parent_id and buff.parent_id == id then
			buff_extension_function_params.bonus = buff.bonus
			buff_extension_function_params.multiplier = buff.multiplier
			buff_extension_function_params.value = buff.value
			buff_extension_function_params.attacker_unit = buff.attacker_unit
			buff_extension_function_params.source_attacker_unit = buff.source_attacker_unit

			self:_remove_sub_buff(buff, i, buff_extension_function_params, false)
		end
	end

	if self._num_buffs == 0 then
		Managers.state.entity:system("buff_system"):set_buff_ext_active(self._unit, false)
	end

	if not skip_net_sync then
		self:_remove_buff_synced(id)
	end

	self:_free_sync_id(id)
end

BuffExtension.queue_remove_buff = function (self, id)
	local queue = self._remove_buff_queue or {}
	queue[#queue + 1] = id
	self._remove_buff_queue = queue
end

BuffExtension._remove_sub_buff = function (self, buff, index, buff_extension_function_params, free_sync_ids)
	local world = self.world
	local buffs = self._buffs
	local template = buff.template
	local remove_buff_func = template.remove_buff_func
	local buffs_to_remove_on_remove = template.buffs_to_remove_on_remove

	if remove_buff_func then
		BuffFunctionTemplates.functions[remove_buff_func](self._unit, buff, buff_extension_function_params, world)
	end

	if template.status_effect then
		Managers.state.status_effect:set_status(self._unit, template.status_effect, buff, false)
	end

	if buffs_to_remove_on_remove then
		for i = 1, #buffs_to_remove_on_remove do
			if buff.buff_type ~= buffs_to_remove_on_remove[i] then
				for j = 1, self._num_buffs do
					local all_buff = buffs[j]

					if all_buff then
						local buff_type = all_buff.buff_type

						if buff_type == buffs_to_remove_on_remove[i] then
							if all_buff.delayed_func_name then
								all_buff.aborted = true
							end

							self:remove_buff(all_buff.id)
						end
					end
				end
			end
		end
	end

	if template.stat_buff then
		self:_remove_stat_buff(buff)
	end

	local buff_to_remove = template.buff_to_add

	if buff_to_remove and remove_buff_func ~= "add_buff" then
		for i = 1, self._num_buffs do
			local buff = buffs[i]

			if buff.buff_type == buff_to_remove and not buff.duration then
				buff.duration = 0
				buff.is_stale = true
			end
		end
	end

	local event = template.event

	if event then
		local event_buff_index = buff.event_buff_index
		self._event_buffs[event][event_buff_index] = nil
	end

	local perks = template.perks

	if perks then
		for perk_i = 1, #perks do
			local perk = perks[perk_i]
			local perk_count = self._perks[perk] - 1

			if perk_count == 0 then
				local perk_funcs = buff_perk_functions[perk]

				if perk_funcs and perk_funcs.removed then
					perk_funcs.removed(self, self._unit, buff, self.is_server)
				end
			end

			self._perks[perk] = perk_count
		end
	end

	buffs[index] = _removed_buff
	self._any_buff_removed = true
	local is_stacking_buff = buff.template.max_stacks

	if is_stacking_buff then
		local buff_stacks = self._stacking_buffs[buff.template.name]
		local buff_idx = table.index_of(buff_stacks, buff)

		if buff_idx > 0 then
			table.swap_delete(buff_stacks, buff_idx)
		end

		if template.refresh_other_stacks_on_remove then
			local t = Managers.time:time("game")

			for i = 1, #buff_stacks do
				local stack_buff = buff_stacks[i]
				local start_time = t
				local duration = stack_buff.duration
				local end_time = duration and start_time + duration

				self:_refresh_duration(stack_buff, start_time, duration, end_time, buff_extension_function_params, template)
			end
		end

		if #buff_stacks == 0 then
			local on_last_stack_removed = StackingBuffFunctions[template.on_last_stack_removed]

			if on_last_stack_removed then
				on_last_stack_removed(self._unit, template, buff_extension_function_params)
			end

			self._stacking_buffs[template.name] = nil
		end
	end

	buff.is_stale = true

	if self._num_buffs == 0 then
		Managers.state.entity:system("buff_system"):set_buff_ext_active(self._unit, false)
	end

	local id = buff.id
	local buff_id_refs = (self._buff_id_refs[id] or 0) - 1

	if buff_id_refs > 0 then
		self._buff_id_refs[id] = buff_id_refs
		free_sync_ids = false
	else
		self._buff_id_refs[id] = nil
	end

	if free_sync_ids and self._id_to_local_sync then
		if self._buff_to_sync_type and self._buff_to_sync_type[id] == BuffSyncType.Client then
			self:_remove_buff_synced(id)
		end

		self:_free_sync_id(id)
	end

	local deactivation_sound = self._deactivation_sounds[id]

	if deactivation_sound then
		self:_play_buff_sound(deactivation_sound, self._deactivation_sounds_3p[id])

		self._deactivation_sounds[id] = nil
		self._deactivation_sounds_3p[id] = nil
	end

	local continuous_screen_effect_id = self._continuous_screen_effects[id]

	if continuous_screen_effect_id then
		self:_stop_screen_effect(continuous_screen_effect_id)

		self._continuous_screen_effects[id] = nil
	end

	local deactivation_screen_effect = self._deactivation_screen_effects[id]

	if deactivation_screen_effect then
		self:_play_screen_effect(deactivation_screen_effect)

		self._deactivation_screen_effects[id] = nil
	end

	if not is_stacking_buff or not self._stacking_buffs[buff.template.name] then
		local particles = self._vfx[id]

		if particles then
			BuffUtils.destroy_attached_particles(world, particles)

			self._vfx[id] = nil
		end
	end
end

BuffExtension._remove_stat_buff = function (self, buff)
	local sub_buff_template = buff.template
	local bonus = buff.bonus or 0
	local multiplier = buff.multiplier or 0
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

	for i = 1, self._num_buffs do
		local buff = buffs[i]

		if buff.buff_type == buff_type then
			return buff
		end
	end

	return nil
end

BuffExtension.get_buff_by_id = function (self, buff_id)
	if not buff_id then
		return nil
	end

	local buffs = self._buffs

	for i = 1, self._num_buffs do
		local buff = buffs[i]

		if buff.id == buff_id then
			return buff
		end
	end

	return nil
end

BuffExtension.has_buff_type = function (self, buff_type)
	local buffs = self._buffs

	for i = 1, self._num_buffs do
		local buff = buffs[i]

		if buff.buff_type == buff_type then
			return true
		end
	end

	return false
end

BuffExtension.has_buff_perk = function (self, perk_name)
	local perk_count = self._perks[perk_name]

	return perk_count and perk_count > 0
end

BuffExtension.num_buff_perk = function (self, perk_name)
	return self._perks[perk_name] or 0
end

BuffExtension.get_non_stacking_buff = function (self, buff_type)
	local buffs = self._buffs

	for i = 1, self._num_buffs do
		local buff = buffs[i]

		if buff.buff_type == buff_type then
			fassert(buff.template.max_stacks and buff.template.max_stacks == 1, "Tried getting a stacking buff!")

			return buff
		end
	end

	return nil
end

BuffExtension.get_stacking_buff = function (self, buff_type)
	return self._stacking_buffs[buff_type]
end

BuffExtension.num_buff_stacks = function (self, buff_type)
	local buff_stacks = self._stacking_buffs[buff_type]

	return buff_stacks and #buff_stacks or 0
end

BuffExtension.num_buff_type = function (self, buff_type)
	local buff_stacks = self._stacking_buffs[buff_type]

	if buff_stacks then
		return #buff_stacks
	end

	local buffs = self._buffs
	local num_buff_type = 0

	for i = 1, self._num_buffs do
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

local function WEIGHTED_PROCS_SORT_FUNC(a, b)
	return b.proc_weight < a.proc_weight
end

local function has_authority(buff, is_server, is_local)
	local authority = buff.template.authority

	return not authority or authority == "server" and is_server or authority == "client" and is_local
end

BuffExtension.trigger_procs = function (self, event, ...)
	local event_buffs = self._event_buffs[event]
	local num_event_buffs = table.size(event_buffs)

	if num_event_buffs == 0 then
		return
	end

	local is_server = self.is_server
	local is_local = self.is_local
	local world = self.world
	local num_args = select("#", ...)
	local current_time = Managers.time:time("game")
	local params = FrameTable.alloc_table()
	local event_buffs_to_remove = FrameTable.alloc_table()

	for i = 1, num_args do
		local arg = select(i, ...)
		params[i] = arg
	end

	local weigthed_proc_keys = 1
	local temp_weighted_procs = FrameTable.alloc_table()

	for index, buff in pairs(event_buffs) do
		local proc_chance = buff.proc_chance or 1

		if has_authority(buff, is_server, is_local) and current_time > (buff._next_proc_t or 0) and self:has_procced(proc_chance, buff) then
			buff._next_proc_t = buff.template.proc_cooldown and buff.template.proc_cooldown + current_time
			local proc_weight = buff.template.proc_weight or 0
			temp_weighted_procs[weigthed_proc_keys] = {
				buff = buff,
				proc_weight = proc_weight
			}
			weigthed_proc_keys = weigthed_proc_keys + 1
		end
	end

	table.sort(temp_weighted_procs, WEIGHTED_PROCS_SORT_FUNC)

	local owner = self._unit

	for i = 1, #temp_weighted_procs do
		local buff = temp_weighted_procs[i].buff
		local buff_func_name = buff.buff_func
		local buff_func = ProcFunctions[buff_func_name]
		local success = buff_func(owner, buff, params, world, ProcEventParams[event])

		if success and buff.template.remove_on_proc then
			event_buffs_to_remove[#event_buffs_to_remove + 1] = buff
		end
	end

	for i = 1, #event_buffs_to_remove do
		local buff = event_buffs_to_remove[i]
		local id = buff.id

		self:remove_buff(id)
	end
end

BuffExtension.get_buff_value = function (self, stat_buff)
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

BuffExtension._play_buff_sound = function (self, sound_event, is_synced_3p)
	local unit = self._unit

	if is_synced_3p then
		local audio_system_extension = Managers.state.entity:system("audio_system")

		audio_system_extension:play_audio_unit_event(sound_event, unit)
	elseif ScriptUnit.has_extension(unit, "first_person_system") then
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
	return self._buffs, self._num_buffs
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

BuffExtension.set_pending_sync_id = function (self, buff_id, local_sync_id, sync_type, orphanated)
	self:_initalize_sync_tables()

	self._id_to_local_sync[buff_id] = local_sync_id
	self._local_sync_to_id[local_sync_id] = buff_id
	self._buff_to_sync_type[buff_id] = sync_type
end

BuffExtension.apply_sync_id = function (self, local_sync_id, server_sync_id)
	local buff_id = self._local_sync_to_id and self._local_sync_to_id[local_sync_id]

	if buff_id then
		self:_initalize_sync_tables()

		self._id_to_server_sync[buff_id] = server_sync_id
		self._server_sync_to_id[server_sync_id] = buff_id

		return true
	end

	return false
end

BuffExtension.apply_remote_sync_id = function (self, buff_id, server_sync_id, sync_type, owner_peer_id)
	if buff_id then
		self:_initalize_sync_tables()

		self._id_to_server_sync[buff_id] = server_sync_id
		self._server_sync_to_id[server_sync_id] = buff_id
		self._buff_to_sync_type[buff_id] = sync_type
		self._synced_buff_owner[buff_id] = owner_peer_id
	end
end

BuffExtension.generate_sync_id = function (self)
	local sync_id = nil
	local free_sync_ids = self._free_sync_ids

	if free_sync_ids then
		sync_id = free_sync_ids[1]

		fassert(sync_id, "[BuffExtension] Too many synced buffs, no free sync ids left!")
		table.swap_delete(free_sync_ids, 1)
	else
		sync_id = self._next_sync_id or 1

		if NetworkConstants.server_controlled_buff_id.max < sync_id then
			self:_build_free_sync_ids_array()

			return self:generate_sync_id()
		else
			self._next_sync_id = sync_id + 1
		end
	end

	return sync_id
end

BuffExtension.claim_buff_id = function (self)
	local id = self.id
	self.id = id + 1

	return id
end

BuffExtension.sync_id_to_id = function (self, server_sync_id)
	return self._server_sync_to_id[server_sync_id]
end

BuffExtension.id_to_sync_id = function (self, id)
	return self._id_to_server_sync[id]
end

BuffExtension.buff_sync_type = function (self, id)
	return self._buff_to_sync_type[id]
end

BuffExtension._free_sync_id = function (self, id)
	local buff_to_sync_type = self._buff_to_sync_type

	if not buff_to_sync_type or not buff_to_sync_type[id] then
		return
	end

	local local_sync_id = self._id_to_local_sync[id]

	if local_sync_id then
		self._local_sync_to_id[local_sync_id] = nil
		local free_sync_ids = self._free_sync_ids

		if free_sync_ids then
			free_sync_ids[#free_sync_ids + 1] = local_sync_id
		end
	end

	local server_sync_id = self._id_to_server_sync[id]

	if server_sync_id then
		self._server_sync_to_id[server_sync_id] = nil
	end

	self._id_to_local_sync[id] = nil
	self._id_to_server_sync[id] = nil
	self._buff_to_sync_type[id] = nil
	self._synced_buff_owner[id] = nil
end

BuffExtension._build_free_sync_ids_array = function (self)
	local num_sync_ids = NetworkConstants.server_controlled_buff_id.max
	self._free_sync_ids = Script.new_array(num_sync_ids)
	local sync_ids_in_use = self._local_sync_to_id
	local free_id = 1

	for sync_id = 1, num_sync_ids do
		if not sync_ids_in_use[sync_id] then
			self._free_sync_ids[free_id] = sync_id
			free_id = free_id + 1
		end
	end
end

BuffExtension._initalize_sync_tables = function (self)
	if not self._id_to_local_sync then
		self._id_to_local_sync = {}
		self._local_sync_to_id = {}
		self._synced_buff_owner = {}
		self._buff_to_sync_type = {}
		self._id_to_server_sync = {}
		self._server_sync_to_id = {}
	end
end

local Managers = Managers

BuffExtension._remove_buff_synced = function (self, id)
	local id_to_server_sync = self._id_to_server_sync

	if not id_to_server_sync then
		return
	end

	local server_sync_id = id_to_server_sync[id]

	if not server_sync_id then
		return
	end

	local network_manager = Managers.state.network
	local unit_id = network_manager:unit_game_object_id(self._unit)

	if not unit_id then
		return
	end

	local network_transmit = network_manager.network_transmit

	if self.is_server then
		local sync_type = self._buff_to_sync_type[id]

		if sync_type == BuffSyncType.All then
			network_transmit:send_rpc_clients("rpc_remove_buff_synced", unit_id, server_sync_id)
		else
			local owner_peer_id = self._synced_buff_owner[id]

			if PEER_ID_TO_CHANNEL[owner_peer_id] then
				network_transmit:send_rpc("rpc_remove_buff_synced", owner_peer_id, unit_id, server_sync_id)
			end
		end
	else
		network_transmit:send_rpc_server("rpc_remove_buff_synced", unit_id, server_sync_id)
	end
end
