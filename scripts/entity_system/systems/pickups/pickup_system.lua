require("scripts/unit_extensions/pickups/pickup_unit_extension")
require("scripts/unit_extensions/pickups/pickup_spawner_extension")

PlayerTeleportingPickupExtension = class(PlayerTeleportingPickupExtension, PickupUnitExtension)
PickupSystem = class(PickupSystem, ExtensionSystemBase)
RPCS = {
	"rpc_spawn_pickup_with_physics",
	"rpc_spawn_pickup"
}
local extensions = {
	"PlayerTeleportingPickupExtension",
	"PickupUnitExtension",
	"PickupSpawnerExtension"
}
local bonus_starting_gear_boon_events = {
	"starting_gear_boon_01",
	"starting_gear_boon_02",
	"starting_gear_boon_03",
	"starting_gear_boon_04"
}
PickupSystem.init = function (self, entity_system_creation_context, system_name)
	PickupSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self._debug_spawned_pickup = {}
	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self.network_manager = entity_system_creation_context.network_manager
	self.statistics_db = entity_system_creation_context.statistics_db
	self._dice_keeper = entity_system_creation_context.dice_keeper
	self.guaranteed_pickup_spawners = {}
	self.triggered_pickup_spawners = {}
	self._spawned_pickups = {}
	self._amount_spawned = {}
	self._starting_seed = nil
	self._next_index = 1
	self._n_original_chests_in_level = 0
	self._removed_chest_ids = {}
	self._broadphase = Broadphase(255, 15)
	self._broadphase_ids = {}
	self.primary_pickup_spawners = {}
	self.secondary_pickup_spawners = {}
	self._teleporting_pickups = {}
	self._spawned_bonus_starting_gear_index = 0

	return 
end
PickupSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data, ...)
	if extension_name ~= "PickupSpawnerExtension" then
		local position = POSITION_LOOKUP[unit]
		local id = Broadphase.add(self._broadphase, unit, position, 0.1)
		self._broadphase_ids[unit] = id

		if extension_name == "PlayerTeleportingPickupExtension" then
			local t = Managers.time:time("game")
			local pickup = AllPickups[extension_init_data.pickup_name]
			self._teleporting_pickups[unit] = {
				line_of_sight_fails = 0,
				init_data = extension_init_data,
				next_line_of_sight_check = t + pickup.teleport_time
			}
		end
	end

	return PickupSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data, ...)
end
PickupSystem.on_remove_extension = function (self, unit, extension_name, ...)
	if extension_name ~= "PickupSpawnerExtension" then
		local ids = self._broadphase_ids
		local id = ids[unit]

		Broadphase.remove(self._broadphase, id)

		ids[unit] = nil

		if extension_name == "PlayerTeleportingPickupExtension" then
			self._teleporting_pickups[unit] = nil
		end
	end

	return PickupSystem.super.on_remove_extension(self, unit, extension_name, ...)
end
PickupSystem.get_pickups = function (self, position, radius, result)
	return Broadphase.query(self._broadphase, position, radius, result)
