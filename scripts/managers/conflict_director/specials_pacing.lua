SpecialsPacing = class(SpecialsPacing)
local ai_utils_unit_alive = AiUtils.unit_alive
local player_and_bot_positions = PLAYER_AND_BOT_POSITIONS
SpecialsPacing.init = function (self, nav_world)
	self.nav_world = nav_world
	self._specials_timer = 0
	self._disabled = false
	self._specials_spawn_queue = {}
	self._specials_slots = {}
	self.method_name = CurrentSpecialsSettings.spawn_method

	self.remove_unwanted_breeds(self)

	return 
end
SpecialsPacing.remove_unwanted_breeds = function (self)
	for name, special_setting in pairs(SpecialsSettings) do
		local breeds = special_setting.breeds

		if breeds then
			for i = #breeds, 1, -1 do
				local breed_name = breeds[i]
				local breed = Breeds[breed_name]

				if breed.disabled then
					print("removing breed", breed_name)
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
					print("removing breed", breed_name)
					table.remove(rush_breeds, i)
				end
			end
		end

		local outside_navmesh_intervention_breeds = special_setting.outside_navmesh_intervention and special_setting.outside_navmesh_intervention.breeds

		if outside_navmesh_intervention_breeds then
			for i = #outside_navmesh_intervention_breeds, 1, -1 do
				local breed_name = outside_navmesh_intervention_breeds[i]
				local breed = Breeds[breed_name]

				if breed.disabled then
					print("removing breed", breed_name)
					table.remove(outside_navmesh_intervention_breeds, i)
				end
			end
		end
	end

	return 
end
SpecialsPacing.start = function (self)
	if self.method_name then
		self.method_data = CurrentSpecialsSettings.methods[self.method_name]

		assert(self.method_data, "Missing 'spawn_method' in SpecialsSettings")

		if SpecialsPacing.setup_functions[self.method_name] then
			local t = Managers.time:time("game")

			SpecialsPacing.setup_functions[self.method_name](t, self._specials_slots, self.method_data)
		end
	end

	return 
