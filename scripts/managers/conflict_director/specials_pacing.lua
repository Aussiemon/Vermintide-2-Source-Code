SpecialsPacing = class(SpecialsPacing)
local ai_utils_unit_alive = AiUtils.unit_alive

SpecialsPacing.init = function (self, nav_world, specials_side)
	self.nav_world = nav_world
	self._specials_timer = 0
	self._disabled = false
	self._specials_spawn_queue = {}
	self._specials_slots = {}
	self._state_data = {}
	self._side = specials_side
	self.method_name = CurrentSpecialsSettings.spawn_method

	self:remove_unwanted_breeds()
end

SpecialsPacing.remove_unwanted_breeds = function (self)
	print("SpecialsPacing:remove_unwanted_breeds:")

	for name, special_setting in pairs(SpecialsSettings) do
		local breeds = special_setting.breeds

		if breeds then
			for i = #breeds, 1, -1 do
				local breed_name = breeds[i]
				local breed = Breeds[breed_name]

				if breed.disabled then
					print("remove_unwanted_breeds", breed_name)
					table.remove(breeds, i)
				end
			end
		end

		local rush_breeds = special_setting.rush_intervention and special_setting.rush_intervention.breeds

		if rush_breeds then
			for i = #rush_breeds, 1, -1 do
				local breed_name = rush_breeds[i]
				local breed = Breeds[breed_name]

				if breed.disabled then
					print("remove_unwanted_breeds", breed_name)
					table.remove(rush_breeds, i)
				end
			end
		end
	end
end

SpecialsPacing.start = function (self)
	if self.method_name then
		self.method_data = CurrentSpecialsSettings.methods[self.method_name]

		assert(self.method_data, "Missing 'spawn_method' in SpecialsSettings")

		if SpecialsPacing.setup_functions[self.method_name] then
			local t = Managers.time:time("game")

			SpecialsPacing.setup_functions[self.method_name](t, self._specials_slots, self.method_data, self._state_data)
		end
	end
end