end
local potential_spawns = {}
PickupSystem.pickup_gizmo_spawned = function (self, unit)
	if not self.is_server and not LEVEL_EDITOR_TEST then
		return 
	end

	if not Unit.is_a(unit, "units/hub_elements/pickup_spawner") and not Unit.is_a(unit, "units/hub_elements/training_dummy_spawner") then
		Application.warning("[PickupSystem] Using Old Pickup Spawner at Position %s ", Unit.local_position(unit, 0))

		return 
	end

	local position = Unit.local_position(unit, 0)
	local rotation = Unit.local_rotation(unit, 0)
	local guaranteed_spawn = Unit.get_data(unit, "guaranteed_spawn")
	local triggered_spawn_id = Unit.get_data(unit, "triggered_spawn_id")

	if guaranteed_spawn then
		self.guaranteed_pickup_spawners[#self.guaranteed_pickup_spawners + 1] = unit

		return 
	elseif triggered_spawn_id ~= "" then
		if not self.triggered_pickup_spawners[triggered_spawn_id] then
			self.triggered_pickup_spawners[triggered_spawn_id] = {}
		end

		local triggered_pickup_spawners = self.triggered_pickup_spawners[triggered_spawn_id]
		triggered_pickup_spawners[#triggered_pickup_spawners + 1] = unit

		return 
	end

	if Unit.get_data(unit, "bonus_spawner") then
		self.secondary_pickup_spawners[#self.secondary_pickup_spawners + 1] = unit
	else
		self.primary_pickup_spawners[#self.primary_pickup_spawners + 1] = unit
	end

	return 
end
PickupSystem.activate_triggered_pickup_spawners = function (self, triggered_spawn_id)
	local spawners = self.triggered_pickup_spawners[triggered_spawn_id]

	if not spawners then
		Application.warning("[PickupSystem] Attempted to trigger triggered pickups spawners with event %s but no spawners were registered to the event.", triggered_spawn_id)

		return 
	end

	local num_spawners = #spawners
	local spawn_type = "triggered"
	local spawned_unit = nil

	for i = 1, num_spawners, 1 do
		spawned_unit = self._spawn_guaranteed_pickup(self, spawners[i], spawn_type)
	end

	return spawned_unit
end
PickupSystem.create_checkpoint_data = function (self)
	return {
		seed = self._starting_seed,
		taken = table.clone(self._taken)
	}
end
PickupSystem.remove_pickups_due_to_crossroads = function (self, removed_path_distances, total_main_path_length)
	local to_remove = {}
	local num_removed_dist_pairs = #removed_path_distances
	local remove_tables = {
		self.primary_pickup_spawners,
		self.secondary_pickup_spawners,
		self.guaranteed_pickup_spawners,
		self.triggered_pickup_spawners
	}

	for k, spawners in ipairs(remove_tables) do
		for i = 1, #spawners, 1 do
			local spawner_unit = spawners[i]
			local percentage_through_level = Unit.get_data(spawner_unit, "percentage_through_level")
			local travel_dist = percentage_through_level * total_main_path_length

			for j = 1, num_removed_dist_pairs, 1 do
				local dist_pair = removed_path_distances[j]

				if dist_pair[1] < travel_dist and travel_dist < dist_pair[2] then
					to_remove[#to_remove + 1] = i

					break
				end
			end
		end

		for i = #to_remove, 1, -1 do
			table.remove(spawners, to_remove[i])

			to_remove[i] = nil
		end
	end

	return 
end
PickupSystem.setup_taken_pickups = function (self, checkpoint_data)
	if checkpoint_data then
		self._taken = checkpoint_data.taken
	else
		self._taken = {}
	end

	return 
end
PickupSystem.populate_pickups = function (self, checkpoint_data)
	local seed = nil

	if checkpoint_data then
		seed = checkpoint_data.seed
	else
		seed = Math.random(math.random_seed())
	end

	self._starting_seed = seed
	local level_settings = LevelHelper:current_level_settings()
	local level_pickup_settings = level_settings.pickup_settings

	if not level_pickup_settings then
		Application.warning("[PickupSystem] CURRENT LEVEL HAS NO PICKUP DATA IN ITS SETTINGS, NO PICKUPS WILL SPAWN ")

		return 
	end

	local difficulty_manager = Managers.state.difficulty
	local difficulty_rank = difficulty_manager.get_difficulty_rank(difficulty_manager)
	local difficulty = difficulty_manager.get_difficulty(difficulty_manager)
	local pickup_settings = level_pickup_settings[difficulty_rank]

	if not pickup_settings then
		Application.warning("[PickupSystem] CURRENT LEVEL HAS NO PICKUP DATA FOR CURRENT DIFFICULTY: %s, USING SETTINGS FOR EASY ", difficulty)

		pickup_settings = level_pickup_settings[1]
	end

	local primary_pickup_spawners = self.primary_pickup_spawners
	local secondary_pickup_spawners = self.secondary_pickup_spawners

	local function comparator(a, b)
		local percentage_a = Unit.get_data(a, "percentage_through_level")
		local percentage_b = Unit.get_data(b, "percentage_through_level")

		fassert(percentage_a, "Level Designer working on %s, You need to rebuild paths (pickup spawners broke)", level_settings.display_name)
		fassert(percentage_b, "Level Designer working on %s, You need to rebuild paths (pickup spawners broke)", level_settings.display_name)

		return percentage_a < percentage_b
	end

	self.spawn_guarenteed_pickups(self)

	local primary_pickup_settings = pickup_settings.primary or pickup_settings
	seed = self.spawn_spread_pickups(self, primary_pickup_spawners, primary_pickup_settings, comparator, seed, 1)
	local secondary_pickup_settings = pickup_settings.secondary

	if secondary_pickup_settings then
		seed = self.spawn_spread_pickups(self, secondary_pickup_spawners, secondary_pickup_settings, comparator, seed, 2)
	end

	if script_data.debug_pickup_spawners then
		self.debug_draw_spread_pickups(self)
	end

	return 
end
local pickups_to_spawn = {}
local section_spawners = {}
local used_spawners = {}
PickupSystem.spawn_spread_pickups = function (self, spawners, pickup_settings, comparator, seed, priority)
	table.sort(spawners, comparator)

	for pickup_type, value in pairs(pickup_settings) do
		table.clear(pickups_to_spawn)

		if type(value) == "table" then
			for pickup_name, amount in pairs(value) do
				for i = 1, amount, 1 do
					pickups_to_spawn[#pickups_to_spawn + 1] = pickup_name
				end
			end
		else
			for i = 1, value, 1 do
				local spawn_value = nil
				seed, spawn_value = Math.next_random(seed)
				local pickups = Pickups[pickup_type]
				local spawn_weighting_total = 0
				local selected_pickup = false

				for pickup_name, settings in pairs(pickups) do
					spawn_weighting_total = spawn_weighting_total + settings.spawn_weighting

					if spawn_value <= spawn_weighting_total then
						pickups_to_spawn[#pickups_to_spawn + 1] = pickup_name
						selected_pickup = true

						break
					end
				end

				fassert(selected_pickup, "Problem selecting a pickup to spawn, spawn_weighting_total = %s, spawn_value = %s", spawn_weighting_total, spawn_value)
			end
		end

		local num_sections = #pickups_to_spawn
		local section_size = 1 / num_sections
		local section_start_point = 0
		local section_end_point = 0
		local spawn_debt = 0

		if 2 <= #spawners then
			local first_spawner_percentage_through_level = Unit.get_data(spawners[1], "percentage_through_level")
			local last_spawner_percentage_through_level = Unit.get_data(spawners[#spawners], "percentage_through_level")
			local section_scale = 1 - first_spawner_percentage_through_level - 1 - last_spawner_percentage_through_level
			local section_start_point_offset = first_spawner_percentage_through_level
			section_size = section_scale / num_sections
			section_start_point = section_start_point_offset
		end

		for i = 1, num_sections, 1 do
			table.clear(section_spawners)
			table.clear(used_spawners)

			local num_pickup_spawners = #spawners
			section_end_point = section_start_point + section_size

			for j = 1, num_pickup_spawners, 1 do
				local spawner_unit = spawners[j]
				local percentage_through_level = Unit.get_data(spawner_unit, "percentage_through_level")

				if (section_start_point <= percentage_through_level and percentage_through_level < section_end_point) or (num_sections == i and percentage_through_level == 1) then
					section_spawners[#section_spawners + 1] = spawner_unit

					if script_data.debug_pickup_spawners then
						self._debug_add_spread_pickup_spawner(self, pickup_type, i, spawner_unit, priority)
					end
				end
			end

			section_start_point = section_end_point
			local num_section_spawners = #section_spawners

			if 0 < num_section_spawners and 0 <= spawn_debt then
				local remaining_sections = num_sections - i + 1
				local pickups_in_section = math.min(1 + math.ceil(spawn_debt / remaining_sections), num_section_spawners)
				local rnd = nil
				seed, rnd = Math.next_random(seed)
				local bonus_spawn = remaining_sections ~= 1 and pickups_in_section == 1 and rnd < NearPickupSpawnChance[pickup_type]
				pickups_in_section = pickups_in_section + ((bonus_spawn and 1) or 0)
				local num_spawned_pickups_in_section = 0
				seed = table.shuffle(section_spawners, seed)
				local previously_selected_spawner = nil

				for j = 1, pickups_in_section, 1 do
					local num_available_section_spawners = #section_spawners
					local selected_spawner, pickup_index = nil

					if previously_selected_spawner then
						local percentage_through_level = Unit.get_data(previously_selected_spawner, "percentage_through_level")

						local function comparator_two(a, b)
							local percentage_a = Unit.get_data(a, "percentage_through_level")
							local percentage_b = Unit.get_data(b, "percentage_through_level")

							return math.abs(percentage_through_level - percentage_a) < math.abs(percentage_through_level - percentage_b)
						end

						table.sort(section_spawners, comparator_two)
					end

					for k = 1, num_available_section_spawners, 1 do
						local num_pickups_to_spawn = #pickups_to_spawn
						local spawner_unit = section_spawners[k]

						for l = 1, num_pickups_to_spawn, 1 do
							local pickup_name = pickups_to_spawn[l]
							local can_spawn = Unit.get_data(spawner_unit, pickup_name)

							if can_spawn then
								local settings = AllPickups[pickup_name]
								local spawner_extension = ScriptUnit.extension(spawner_unit, "pickup_system")
								local position, rotation, full = spawner_extension.get_spawn_location_data(spawner_extension)
								local spawn_type = "spawner"
								local pickup_unit = self._spawn_pickup(self, settings, pickup_name, position, rotation, false, spawn_type)

								if script_data.debug_pickup_spawners and pickup_unit then
									self._debug_add_spread_pickup(self, spawner_unit, pickup_type)
								end

								num_spawned_pickups_in_section = num_spawned_pickups_in_section + 1
								selected_spawner = spawner_unit
								pickup_index = l

								if full then
									used_spawners[#used_spawners + 1] = spawner_unit
								end

								break
							end
						end

						if selected_spawner then
							break
						end
					end

					if selected_spawner then
						local index = table.find(section_spawners, selected_spawner)

						table.remove(section_spawners, index)
						table.remove(pickups_to_spawn, pickup_index)

						previously_selected_spawner = selected_spawner
					end
				end

				spawn_debt = spawn_debt - num_spawned_pickups_in_section - 1
			else
				spawn_debt = spawn_debt + 1
			end

			local num_used_spawners = #used_spawners

			for j = 1, num_used_spawners, 1 do
				local spawner_unit = used_spawners[j]
				local index = table.find(spawners, spawner_unit)

				table.remove(spawners, index)
			end
		end

		if 1 < spawn_debt then
			Application.warning("[PickupSystem] Remaining spawn debt when trying to spawn %s pickups ", pickup_type)
		end
	end

	return seed
end
PickupSystem._debug_add_spread_pickup_spawner = function (self, pickup_type, section_index, spawner_unit, priority)
	local spawners = self._debug_spread_pickup_spawners

	if not spawners then
		spawners = {}
		self._debug_spread_pickup_spawners = spawners
	end

	local spawners_by_priority = spawners[priority]

	if not spawners_by_priority then
		spawners_by_priority = {}
		spawners[priority] = spawners_by_priority
	end

	local spawners_by_type = spawners_by_priority[pickup_type]

	if not spawners_by_type then
		spawners_by_type = {}
		spawners_by_priority[pickup_type] = spawners_by_type
	end

	local spawners_by_type_and_section = spawners_by_type[section_index]

	if not spawners_by_type_and_section then
		spawners_by_type_and_section = {}
		spawners_by_type[section_index] = spawners_by_type_and_section
	end

	spawners_by_type_and_section[#spawners_by_type_and_section + 1] = spawner_unit

	return 
end
PickupSystem._debug_add_spread_pickup = function (self, spawner_unit, pickup_type)
	local pickups = self._debug_spread_pickups

	if not pickups then
		pickups = {}
		self._debug_spread_pickups = pickups
	end

	pickups[spawner_unit] = pickup_type

	return 
end
PickupSystem.debug_draw_spread_pickups = function (self)
	if not script_data.debug_pickup_spawners then
		Application.warning("The debug_pickup_spawners option must be set to true from the debug menu when using this feature")

		return 
	end

	local spawners = self._debug_spread_pickup_spawners
	local pickups = self._debug_spread_pickups
	local draw_mode = self._debug_spread_pickups_draw_mode

	if not spawners then
		return 
	end

	if draw_mode then
		draw_mode = draw_mode + 1
	else
		draw_mode = 0
	end

	local pickup_type_colors = {
		healing = Colors.get("yellow"),
		potions = Colors.get("orange"),
		level_events = Colors.get("red"),
		ammo = Colors.get("green"),
		grenades = Colors.get("blue"),
		improved_grenades = Colors.get("cyan"),
		special = Colors.get("magenta"),
		lorebook_pages = Colors.get("white"),
		undefined = Colors.get("black")
	}
	local section_colors = {
		Colors.get("orange"),
		Colors.get("pink"),
		Colors.get("yellow"),
		Colors.get("red"),
		Colors.get("light_green"),
		Colors.get("blue"),
		Colors.get("cyan"),
		Colors.get("magenta"),
		Colors.get("white")
	}
	local drawer = Managers.state.debug:drawer({
		mode = "retained",
		name = "debug_spread_pickups"
	})

	drawer.reset(drawer)

	if 0 < draw_mode then
		local pickup_type_cnt = 0
		local found_type = false

		for priority, pickup_types in ipairs(spawners) do
			if found_type then
				break
			end

			for pickup_type, sections in pairs(pickup_types) do
				pickup_type_cnt = pickup_type_cnt + 1

				if pickup_type_cnt == draw_mode then
					local section_color_index = 0

					for _, spawner_units in pairs(sections) do
						section_color_index = section_color_index + 1

						if #section_colors < section_color_index then
							section_color_index = 1
						end

						local section_color = section_colors[section_color_index]

						for _, spawner_unit in ipairs(spawner_units) do
							local spawner_extension = ScriptUnit.extension(spawner_unit, "pickup_system")
							local position, _, _ = spawner_extension.get_spawn_location_data(spawner_extension)

							drawer.line(drawer, position, position + Vector3(0, 0, 20), section_color)

							if pickups and pickups[spawner_unit] == pickup_type then
								drawer.sphere(drawer, position + Vector3(0, 0, 20), 0.6, section_color)
							end
						end
					end

					found_type = true

					print("Drawing pickup spawner sections for \"" .. pickup_type .. "\" of priority " .. priority)

					break
				end
			end
		end

		if not found_type then
			draw_mode = 0
		end
	end

	if draw_mode == 0 then
		print("Drawing all spawners colored by pickup type")

		for priority, pickup_types in ipairs(spawners) do
			for pickup_type, sections in pairs(pickup_types) do
				for _, spawner_units in pairs(sections) do
					for _, spawner_unit in ipairs(spawner_units) do
						local spawner_extension = ScriptUnit.extension(spawner_unit, "pickup_system")
						local position, _, _ = spawner_extension.get_spawn_location_data(spawner_extension)
						local color = pickup_type_colors[pickup_type] or pickup_type_colors.undefined

						drawer.line(drawer, position, position + Vector3(0, 0, 20), color)

						if pickups and pickups[spawner_unit] then
							drawer.sphere(drawer, position + Vector3(0, 0, 20), 0.6, color)
						end
					end
				end
			end
		end
	end

	self._debug_spread_pickups_draw_mode = draw_mode

	return 
end
PickupSystem.spawn_guarenteed_pickups = function (self)
	local spawners = self.guaranteed_pickup_spawners
	local num_spawners = #spawners
	local spawn_type = "guaranteed"

	for i = 1, num_spawners, 1 do
		self._spawn_guaranteed_pickup(self, spawners[i], spawn_type)
	end

	return 
end
local potential_pickups = {}
PickupSystem._spawn_guaranteed_pickup = function (self, spawner_unit, spawn_type)
	table.clear(potential_pickups)

	for pickup_name, settings in pairs(AllPickups) do
		local can_spawn = Unit.get_data(spawner_unit, pickup_name)

		if can_spawn and 0 < settings.spawn_weighting then
			potential_pickups[#potential_pickups + 1] = pickup_name
		end
	end

	local num_potential_pickups = #potential_pickups

	if 0 < num_potential_pickups then
		local random_index = math.random(num_potential_pickups)
		local pickup_to_spawn = potential_pickups[random_index]
		local position = Unit.local_position(spawner_unit, 0)
		local rotation = Unit.local_rotation(spawner_unit, 0)
		local settings = AllPickups[pickup_to_spawn]
		local spawned_unit = self._spawn_pickup(self, settings, pickup_to_spawn, position, rotation, false, spawn_type)

		return spawned_unit
	end

	return 
end
PickupSystem.update = function (self, dt, t)
	if self.is_server then
		self._update_teleporting_pickups(self, dt, t)
		self._check_bonus_starting_gear_boon(self)
	end

	local statistics_db = self.statistics_db
	local update_list = self.update_list

	for extension_name, _ in pairs(self.extensions) do
		local profiler_name = self.profiler_names[extension_name]

		for unit, extension in pairs(update_list[extension_name].update) do
			local hide_func = extension.hide_func

			if not DEDICATED_SERVER and hide_func and hide_func(statistics_db) and not extension.hidden then
				extension.hide(extension)
			end
		end
	end

	return 
end
local MAX_FAILS = 4
local MIN_Z = -100
local TIME_BETWEEN_LINE_OF_SIGHT_CHECKS = 3.5
local TELEPORT_Z_OFFSET = 0.25
PickupSystem._update_teleporting_pickups = function (self, dt, t)
	for unit, data in pairs(self._teleporting_pickups) do
		local pos = POSITION_LOOKUP[unit]

		if pos.z < MIN_Z then
			data.next_line_of_sight_check = t + TIME_BETWEEN_LINE_OF_SIGHT_CHECKS
			data.line_of_sight_fails = 0

			self._teleport_pickup(self, unit)
		elseif data.next_line_of_sight_check < t then
			data.next_line_of_sight_check = t + TIME_BETWEEN_LINE_OF_SIGHT_CHECKS
			local has_los = self._check_teleporting_pickup_line_of_sight(self, unit)

			if has_los then
				data.line_of_sight_fails = 0
			else
				local fails = data.line_of_sight_fails + 1

				if MAX_FAILS < fails then
					data.line_of_sight_fails = 0

					self._teleport_pickup(self, unit, data)
				else
					data.line_of_sight_fails = fails
				end
			end
		end
	end

	return 
end
local HEAD_HEIGHT = 1.75
local MIN_RAY_DIST = 0.25
local MAX_RAY_DIST = 40
local ACTOR_NAME = "throw"
PickupSystem._check_teleporting_pickup_line_of_sight = function (self, unit)
	local pos = Actor.position(Unit.actor(unit, ACTOR_NAME))
	local physics_world = World.physics_world(self.world)

	for _, player in pairs(Managers.player:players()) do
		local player_unit = player.player_unit

		if Unit.alive(player_unit) and ScriptUnit.extension(player_unit, "health_system"):is_alive() then
			local head_height_pos = POSITION_LOOKUP[player_unit] + Vector3(0, 0, HEAD_HEIGHT)
			local diff = pos - head_height_pos
			local length = Vector3.length(diff)

			if MAX_RAY_DIST < length then
			elseif MIN_RAY_DIST < length then
				local direction = diff / length
				local hit = PhysicsWorld.immediate_raycast(physics_world, head_height_pos, direction, length, "closest", "collision_filter", "filter_player_mover")

				if not hit then
					return true
				end
			else
				return true
			end
		end
	end

	return false
end
PickupSystem._teleport_pickup = function (self, unit)
	local new_pos = nil

	for _, player in pairs(Managers.player:human_players()) do
		local player_unit = player.player_unit

		if Unit.alive(player_unit) and ScriptUnit.extension(player_unit, "health_system"):is_alive() then
			new_pos = ScriptUnit.extension(player_unit, "locomotion_system"):last_position_on_navmesh() + Vector3(0, 0, TELEPORT_Z_OFFSET)

			break
		end
	end

	if new_pos then
		Actor.teleport_position(Unit.actor(unit, ACTOR_NAME), new_pos)
	end

	return 
end
PickupSystem._check_bonus_starting_gear_boon = function (self)
	local human_players = Managers.player:human_players()
	local num_bonus_starting_gear_boons = 0

	for _, player in pairs(human_players) do
		local player_boon_handler = player.boon_handler

		if player_boon_handler then
			local num_boons = player_boon_handler.get_num_boons(player_boon_handler, "bonus_starting_gear")

			if num_bonus_starting_gear_boons < num_boons then
				num_bonus_starting_gear_boons = num_boons
			end
		end
	end

	local spawned_bonus_starting_gear_index = self._spawned_bonus_starting_gear_index

	if spawned_bonus_starting_gear_index < num_bonus_starting_gear_boons then
		for i = spawned_bonus_starting_gear_index, num_bonus_starting_gear_boons, 1 do
			local event_name = bonus_starting_gear_boon_events[i]

			self.activate_triggered_pickup_spawners(self, event_name)
		end

		self._spawned_bonus_starting_gear_index = num_bonus_starting_gear_boons
	end

	return 
end
PickupSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	return 
end
PickupSystem.hot_join_sync = function (self, sender)
	return 
end
PickupSystem.debug_spawn_pickup = function (self, pickup_name, optional_pos, raycast_down)
	local pickup_settings = AllPickups[pickup_name]
	local player_manager = Managers.player
	local player = player_manager.local_player(player_manager)
	local player_unit = player.player_unit
	local position = optional_pos or POSITION_LOOKUP[player_unit]

	if not position then
		return 
	end

	if position and raycast_down then
		local physics_world = World.physics_world(self.world)
		local direction = Vector3.down()
		local length = 15
		local result, new_position, _, _ = PhysicsWorld.immediate_raycast(physics_world, position, direction, length, "closest", "collision_filter", "filter_dropped_weapon")

		if result then
			position = new_position
		end
	end

	local rotation = Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360)))
	local with_physics = false
	local spawn_type = "debug"
	local pickup_unit = self._spawn_pickup(self, pickup_settings, pickup_name, position, rotation, with_physics, spawn_type)

	if pickup_unit then
		self._debug_spawned_pickup[#self._debug_spawned_pickup + 1] = pickup_unit

		return pickup_unit
	end

	return 
end
PickupSystem.debug_destroy_all_pickups = function (self)
	local network_manager = Managers.state.network

	if not network_manager.game(network_manager) then
		return 
	end

	for k, unit in ipairs(self._debug_spawned_pickup) do
		if Unit.alive(unit) then
			Managers.state.unit_spawner:mark_for_deletion(unit)
		end
	end

	table.clear(self._debug_spawned_pickup)

	return 
end
PickupSystem._spawn_pickup = function (self, pickup_settings, pickup_name, position, rotation, with_physics, spawn_type)
	local next_index = self._next_index

	if self._taken[next_index] then
		return 
	end

	local can_spawn_func = pickup_settings.can_spawn_func

	if can_spawn_func and not can_spawn_func(nil, spawn_type == "debug") then
		return 
	end

	local extension_init_data = {
		pickup_system = {
			pickup_name = pickup_name,
			has_physics = with_physics,
			spawn_type = spawn_type,
			spawn_index = next_index
		},
		projectile_locomotion_system = {
			network_position = AiAnimUtils.position_network_scale(position, true),
			network_rotation = AiAnimUtils.rotation_network_scale(rotation, true),
			network_velocity = AiAnimUtils.velocity_network_scale(Vector3.zero(), true),
			network_angular_velocity = AiAnimUtils.velocity_network_scale(Vector3.zero(), true)
		}
	}
	self._next_index = next_index + 1
	local unit_template_name = pickup_settings.unit_template_name or "pickup_unit"
	local additional_data_func = pickup_settings.additional_data_func

	if additional_data_func then
		local extra_extension_init_data = nil
		extra_extension_init_data = self[additional_data_func](self, pickup_settings, position, rotation)

		table.merge(extension_init_data, extra_extension_init_data)
	end

	local unit_name = pickup_settings.unit_name
	local pickup_unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, position, rotation)

	if self.is_server then
		self._spawned_pickups[#self._spawned_pickups + 1] = pickup_unit
		local amount_spawned = self._amount_spawned
		local amount = amount_spawned[pickup_name]

		if amount then
			amount_spawned[pickup_name] = amount + 1
		else
			amount_spawned[pickup_name] = 1
		end
	end

	return pickup_unit
end
PickupSystem.rpc_spawn_pickup_with_physics = function (self, sender, pickup_name_id, position, rotation, spawn_type_id)
	local pickup_name = NetworkLookup.pickup_names[pickup_name_id]
	local spawn_type = NetworkLookup.pickup_spawn_types[spawn_type_id]

	fassert(AllPickups[pickup_name], "pickup name %s does not exist in Pickups table", pickup_name)

	local pickup_settings = AllPickups[pickup_name]

	self._spawn_pickup(self, pickup_settings, pickup_name, position, rotation, true, spawn_type)

	return 
end
PickupSystem.rpc_spawn_pickup = function (self, sender, pickup_name_id, position, rotation, spawn_type_id)
	local pickup_name = NetworkLookup.pickup_names[pickup_name_id]
	local spawn_type = NetworkLookup.pickup_spawn_types[spawn_type_id]

	fassert(AllPickups[pickup_name], "pickup name %s does not exist in Pickups table", pickup_name)

	local pickup_settings = AllPickups[pickup_name]

	self._spawn_pickup(self, pickup_settings, pickup_name, position, rotation, false, spawn_type)

	return 
end
PickupSystem.explosive_barrel = function (self, pickup_settings, position, rotation)
	local network_position = AiAnimUtils.position_network_scale(position, true)
	local network_rotation = AiAnimUtils.rotation_network_scale(rotation, true)
	local network_velocity = AiAnimUtils.velocity_network_scale(Vector3(0, 0, 0), true)
	local network_angular_velocity = network_velocity
	local item_name = "explosive_barrel"
	local extension_init_data = {
		projectile_locomotion_system = {
			network_position = network_position,
			network_rotation = network_rotation,
			network_velocity = network_velocity,
			network_angular_velocity = network_angular_velocity
		},
		health_system = {
			in_hand = false,
			item_name = item_name
		}
	}

	return extension_init_data
end
PickupSystem.training_dummy = function (self, pickup_settings, position, rotation)
	local network_position = AiAnimUtils.position_network_scale(position, true)
	local network_rotation = AiAnimUtils.rotation_network_scale(rotation, true)
	local network_velocity = AiAnimUtils.velocity_network_scale(Vector3(0, 0, 0), true)
	local network_angular_velocity = network_velocity
	local item_name = "explosive_barrel"
	local extension_init_data = {
		projectile_locomotion_system = {
			network_position = network_position,
			network_rotation = network_rotation,
			network_velocity = network_velocity,
			network_angular_velocity = network_angular_velocity
		},
		health_system = {
			in_hand = false,
			item_name = item_name
		}
	}

	return extension_init_data
end
PickupSystem.set_taken = function (self, spawn_index)
	if self.is_server then
		self._taken[spawn_index] = true
	end

	return 
end
local spiral = {}
local spiral_segments = 8
PickupSystem.debug_show_pickups = function (self, dt, t)
	local spawned_pickups = self._spawned_pickups
	local local_position = Unit.local_position
	local color = Color(45, 245, 100)
	local step = (2 * math.pi) / 6

	for i = 1, spiral_segments, 1 do
		spiral[i] = Vector3(math.sin(t * 6 + i * step) * 0.3, math.cos(t * 6 + i * step) * 0.5, (i - 1) * 4)
	end

	for k, unit in pairs(spawned_pickups) do
		if Unit.alive(unit) then
			local pos = local_position(unit, 0)
			local pos1 = Vector3(0, 0, 0)

			for i = 1, spiral_segments, 1 do
				local pos2 = spiral[i]

				QuickDrawer:line(pos + pos1, pos + pos2, color)

				pos1 = pos2
			end
		else
			spawned_pickups[k] = nil
		end
	end

	self.display_number_of_pickups(self)

	return 
end
PickupSystem.display_number_of_pickups = function (self)
	local amount_spawned = self._amount_spawned
	local s = "PICKUPS:" .. tostring(#self._spawned_pickups) .. ", "
	local items = 0

	for name, amount in pairs(amount_spawned) do
		s = s .. name .. "=" .. amount .. ", "
		items = items + 1

		if 5 < items then
			Debug.text(s)

			s = ""
			items = 0
		end
	end

	if 0 < items then
		Debug.text(s)
	end

	return 
end

return 