end
SpecialsPacing.setup_functions = {
	specials_by_slots = function (t, slots, method_data)
		local specials_settings = CurrentSpecialsSettings

		if #specials_settings.breeds == 0 then
			return 
		end

		for i = 1, specials_settings.max_specials, 1 do
			local breed_name = SpecialsPacing.select_breed_functions[method_data.select_next_breed](slots, specials_settings.breeds, method_data)
			local time = t + ConflictUtils.random_interval(method_data.after_safe_zone_delay)
			slots[i] = {
				state = "waiting",
				breed = breed_name,
				time = time
			}
		end

		return 
	end
}
SpecialsPacing.select_breed_functions = {
	get_least_used_breeds = function (slots, breeds, method_data)
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
	get_random_breed = function (slots, breeds, method_data)
		local count = FrameTable.alloc_table()

		for i = 1, #slots, 1 do
			local slot = slots[i]
			count[slot.breed] = (count[slot.breed] or 0) + 1
		end

		local max_tries = 30
		local breed = nil
		local i = 0
		local reached_max_tries = false
		local has_max_of_same = false
		local is_counted_for = false

		repeat
			local pick_index = Math.random(1, #breeds)
			breed = breeds[pick_index]
			i = i + 1
		until not count[breed] or count[breed] < method_data.max_of_same or max_tries <= i

		return breed
	end
}
SpecialsPacing.specials_by_slots = function (self, t, specials_settings, method_data, slots, spawn_queue)
	local num_slots = #slots
	local waiting = 0
	local about_to_respawn = false

	for i = 1, num_slots, 1 do
		local slot = slots[i]

		if slot.state == "waiting" then
			if slot.time < t then
				slot.unit = nil
				spawn_queue[#spawn_queue + 1] = slot
				slot.state = "wants_to_spawn"
				slot.time = nil
				slot.dest = ""
			else
				waiting = waiting + 1
			end
		end

		if slot.state == "alive" and not ai_utils_unit_alive(slot.unit) then
			local breed_name = SpecialsPacing.select_breed_functions[method_data.select_next_breed](slots, specials_settings.breeds, method_data)
			slot.time = t + ConflictUtils.random_interval(method_data.spawn_cooldown)
			slot.breed = breed_name
			slot.unit = nil
			slot.state = "waiting"
			slot.desc = ""
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

			if 0 < average_slot_time then
				average_slot_time = average_slot_time / num_slots
				coordinated_time = t + (average_slot_time - t) * coordinated_attack_cooldown_multiplier
			end

			for i = 1, num_slots, 1 do
				local slot = slots[i]
				local breed_name = SpecialsPacing.select_breed_functions[method_data.select_next_breed](slots, specials_settings.breeds, method_data)
				slot.time = coordinated_time + i
				slot.breed = breed_name
				slot.unit = nil
				slot.state = "waiting"
				about_to_respawn = true
				slot.desc = "coordinated attack"
			end
		end
	end

	self._specials_timer = t + 1

	return 
end
SpecialsPacing.specials_by_time_window = function (self, t, specials_settings, method_data, slots, spawn_queue, alive_specials)
	if self._specials_timer < t then
		local num_alive = #alive_specials
		local i = 1

		while i <= num_alive do
			local unit = alive_specials[i]

			if not Unit.alive(unit) then
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

			if method_data.even_out_breeds and 1 < max_specials then
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

	return 
end
SpecialsPacing.enable = function (self, state)
	self._disabled = not state

	return 
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
	end

	if 0 < #specials_spawn_queue then
		local slot = specials_spawn_queue[#specials_spawn_queue]
		local breed = Breeds[slot.breed]
		local spawn_pos = self.get_special_spawn_pos(self, breed.spawning_rule)

		if spawn_pos then
			local new_special = Managers.state.conflict:spawn_unit(breed, spawn_pos, Quaternion(Vector3.up(), 0), "specials_pacing")
			slot.unit = new_special
			slot.state = "alive"
			alive_specials[#alive_specials + 1] = new_special
			specials_spawn_queue[#specials_spawn_queue] = nil
			self._specials_timer = t + 0.5
		end
	end

	return 
end
SpecialsPacing.lord_reset_spawning = function (self, t, delay)
	self._specials_timer = t + delay
	local slots = self._specials_slots

	for i = 1, #slots, 1 do
		local slot = slots[i]
		slot.time = t + delay
		slot.state = "waiting"
	end

	local specials_spawn_queue = self._specials_spawn_queue

	for i = 1, #specials_spawn_queue, 1 do
		specials_spawn_queue[i] = nil
	end

	return 
end
SpecialsPacing.debug_spawn = function (self)
	local breeds = CurrentSpecialsSettings.breeds
	local breed_name = breeds[math.random(#breeds)]
	local breed = Breeds[breed_name]
	local spawn_pos = self.get_special_spawn_pos(self, breed.spawning_rule)

	if spawn_pos then
		QuickDrawerStay:sphere(spawn_pos, 4, Color(125, 255, 47))
		print("debug spawning special: ", breed_name)
		Managers.state.conflict:spawn_unit(breed, spawn_pos, Quaternion(Vector3.up(), 0), "specials_pacing")
	else
		print("debug spawning special could not find spawn position")
	end

	return 
end
SpecialsPacing.get_special_spawn_pos = function (self, spawning_rule)
	local conflict_director = Managers.state.conflict
	local main_path_info = conflict_director.main_path_info
	local main_path_player_info = conflict_director.main_path_player_info
	local main_paths = conflict_director.level_analysis:get_main_paths()
	local _, _, loneliness_value, loneliest_player_unit = conflict_director.get_cluster_and_loneliness(conflict_director, 10)
	local ahead_unit = main_path_info.ahead_unit
	local behind_unit = main_path_info.behind_unit
	local epicenter = nil
	local random_pick = false
	local debug_string = nil

	if not ahead_unit or not behind_unit then
		epicenter = POSITION_LOOKUP[loneliest_player_unit]
		debug_string = "specialspawn: loneliest -->"
	elseif spawning_rule == "always_ahead" then
		epicenter = self.get_relative_main_path_pos(self, main_paths, main_path_player_info[ahead_unit], 20)
		debug_string = "specialspawn: rule: only_ahead -->"
	elseif 10 < loneliness_value then
		if ahead_unit == loneliest_player_unit then
			epicenter = self.get_relative_main_path_pos(self, main_paths, main_path_player_info[ahead_unit], 20)
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
			epicenter = self.get_relative_main_path_pos(self, main_paths, main_path_player_info[ahead_unit], 10)
			debug_string = "specialspawn: random infront"
		else
			epicenter = POSITION_LOOKUP[behind_unit]
			debug_string = "specialspawn: random behind"
		end
	end

	if not epicenter then
		epicenter = PLAYER_POSITIONS[math.random(#PLAYER_POSITIONS)]
		debug_string = "specialspawn: fallback - epicenter around random player"
	end

	local world = conflict_director._world
	local pos = ConflictUtils.get_hidden_pos(world, self.nav_world, epicenter, player_and_bot_positions, 30, 10, 225, 10)

	if not pos then
		local spawner = ConflictUtils.get_random_hidden_spawner(epicenter, 40)

		if spawner then
			pos = Unit.local_position(spawner, 0)
		else
			pos = ConflictUtils.get_hidden_pos(world, self.nav_world, epicenter, player_and_bot_positions, 16, 5, 225, 3)
		end
	end

	print(debug_string)

	if not pos then
		print("FAIL: Special spawn no hidden pos found :/ using main-path 40m ahead fall back")

		if ahead_unit then
			local fail = nil
			pos, fail = self.get_relative_main_path_pos(self, main_paths, main_path_player_info[ahead_unit], 40)

			if fail then
				pos = ConflictUtils.get_spawn_pos_on_circle(self.nav_world, epicenter, 30, 10, 20)

				if not pos then
					print("\t--> fail to find random spawn pos")

					return 
				end
			end
		end
	end

	return pos
end

local function find_suitable_intervention_spawn_position(world, nav_world, center_pos, avoid_dist_sqr)
	local spawn_pos = ConflictUtils.get_hidden_pos(world, nav_world, center_pos, player_and_bot_positions, 30, 10, avoid_dist_sqr, 15)

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

SpecialsPacing.request_rushing_intervention = function (self, t, player_unit, main_path_info, main_path_player_info)
	if script_data.ai_specials_spawning_disabled then
		return false, "specials spawning disabled"
	end

	local status_extension = ScriptUnit.extension(player_unit, "status_system")

	if status_extension.is_disabled(status_extension) then
		return false, "no intervention, since ahead unit is disabled"
	end

	local specials_settings = CurrentSpecialsSettings
	local breeds = specials_settings.rush_intervention.breeds

	if #breeds <= 0 then
		print("No rush intervention breeds available. Cannot intervent rushing player by spawning a special (SpecialsSettings.specials.rush_intervention.breeds)")

		return false, "No rush intervention breeds set"
	end

	assert(main_path_info.ahead_unit, "Missing ahead unit in request_rushing_intervention")

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
		local epicenter = self.get_relative_main_path_pos(self, main_paths, main_path_player_info[main_path_info.ahead_unit], 20)
		local forward_path_dir = epicenter - player_pos
		local spawn_pos, description = find_suitable_intervention_spawn_position(world, nav_world, epicenter, avoid_dist_sqr)

		if not spawn_pos then
			return false, description
		end

		print("rush intervention - spawning ", breed_name)

		local new_special = Managers.state.conflict:spawn_unit(breed, spawn_pos, Quaternion(Vector3.up(), 0), "rush_intervention")
		slot.breed = breed_name
		slot.unit = new_special
		slot.time = nil
		slot.state = "alive"
		slot.desc = "rush intervention"

		return true, breed_name
	end

	return 
end
SpecialsPacing.request_outside_navmesh_intervention = function (self, player_unit)
	if script_data.ai_specials_spawning_disabled then
		return false, "specials spawning disabled"
	end

	local specials_settings = CurrentSpecialsSettings
	local breeds = specials_settings.outside_navmesh_intervention.breeds
	local num_breeds = #breeds

	if num_breeds <= 0 then
		print("No outside navmesh intervention breeds available. Cannot intervent player outside navmesh by spawning a special (SpecialsSettings.specials.outside_navmesh_intervention.breeds)")

		return false, "No outside navmesh intervention breeds set"
	end

	local slots = self._specials_slots
	local best_slot = get_best_specials_slot(slots)

	if best_slot then
		local slot = slots[best_slot]
		local pick_index = Math.random(1, num_breeds)
		local breed_name = breeds[pick_index]
		local breed = Breeds[breed_name]
		local player_position = POSITION_LOOKUP[player_unit]
		local conflict_director = Managers.state.conflict
		local world = conflict_director._world
		local nav_world = self.nav_world
		local avoid_dist_sqr = 25
		local spawn_pos, description = find_suitable_intervention_spawn_position(world, nav_world, player_position, avoid_dist_sqr)

		if not spawn_pos then
			return false, description
		end

		print("Outside navmesh intervention - spawning ", breed_name)

		local rotation = Quaternion(Vector3.up(), 0)
		local new_special = conflict_director.spawn_unit(conflict_director, breed, spawn_pos, rotation, "outside_navmesh_intervention")
		local ai_extension = ScriptUnit.extension(new_special, "ai_system")
		local blackboard = ai_extension.blackboard(ai_extension)
		blackboard.target_unit = player_unit
		slot.breed = breed_name
		slot.unit = new_special
		slot.time = nil
		slot.state = "alive"
		slot.desc = "outside navmesh intervention"

		return true, breed_name
	end

	return 
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

				if 0.5 < time_left then
					Debug.text(string.format(" [%d] %s: SPAWNS IN %0.1f, ", i, slot.breed, time_left))
				else
					Debug.text(string.format(" [%d] %s: SPAWNING NOW, ", i, slot.breed))
				end
			else
				Debug.text(string.format(" [%d] %s: ALIVE, %s", i, slot.breed, tostring(slot.desc)))
			end
		end

		Debug.text("Specials: " .. s)
	end

	return 
end

return 