local mutator_bosses_spawn = {
	"chaos_spawn",
	"skaven_rat_ogre",
	"skaven_stormfiend",
	"chaos_troll"
}
SpecialsPacing.setup_functions = {
	specials_by_slots = function (t, slots, method_data, state_data)
		local specials_settings = CurrentSpecialsSettings

		if #specials_settings.breeds == 0 then
			return
		end

		local override_time = nil
		local trickle_time = 2

		if method_data.always_coordinated then
			override_time = t + ConflictUtils.random_interval(method_data.after_safe_zone_delay)
			state_data.coordinated_timer = override_time

			if method_data.same_breeds then
				local breeds = specials_settings.breeds
				local pick_index = Math.random(1, #breeds)
				local breed_name = breeds[pick_index]
				state_data.override_breed_name = breed_name
			end
		end

		state_data.coord_time_check = t

		for i = 1, specials_settings.max_specials, 1 do
			local breed_name, health_modifier = SpecialsPacing.select_breed_functions[method_data.select_next_breed](slots, specials_settings, method_data, state_data)
			local time = override_time or t + ConflictUtils.random_interval(method_data.after_safe_zone_delay)
			local breed = Breeds[breed_name]
			local special_spawn_stinger, special_spawn_stinger_at_t = nil

			if breed.special_spawn_stinger then
				special_spawn_stinger = breed.special_spawn_stinger
				special_spawn_stinger_at_t = time - (breed.special_spawn_stinger_time or 6)
			end

			slots[i] = {
				state = "waiting",
				breed = breed_name,
				time = time,
				health_modifier = health_modifier,
				special_spawn_stinger = special_spawn_stinger,
				special_spawn_stinger_at_t = special_spawn_stinger_at_t
			}
		end
	end
}
SpecialsPacing.select_breed_functions = {
	get_least_used_breeds = function (slots, specials_settings, method_data, state_data)
		local count = FrameTable.alloc_table()

		if #slots == 0 then
			return
		end

		for i = 1, #slots, 1 do
			local slot = slots[i]
			count[slot.breed] = (count[slot.breed] or 0) + 1
		end

		local least_used = FrameTable.alloc_table()
		local smallest = math.huge

		for breed, amount in pairs(count) do
			local num = count[breed]

			if num < smallest then
				smallest = num

				table.clear(least_used)
			end

			if num <= smallest then
				least_used[#least_used + 1] = breed
			end
		end

		return least_used
	end,
	get_random_breed = function (slots, specials_settings, method_data, state_data)
		if state_data.override_breed_name then
			return state_data.override_breed_name
		end

		local breeds = specials_settings.breeds
		local count = FrameTable.alloc_table()

		for i = 1, #slots, 1 do
			local slot = slots[i]
			count[slot.breed] = (count[slot.breed] or 0) + 1
		end

		local max_tries = 20
		local breed = nil
		local i = 0

		repeat
			local pick_index = Math.random(1, #breeds)
			breed = breeds[pick_index]
			i = i + 1
		until not count[breed] or count[breed] < method_data.max_of_same or max_tries <= i

		return breed
	end,
	get_same_breed = function (slots, specials_settings, method_data, state_data, do_coordinated)
		if state_data.override_breed_name then
			return state_data.override_breed_name
		end

		local breeds = specials_settings.breeds
		local batch_amount = state_data.batch_amount or 0
		local t = Managers.time:time("game")

		if not state_data.batch_breed or (do_coordinated and state_data.coord_time_check < t) or specials_settings.max_specials < batch_amount then
			state_data.batch_amount = 0
			local pick_index = Math.random(1, #breeds)
			local breed = breeds[pick_index]
			state_data.batch_breed = breed

			if do_coordinated then
				state_data.coord_time_check = t + 15
			end
		end

		state_data.batch_amount = state_data.batch_amount + 1

		return state_data.batch_breed
	end,
	get_chance_of_boss_breed = function (slots, specials_settings, method_data, state_data)
		local breeds = specials_settings.breeds
		local will_spawn_boss = Math.random() <= 0.25
		local breed = nil

		if will_spawn_boss then
			breed = mutator_bosses_spawn[math.random(1, #mutator_bosses_spawn)]
			local health_modifier = 0.25

			return breed, health_modifier
		else
			local count = FrameTable.alloc_table()

			for i = 1, #slots, 1 do
				local slot = slots[i]
				count[slot.breed] = (count[slot.breed] or 0) + 1
			end

			local max_tries = 20
			local i = 0

			repeat
				local pick_index = Math.random(1, #breeds)
				breed = state_data.override_breed_name or breeds[pick_index]
				i = i + 1
			until not count[breed] or count[breed] < method_data.max_of_same or max_tries <= i
		end

		return breed
	end
}

SpecialsPacing.set_next_coordinated_attack = function (self, t, specials_settings, method_data, slots, spawn_queue)
	local state_data = self._state_data
	local same_breeds, trickle_time = nil

	if method_data.same_breeds then
		local breeds = specials_settings.breeds
		local pick_index = Math.random(1, #breeds)
		local breed_name = breeds[pick_index]
		state_data.override_breed_name = breed_name
		trickle_time = method_data.coordinated_trickle_time
	end

	local time = t + ConflictUtils.random_interval(method_data.spawn_cooldown)

	for i = 1, #slots, 1 do
		local slot = slots[i]
		local breed_name, health_modifier = SpecialsPacing.select_breed_functions[method_data.select_next_breed](slots, specials_settings, method_data, state_data)
		local breed = Breeds[breed_name]
		local trickle_time = method_data.coordinated_trickle_time
		time = time + ((trickle_time and i * trickle_time) or 2)

		if breed.special_spawn_stinger then
			slot.special_spawn_stinger = breed.special_spawn_stinger
			slot.special_spawn_stinger_at_t = time - (breed.special_spawn_stinger_time or 6)
		else
			slot.special_spawn_stinger = nil
			slot.special_spawn_stinger_at_t = nil
		end

		slot.time = time
		slot.breed = breed_name
		slot.unit = nil
		slot.state = "waiting"
		slot.health_modifier = health_modifier
		slot.desc = "coordinated attack"
		spawn_queue[#spawn_queue + 1] = slot
	end

	state_data.coordinated_timer = time + 1
end

SpecialsPacing.specials_by_slots = function (self, t, specials_settings, method_data, slots, spawn_queue)
	local num_slots = #slots
	local waiting = 0
	local about_to_respawn = false

	if method_data.always_coordinated then
		local state_data = self._state_data

		if state_data.coordinated_timer < t then
			self:set_next_coordinated_attack(t, specials_settings, method_data, slots, spawn_queue)
		end

		self._specials_timer = t + 1

		return
	end

	for i = 1, num_slots, 1 do
		local slot = slots[i]

		if slot.state == "waiting" then
			if slot.time < t then
				slot.unit = nil
				spawn_queue[#spawn_queue + 1] = slot
				slot.state = (method_data.always_coordinated and "coordinating") or "wants_to_spawn"
				slot.time = nil
				slot.dest = ""
			else
				waiting = waiting + 1
			end

			if slot.special_spawn_stinger and slot.special_spawn_stinger_at_t < t then
				self:_play_stinger(slot.special_spawn_stinger, slot)

				slot.special_spawn_stinger = nil
				slot.special_spawn_stinger_at_t = nil
			end
		end

		if slot.state == "alive" and not ai_utils_unit_alive(slot.unit) then
			local breed_name, health_modifier = SpecialsPacing.select_breed_functions[method_data.select_next_breed](slots, specials_settings, method_data, self._state_data)
			local breed = Breeds[breed_name]
			local time = t + ConflictUtils.random_interval(method_data.spawn_cooldown)

			if breed.special_spawn_stinger then
				slot.special_spawn_stinger = breed.special_spawn_stinger
				slot.special_spawn_stinger_at_t = time - (breed.special_spawn_stinger_time or 6)
			else
				slot.special_spawn_stinger = nil
				slot.special_spawn_stinger_at_t = nil
			end

			slot.time = time
			slot.breed = breed_name
			slot.unit = nil
			slot.state = "waiting"
			slot.desc = ""
			slot.health_modifier = health_modifier
			about_to_respawn = true
			waiting = waiting + 1
		end
	end

	if about_to_respawn and waiting == num_slots then
		local do_coordinated = Math.random() <= method_data.chance_of_coordinated_attack

		if do_coordinated then
			print("Coordinated attack!")

			local coordinated_time = t + 40
			local average_slot_time = 0
			local coordinated_attack_cooldown_multiplier = method_data.coordinated_attack_cooldown_multiplier or 0.5

			for i = 1, num_slots, 1 do
				local slot = slots[i]
				local slot_time = slot.time
				average_slot_time = average_slot_time + slot_time
			end

			if average_slot_time > 0 then
				average_slot_time = average_slot_time / num_slots
				coordinated_time = t + (average_slot_time - t) * coordinated_attack_cooldown_multiplier
			end

			local state_data = self._state_data

			for i = 1, num_slots, 1 do
				local slot = slots[i]
				local breed_name, health_modifier = SpecialsPacing.select_breed_functions[method_data.select_next_breed](slots, specials_settings, method_data, state_data, do_coordinated)
				local breed = Breeds[breed_name]
				local time = coordinated_time + ((method_data.coordinated_trickle_time and i * method_data.coordinated_trickle_time) or i * 2)

				if breed.special_spawn_stinger then
					slot.special_spawn_stinger = breed.special_spawn_stinger
					slot.special_spawn_stinger_at_t = time - (breed.special_spawn_stinger_time or 6)
				else
					slot.special_spawn_stinger = nil
					slot.special_spawn_stinger_at_t = nil
				end

				slot.time = time
				slot.breed = breed_name
				slot.unit = nil
				slot.state = "waiting"
				slot.health_modifier = health_modifier
				about_to_respawn = true
				slot.desc = "coordinated attack"
			end
		end
	end

	self._specials_timer = t + 1
end

SpecialsPacing.specials_by_time_window = function (self, t, specials_settings, method_data, slots, spawn_queue, alive_specials)
	if self._specials_timer < t then
		local num_alive = #alive_specials
		local i = 1

		while num_alive >= i do
			local unit = alive_specials[i]

			if not ALIVE[unit] then
				alive_specials[i] = alive_specials[num_alive]
				alive_specials[num_alive] = nil
				num_alive = num_alive - 1
			else
				i = i + 1
			end
		end

		local max_specials = specials_settings.max_specials

		if num_alive + #slots <= 0 then
			local lull_time = ConflictUtils.random_interval(method_data.lull_time)
			local breeds = specials_settings.breeds

			if method_data.even_out_breeds and max_specials > 1 then
				local breed_mix = table.clone(breeds)
				local j = 0

				for i = 1, max_specials, 1 do
					if j <= 0 then
						table.shuffle(breed_mix)

						j = #breed_mix
					end

					slots[i] = {
						breed = breed_mix[j]
					}
					j = j - 1
				end
			else
				for i = 1, max_specials, 1 do
					slots[i].breed = breeds[Math.random(1, #breeds)]
				end
			end

			local spawn_interval = ConflictUtils.random_interval(method_data.spawn_interval)
			local sum = 0
			local time_list = {}

			for i = 1, max_specials, 1 do
				local time = Math.random()
				sum = sum + time
				time_list[i] = sum
			end

			local last_time = nil

			for i = 1, max_specials, 1 do
				local index = max_specials - i + 1
				last_time = t + time_list[index] / sum * spawn_interval + lull_time
				slots[i].time = last_time
			end

			self._specials_timer = t + lull_time

			table.clear(spawn_queue)
		end

		local slot = slots[#slots]

		if slot and slot.time < t then
			slots[#slots] = nil
			spawn_queue[#spawn_queue + 1] = slot
		end

		self._specials_timer = t + 1
	end
end

SpecialsPacing.enable = function (self, state)
	self._disabled = not state
end

SpecialsPacing.is_disabled = function (self)
	return self._disabled
end

local function cb_special_spawned(unit, breed, optional_data)
	local slot = optional_data.slot
	local alive_specials = optional_data.alive_specials
	slot.unit = unit
	slot.state = "alive"

	if breed.special then
		alive_specials[#alive_specials + 1] = unit
	end
end

SpecialsPacing.update = function (self, t, alive_specials, specials_population, player_positions)
	local specials_settings = CurrentSpecialsSettings

	if specials_settings.disabled then
		return
	end

	if self._disabled then
		return
	end

	if specials_population < 1 then
		return
	end

	local specials_spawn_queue = self._specials_spawn_queue

	if self._specials_timer < t then
		if Managers.state.conflict.delay_specials then
			self._specials_timer = t + 3
		else
			local method_data = specials_settings.methods[specials_settings.spawn_method]

			SpecialsPacing[self.method_name](self, t, specials_settings, method_data, self._specials_slots, specials_spawn_queue, alive_specials)
		end

		if #specials_spawn_queue > 0 then
			local slot = specials_spawn_queue[#specials_spawn_queue]
			local breed = Breeds[slot.breed]
			local spawn_pos = self:get_special_spawn_pos(breed.spawning_rule)

			if spawn_pos then
				Managers.state.conflict:spawn_queued_unit(breed, Vector3Box(spawn_pos), QuaternionBox(Vector3.up(), 0), "specials_pacing", nil, nil, {
					spawned_func = cb_special_spawned,
					alive_specials = alive_specials,
					slot = slot,
					parent = self,
					max_health_modifier = slot.health_modifier
				})

				slot.state = "wants_to_spawn"
				slot.spawn_type = nil
				specials_spawn_queue[#specials_spawn_queue] = nil
				self._specials_timer = t + 0.5
				slot.health_modifier = nil

				if slot.special_spawn_stinger and not slot.has_played_special_stinger then
					self:_play_stinger(slot.special_spawn_stinger, slot)

					slot.has_played_special_stinger = nil
				end

				slot.special_spawn_stinger = nil
				slot.special_spawn_stinger_at_t = nil
			else
				self._specials_timer = t + 1
			end
		end
	end
end

SpecialsPacing._play_stinger = function (self, stinger_name, slot)
	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_2d_audio_event(stinger_name)

	slot.has_played_special_stinger = true
end

SpecialsPacing.delay_spawning = function (self, t, delay, per_unit_delay, ignore_coordinated_attack)
	local slots = self._specials_slots
	local specials_settings = CurrentSpecialsSettings

	if specials_settings.disabled then
		return
	end

	local method_data = specials_settings.methods[specials_settings.spawn_method]
	local do_coordinated = not ignore_coordinated_attack and Math.random() <= method_data.chance_of_coordinated_attack

	for i = 1, #slots, 1 do
		local slot = slots[i]
		local breed_name, health_modifier = SpecialsPacing.select_breed_functions[method_data.select_next_breed](slots, specials_settings, method_data, self._state_data)
		local breed = Breeds[breed_name]
		local time, desc = nil

		if do_coordinated then
			local coordinated_cooldown_multiplier = method_data.coordinated_attack_cooldown_multiplier or 0.5
			local coordinated_time = delay * coordinated_cooldown_multiplier
			time = t + coordinated_cooldown_multiplier + per_unit_delay * i * coordinated_cooldown_multiplier
			desc = "coordinated attack"
		else
			time = t + delay + per_unit_delay * i
			desc = ""
		end

		slot.breed = breed_name
		slot.time = time
		slot.unit = nil
		slot.state = "waiting"
		slot.desc = desc
		slot.health_modifier = health_modifier

		if breed.special_spawn_stinger then
			slot.special_spawn_stinger = breed.special_spawn_stinger
			slot.special_spawn_stinger_at_t = slot.time - (breed.special_spawn_stinger_time or 6)
		else
			slot.special_spawn_stinger = nil
			slot.special_spawn_stinger_at_t = nil
		end
	end

	local specials_spawn_queue = self._specials_spawn_queue

	for i = 1, #specials_spawn_queue, 1 do
		specials_spawn_queue[i] = nil
	end
end

SpecialsPacing.debug_spawn = function (self)
	local breeds = CurrentSpecialsSettings.breeds
	local breed_name = breeds[math.random(#breeds)]
	local breed = Breeds[breed_name]
	local spawn_pos = self:get_special_spawn_pos(breed.spawning_rule)

	if spawn_pos then
		QuickDrawerStay:sphere(spawn_pos, 4, Color(125, 255, 47))
		print("debug spawning special: ", breed_name)
		Managers.state.conflict:spawn_queued_unit(breed, Vector3Box(spawn_pos), QuaternionBox(Quaternion(Vector3.up(), 0)), "specials_pacing")
	else
		print("debug spawning special could not find spawn position")
	end
end

SpecialsPacing.get_special_spawn_pos = function (self, spawning_rule)
	local conflict_director = Managers.state.conflict
	local main_path_info = conflict_director.main_path_info
	local main_path_player_info = conflict_director.main_path_player_info
	local main_paths = conflict_director.level_analysis:get_main_paths()
	local _, _, loneliness_value, loneliest_player_unit = conflict_director:get_cluster_and_loneliness(10)
	local ahead_unit = main_path_info.ahead_unit
	local behind_unit = main_path_info.behind_unit
	local epicenter = nil
	local random_pick = false
	local debug_string = nil

	if not ahead_unit or not behind_unit then
		epicenter = POSITION_LOOKUP[loneliest_player_unit]
		debug_string = "specialspawn: loneliest -->"
	elseif spawning_rule == "always_ahead" then
		epicenter = self:get_relative_main_path_pos(main_paths, main_path_player_info[ahead_unit], 20)
		debug_string = "specialspawn: rule: only_ahead -->"
	elseif loneliness_value > 10 then
		if ahead_unit == loneliest_player_unit then
			epicenter = self:get_relative_main_path_pos(main_paths, main_path_player_info[ahead_unit], 20)
			debug_string = "specialspawn: ahead == lonliest -->"
		elseif behind_unit == loneliest_player_unit then
			epicenter = POSITION_LOOKUP[behind_unit]
			debug_string = "specialspawn: behind == lonliest -->"
		else
			debug_string = "specialspawn: random-pick -->"
			random_pick = true
		end
	else
		random_pick = true
	end

	if random_pick then
		local infront = Math.random() < 0.75

		if infront then
			epicenter = self:get_relative_main_path_pos(main_paths, main_path_player_info[ahead_unit], 10)
			debug_string = "specialspawn: random infront"
		else
			epicenter = POSITION_LOOKUP[behind_unit]
			debug_string = "specialspawn: random behind"
		end
	end

	if not epicenter then
		local enemy_positions = self._side.ENEMY_PLAYER_POSITIONS
		epicenter = enemy_positions[math.random(#enemy_positions)]
		debug_string = "specialspawn: fallback - epicenter around random player"
	end

	local world = conflict_director._world
	local avoid_positions = self._side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local pos = nil

	if epicenter then
		pos = ConflictUtils.get_hidden_pos(world, self.nav_world, epicenter, avoid_positions, 30, 10, 225, 10)

		if not pos then
			local spawner = ConflictUtils.get_random_hidden_spawner(epicenter, 40)

			if spawner then
				pos = Unit.local_position(spawner, 0)
			else
				pos = ConflictUtils.get_hidden_pos(world, self.nav_world, epicenter, avoid_positions, 16, 5, 225, 3)
			end
		end
	end

	if not pos then
		print(debug_string)
		print("FAIL: Special spawn no hidden pos found :/ ")

		return
	end

	return pos
end

local function find_suitable_intervention_spawn_position(world, nav_world, center_pos, avoid_dist_sqr, party)
	local avoid_positions = party.ENEMY_PLAYER_AND_BOT_POSITIONS
	local spawn_pos = ConflictUtils.get_hidden_pos(world, nav_world, center_pos, avoid_positions, 30, 10, avoid_dist_sqr, 15)

	if not spawn_pos then
		print("Intervention Spawn: Failed to find spawn pos, trying hidden spawner")

		local spawner = ConflictUtils.get_random_hidden_spawner(center_pos, 40)

		if spawner then
			spawn_pos = Unit.local_position(spawner, 0)
		else
			print("Intervention Spawn: Failed to find hidden spawner, trying random pos")

			spawn_pos = ConflictUtils.get_spawn_pos_on_circle(nav_world, center_pos, 30, 10, 20)
		end

		if not spawn_pos then
			print("Intervention Spawn: Failed to find spawn pos")

			return false, "Failed to find special spawn pos"
		end
	end

	return spawn_pos
end

local function get_best_specials_slot(slots)
	local best_slot = nil
	local best_time = 0
	local num_slots = #slots

	for i = 1, num_slots, 1 do
		local slot = slots[i]

		if slot.state == "waiting" and best_time < slot.time then
			best_slot = i
			best_time = slot.time
		end
	end

	return best_slot
end

local function cb_rush_intervention_unit_spawned(unit, breed, optional_data)
	local slot = optional_data.slot
	slot.breed = breed.name
	slot.unit = unit
	slot.time = nil
	slot.state = "alive"
	slot.desc = "rush intervention"
	local alive_specials = optional_data.alive_specials
	alive_specials[#alive_specials + 1] = unit

	print("rush intervention - spawning ", breed.name)
end

SpecialsPacing.request_rushing_intervention = function (self, t, player_unit, main_path_info, main_path_player_info, disable_rush_intervention)
	if script_data.ai_specials_spawning_disabled then
		return false, "specials spawning disabled"
	end

	if disable_rush_intervention and disable_rush_intervention.specials then
		return false, "no intervention, since game mode disabled it"
	end

	local status_extension = ScriptUnit.extension(player_unit, "status_system")

	if status_extension:is_disabled() then
		return false, "no intervention, since ahead unit is disabled"
	end

	local specials_settings = CurrentSpecialsSettings
	local breeds = specials_settings.rush_intervention.breeds

	if #breeds <= 0 then
		print("No rush intervention breeds available. Cannot intervent rushing player by spawning a special (SpecialsSettings.specials.rush_intervention.breeds)")

		return false, "No rush intervention breeds set"
	end

	fassert(main_path_info.ahead_unit, "Missing ahead unit in request_rushing_intervention")

	local slots = self._specials_slots
	local best_slot = get_best_specials_slot(slots)

	if best_slot then
		local slot = slots[best_slot]
		local pick_index = Math.random(1, #breeds)
		local breed_name = breeds[pick_index]
		local breed = Breeds[breed_name]
		local conflict_director = Managers.state.conflict
		local main_paths = conflict_director.level_analysis:get_main_paths()
		local world = conflict_director._world
		local nav_world = self.nav_world
		local avoid_dist_sqr = 25
		local player_pos = POSITION_LOOKUP[main_path_info.ahead_unit]
		local epicenter = self:get_relative_main_path_pos(main_paths, main_path_player_info[main_path_info.ahead_unit], 20)
		local forward_path_dir = epicenter - player_pos
		local spawn_pos, description = find_suitable_intervention_spawn_position(world, nav_world, epicenter, avoid_dist_sqr, self._side)

		if not spawn_pos then
			return false, description
		end

		local conflict_director = Managers.state.conflict
		local alive_specials = conflict_director:alive_specials()
		local optional_data = {
			spawned_func = cb_rush_intervention_unit_spawned,
			slot = slot,
			alive_specials = alive_specials
		}
		slot.state = "wants_to_spawn"

		if breed.special_spawn_stinger then
			self:_play_stinger(breed.special_spawn_stinger, slot)
		end

		Managers.state.conflict:spawn_queued_unit(breed, Vector3Box(spawn_pos), QuaternionBox(Quaternion(Vector3.up(), 0)), "rush_intervention", nil, nil, optional_data)

		return true, "rush special"
	end
end

local function cb_speed_running_intervention_unit_spawned(unit, breed, optional_data)
	local slot = optional_data.slot
	slot.breed = breed.name
	slot.unit = unit
	slot.time = nil
	slot.state = "alive"
	slot.desc = "speed running intervention"
	local alive_specials = optional_data.alive_specials
	alive_specials[#alive_specials + 1] = unit

	print("Speed run intervention - spawning ", breed.name)
end

SpecialsPacing.request_speed_running_intervention = function (self, t, player_unit, main_path_player_info)
	if script_data.ai_specials_spawning_disabled then
		return false, "specials spawning disabled"
	end

	local status_extension = ScriptUnit.extension(player_unit, "status_system")

	if status_extension:is_disabled() then
		return false, "no speed running intervention, since speed runner is disabled"
	end

	local specials_settings = CurrentSpecialsSettings
	local speed_running_intervention_settings = CurrentSpecialsSettings.speed_running_intervention or SpecialsSettings.default.speed_running_intervention
	local breeds = speed_running_intervention_settings.breeds
	local slots = self._specials_slots
	local best_slot = get_best_specials_slot(slots) or 1

	if best_slot then
		local slot = slots[best_slot]
		local pick_index = Math.random(1, #breeds)
		local breed_name = breeds[pick_index]
		local breed = Breeds[breed_name]
		local conflict_director = Managers.state.conflict
		local main_paths = conflict_director.level_analysis:get_main_paths()
		local world = conflict_director._world
		local nav_world = self.nav_world
		local avoid_dist_sqr = 25
		local player_pos = POSITION_LOOKUP[player_unit]
		local epicenter = self:get_relative_main_path_pos(main_paths, main_path_player_info[player_unit], 20)
		local spawn_pos, description = find_suitable_intervention_spawn_position(world, nav_world, epicenter, avoid_dist_sqr, self._side)

		if not spawn_pos then
			return false, description
		end

		local conflict_director = Managers.state.conflict
		local alive_specials = conflict_director:alive_specials()
		local optional_data = {
			spawned_func = cb_speed_running_intervention_unit_spawned,
			slot = slot,
			alive_specials = alive_specials
		}
		slot.state = "wants_to_spawn"

		if breed.special_spawn_stinger then
			self:_play_stinger(breed.special_spawn_stinger, slot)
		end

		Managers.state.conflict:spawn_queued_unit(breed, Vector3Box(spawn_pos), QuaternionBox(Quaternion(Vector3.up(), 0)), "speed_run_intervention", nil, nil, optional_data)

		return true, breed_name
	end

	return false, "no slots available"
end

SpecialsPacing.get_relative_main_path_pos = function (self, main_paths, player_info, extra_distance)
	local path_pos, path_index = MainPathUtils.point_on_mainpath(main_paths, player_info.travel_dist + extra_distance)
	local epicenter, failed = nil

	if path_pos and path_index == player_info.path_index then
		epicenter = path_pos
	else
		epicenter = POSITION_LOOKUP[player_info.unit]
		failed = true
	end

	return epicenter, failed
end

SpecialsPacing.debug = function (self, t, alive_specials, specials_population, slots)
	if script_data.debug_ai_pacing then
		local s = ""

		for i = 1, #slots, 1 do
			local slot = slots[i]

			if slot.time then
				local time_left = slot.time - t

				if time_left > 0.5 then
					if slot.special_spawn_stinger then
						Debug.text(string.format(" [%d] %s: SPAWNS IN %0.1f, STINGER IN %0.1f ", i, slot.breed, time_left, math.max(slot.special_spawn_stinger_at_t - t, 0)))
					elseif slot.health_modifier then
						Debug.text(string.format(" [%d] %s: SPAWNS IN %0.1f, HEALTH MODIFIER ", i, slot.breed, time_left))
					else
						Debug.text(string.format(" [%d] %s: SPAWNS IN %0.1f, ", i, slot.breed, time_left))
					end
				else
					Debug.text(string.format(" [%d] %s: SPAWNING NOW, ", i, slot.breed))
				end
			elseif slot.state == "coordinating" and slot.health_modifier then
				Debug.text(string.format(" [%d] %s: COODINATED SPAWN, HEALTH MODIFIER %s", i, slot.breed))
			elseif slot.state == "coordinating" then
				Debug.text(string.format(" [%d] %s: COORDINATING, %s", i, slot.breed, tostring(slot.desc)))
			else
				Debug.text(string.format(" [%d] %s: ALIVE, %s", i, slot.breed, tostring(slot.desc)))
			end
		end

		Debug.text("Specials: " .. s)
	end
end

return
