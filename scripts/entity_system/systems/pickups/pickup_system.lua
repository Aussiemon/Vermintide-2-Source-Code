require("scripts/unit_extensions/pickups/pickup_unit_extension")
require("scripts/unit_extensions/pickups/pickup_spawner_extension")

LifeTimePickupUnitExtension = class(LifeTimePickupUnitExtension, PickupUnitExtension)
LimitedOwnedPickupUnitExtension = class(LimitedOwnedPickupUnitExtension, PickupUnitExtension)
PlayerTeleportingPickupExtension = class(PlayerTeleportingPickupExtension, PickupUnitExtension)
PickupSystem = class(PickupSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_spawn_pickup_with_physics",
	"rpc_spawn_pickup",
	"rpc_spawn_linked_pickup",
	"rpc_force_use_pickup",
	"rpc_delete_pickup",
	"rpc_delete_limited_owned_pickup_unit",
	"rpc_delete_limited_owned_pickups",
	"rpc_delete_limited_owned_pickup_type"
}
local extensions = {
	"LifeTimePickupUnitExtension",
	"LimitedOwnedPickupUnitExtension",
	"PlayerTeleportingPickupExtension",
	"PickupUnitExtension",
	"PickupSpawnerExtension"
}

for _, dlc in pairs(DLCSettings) do
	local additional_system_extensions = dlc.additional_system_extensions and dlc.additional_system_extensions.pickup_system

	if additional_system_extensions then
		for _, extension in ipairs(additional_system_extensions) do
			require(extension.require)

			extensions[#extensions + 1] = extension.class
		end
	end
end

local extension_update = {}

DLCUtils.append("pickup_system_extension_update", extension_update)

PickupSystem.init = function (self, context, system_name)
	PickupSystem.super.init(self, context, system_name, extensions)

	self._debug_spawned_pickup = {}
	local network_event_delegate = context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self._network_manager = context.network_manager
	self._statistics_db = context.statistics_db
	local level_seed = Managers.mechanism:get_level_seed("pickups")

	self:set_seed(level_seed)

	self.guaranteed_pickup_spawners = {}
	self.triggered_pickup_spawners = {}
	self._next_index = 1
	self._broadphase = Broadphase(255, 15)
	self._broadphase_ids = {}
	self._pickup_units_by_type = {}

	for pickup_name, _ in pairs(AllPickups) do
		self._pickup_units_by_type[pickup_name] = {}
	end

	self.primary_pickup_spawners = {}
	self.secondary_pickup_spawners = {}
	self.specified_pickup_spawners = {}
	self._teleporting_pickups = {}
	self._life_time_pickups = {}
	self._limited_owned_pickups = {}

	if not DEDICATED_SERVER then
	end

	Managers.state.event:register(self, "delete_limited_owned_pickups", "event_delete_limited_owned_pickups")
end

PickupSystem._random = function (self, ...)
	local seed, value = Math.next_random(self._seed, ...)
	self._seed = seed

	return value
end

PickupSystem._shuffle = function (self, source)
	self._seed = table.shuffle(source, self._seed)
end

PickupSystem.set_seed = function (self, seed)
	fassert(seed and type(seed) == "number", "Bad seed input!")

	self._seed = seed
	self._starting_seed = seed
end

PickupSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data, ...)
	if extension_name ~= "PickupSpawnerExtension" then
		local position = POSITION_LOOKUP[unit]
		local pickup_name = extension_init_data.pickup_name
		local id = Broadphase.add(self._broadphase, unit, position, 0.1)
		self._broadphase_ids[unit] = id

		if extension_name == "PlayerTeleportingPickupExtension" then
			local t = Managers.time:time("game")
			local pickup_settings = AllPickups[pickup_name]
			self._teleporting_pickups[unit] = {
				line_of_sight_fails = 0,
				init_data = extension_init_data,
				next_line_of_sight_check = t + pickup_settings.teleport_time
			}
		end

		if extension_name == "LifeTimePickupUnitExtension" then
			local t = Managers.time:time("game")
			local pickup_settings = AllPickups[pickup_name]
			self._life_time_pickups[unit] = {
				init_data = extension_init_data,
				pickup_settings = pickup_settings,
				life_time = t + pickup_settings.life_time
			}
		end

		if extension_name == "LimitedOwnedPickupUnitExtension" then
			local peer_id = extension_init_data.owner_peer_id

			if peer_id then
				local limited_owned_pickups = self._limited_owned_pickups

				if not limited_owned_pickups[peer_id] then
					limited_owned_pickups[peer_id] = {
						spawn_limit = extension_init_data.spawn_limit,
						units = {}
					}
				end

				limited_owned_pickups[peer_id].units[#limited_owned_pickups[peer_id].units + 1] = unit
			end
		end

		if extension_name == "LifeTimePickupUnitExtension" or extension_name == "LimitedOwnedPickupUnitExtension" or extension_name == "PlayerTeleportingPickupExtension" or extension_name == "PickupUnitExtension" then
			local units = self._pickup_units_by_type[pickup_name]
			units[#units + 1] = unit
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

		if extension_name == "LifeTimePickupUnitExtension" then
			self._life_time_pickups[unit] = nil
		end

		if extension_name == "LifeTimePickupUnitExtension" or extension_name == "PlayerTeleportingPickupExtension" or extension_name == "PickupUnitExtension" then
			local pickup_name = Unit.get_data(unit, "pickup_name")
			local units = self._pickup_units_by_type[pickup_name]
			local index = nil

			for i = 1, #units, 1 do
				local pickup_unit = units[i]

				if pickup_unit == unit then
					index = i

					break
				end
			end

			if index then
				table.remove(units, index)
			end
		end
	end

	return PickupSystem.super.on_remove_extension(self, unit, extension_name, ...)
end

PickupSystem.get_pickups = function (self, position, radius, result)
	return Broadphase.query(self._broadphase, position, radius, result)
end

PickupSystem.get_pickups_by_type = function (self, pickup_name)
	local pickup_units_by_type = self._pickup_units_by_type

	return pickup_units_by_type[pickup_name]
end

PickupSystem.pickup_gizmo_spawned = function (self, unit)
	if not self.is_server and not LEVEL_EDITOR_TEST then
		return
	end

	if not Unit.is_a(unit, "units/hub_elements/pickup_spawner") and not Unit.is_a(unit, "units/hub_elements/training_dummy_spawner") then
		Application.warning("[PickupSystem] Using Old Pickup Spawner at Position %s ", Unit.local_position(unit, 0))

		return
	end

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
end

PickupSystem.specific_pickup_gizmo_spawned = function (self, unit)
	if not self.is_server and not LEVEL_EDITOR_TEST then
		return
	end

	self.specified_pickup_spawners[#self.specified_pickup_spawners + 1] = unit
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
		spawned_unit = self:_spawn_guaranteed_pickup(spawners[i], spawn_type)
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

	for k = 1, #remove_tables, 1 do
		local spawners = remove_tables[k]

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
end

PickupSystem.setup_taken_pickups = function (self, checkpoint_data)
	if checkpoint_data then
		self._taken = checkpoint_data.taken
	else
		self._taken = {}
	end
end

local PRIMARY_TO_REMOVE = {}
local SECONDARY_TO_REMOVE = {}

PickupSystem.disable_spawners = function (self, spawner_types)
	table.clear(PRIMARY_TO_REMOVE)
	table.clear(SECONDARY_TO_REMOVE)

	self._disabled_spawner_types = self._disabled_spawner_types or {}

	for _, spawner_type in ipairs(spawner_types) do
		if not self._disabled_spawner_types[spawner_type] then
			for idx, unit in pairs(self.primary_pickup_spawners) do
				if Unit.get_data(unit, spawner_type) then
					PRIMARY_TO_REMOVE[#PRIMARY_TO_REMOVE + 1] = idx
				end
			end

			for idx, unit in pairs(self.secondary_pickup_spawners) do
				if Unit.get_data(unit, spawner_type) then
					SECONDARY_TO_REMOVE[#SECONDARY_TO_REMOVE + 1] = idx
				end
			end
		end

		self._disabled_spawner_types[spawner_type] = true
	end

	for i = #PRIMARY_TO_REMOVE, 1, -1 do
		local to_remove = PRIMARY_TO_REMOVE[i]

		table.remove(self.primary_pickup_spawners, to_remove)
	end

	for i = #SECONDARY_TO_REMOVE, 1, -1 do
		local to_remove = SECONDARY_TO_REMOVE[i]

		table.remove(self.secondary_pickup_spawners, to_remove)
	end
end

PickupSystem.populate_pickups = function (self, checkpoint_data)
	if checkpoint_data then
		local checkpoint_seed = checkpoint_data.seed

		self:set_seed(checkpoint_seed)
	end

	local level_settings = LevelHelper:current_level_settings()
	local level_pickup_settings = level_settings.pickup_settings

	if not level_pickup_settings then
		Application.warning("[PickupSystem] CURRENT LEVEL HAS NO PICKUP DATA IN ITS SETTINGS, NO PICKUPS WILL SPAWN ")

		return
	end

	local difficulty_manager = Managers.state.difficulty
	local difficulty = difficulty_manager:get_difficulty()
	local pickup_settings = level_pickup_settings[difficulty]

	if not pickup_settings then
		Application.warning("[PickupSystem] CURRENT LEVEL HAS NO PICKUP DATA FOR CURRENT DIFFICULTY: %s, USING SETTINGS FOR EASY ", difficulty)

		pickup_settings = level_pickup_settings.default or level_pickup_settings[1]
	end

	local ignore_sections = level_settings.ignore_sections_in_pickup_spawning

	local function comparator(a, b)
		local percentage_a = Unit.get_data(a, "percentage_through_level")
		local percentage_b = Unit.get_data(b, "percentage_through_level")

		fassert(percentage_a, "Level Designer working on %s, You need to rebuild paths (pickup spawners broke)", level_settings.display_name)
		fassert(percentage_b, "Level Designer working on %s, You need to rebuild paths (pickup spawners broke)", level_settings.display_name)

		return percentage_a < percentage_b
	end

	self:spawn_guarenteed_pickups()

	local mutator_handler = Managers.state.game_mode._mutator_handler
	local primary_pickup_spawners = self.primary_pickup_spawners
	local primary_pickup_settings = pickup_settings.primary or pickup_settings
	primary_pickup_settings = mutator_handler:pickup_settings_updated_settings(primary_pickup_settings)

	self:_spawn_spread_pickups(primary_pickup_spawners, primary_pickup_settings, comparator, 1, ignore_sections)

	local secondary_pickup_spawners = self.secondary_pickup_spawners
	local secondary_pickup_settings = pickup_settings.secondary
	secondary_pickup_settings = mutator_handler:pickup_settings_updated_settings(secondary_pickup_settings)

	if secondary_pickup_settings then
		self:_spawn_spread_pickups(secondary_pickup_spawners, secondary_pickup_settings, comparator, 2, ignore_sections)
	end
end

PickupSystem.populate_specified_pickups = function (self, checkpoint_data)
	if checkpoint_data then
		local checkpoint_seed = checkpoint_data.seed

		self:set_seed(checkpoint_seed)
	end

	self:_spawn_specified_pickups()
end

local pickups_to_spawn = {}
local section_spawners = {}
local used_spawners = {}

PickupSystem._spawn_spread_pickups = function (self, spawners, pickup_settings, comparator, priority, ignore_sections)
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
				local spawn_value = self:_random()
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
		local section_end_point = nil
		local spawn_debt = 0

		if #spawners >= 2 then
			local first_spawner_percentage_through_level = Unit.get_data(spawners[1], "percentage_through_level")
			local last_spawner_percentage_through_level = Unit.get_data(spawners[#spawners], "percentage_through_level")
			local section_scale = 1 - first_spawner_percentage_through_level - (1 - last_spawner_percentage_through_level)
			local section_start_point_offset = first_spawner_percentage_through_level
			section_size = section_scale / num_sections
			section_start_point = section_start_point_offset
		end

		if ignore_sections then
			num_sections = 1
		end

		for i = 1, num_sections, 1 do
			table.clear(section_spawners)
			table.clear(used_spawners)

			section_end_point = section_start_point + section_size
			local num_pickup_spawners = #spawners

			for j = 1, num_pickup_spawners, 1 do
				local spawner_unit = spawners[j]
				local percentage_through_level = Unit.get_data(spawner_unit, "percentage_through_level")

				if ignore_sections or (section_start_point <= percentage_through_level and percentage_through_level < section_end_point) or (num_sections == i and percentage_through_level == 1) then
					section_spawners[#section_spawners + 1] = spawner_unit
				end
			end

			section_start_point = section_end_point
			local num_section_spawners = #section_spawners

			if num_section_spawners > 0 and spawn_debt >= 0 then
				local remaining_sections = num_sections - i + 1
				local pickups_in_section = math.min(1 + math.ceil(spawn_debt / remaining_sections), num_section_spawners)
				local rnd = self:_random()
				local bonus_spawn = remaining_sections ~= 1 and pickups_in_section == 1 and rnd < NearPickupSpawnChance[pickup_type]

				if not ignore_sections or not #pickups_to_spawn then
					pickups_in_section = pickups_in_section + ((bonus_spawn and 1) or 0)
				end

				self:_shuffle(section_spawners)

				local num_spawned_pickups_in_section = 0
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
							local can_spawn = self:_can_spawn(spawner_unit, pickup_name)

							if can_spawn then
								local settings = AllPickups[pickup_name]
								local spawner_extension = ScriptUnit.extension(spawner_unit, "pickup_system")
								local position, rotation, full = spawner_extension:get_spawn_location_data()
								local spawn_type = "spawner"
								local pickup_unit, _ = self:_spawn_pickup(settings, pickup_name, position, rotation, false, spawn_type)
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

				spawn_debt = spawn_debt - (num_spawned_pickups_in_section - 1)
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

		if spawn_debt > 1 then
			Application.warning("[PickupSystem] Remaining spawn debt when trying to spawn %s pickups ", pickup_type)
		end
	end
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
end

PickupSystem._debug_add_spread_pickup = function (self, spawner_unit, pickup_type)
	local pickups = self._debug_spread_pickups

	if not pickups then
		pickups = {}
		self._debug_spread_pickups = pickups
	end

	pickups[spawner_unit] = pickup_type
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

	drawer:reset()

	if draw_mode > 0 then
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

						if section_color_index > #section_colors then
							section_color_index = 1
						end

						local section_color = section_colors[section_color_index]

						for _, spawner_unit in ipairs(spawner_units) do
							local spawner_extension = ScriptUnit.extension(spawner_unit, "pickup_system")
							local position, _, _ = spawner_extension:get_spawn_location_data()

							drawer:line(position, position + Vector3(0, 0, 20), section_color)

							if pickups and pickups[spawner_unit] == pickup_type then
								drawer:sphere(position + Vector3(0, 0, 20), 0.6, section_color)
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

		for _, pickup_types in ipairs(spawners) do
			for pickup_type, sections in pairs(pickup_types) do
				for _, spawner_units in pairs(sections) do
					for _, spawner_unit in ipairs(spawner_units) do
						local spawner_extension = ScriptUnit.extension(spawner_unit, "pickup_system")
						local position, _, _ = spawner_extension:get_spawn_location_data()
						local color = pickup_type_colors[pickup_type] or pickup_type_colors.undefined

						drawer:line(position, position + Vector3(0, 0, 20), color)

						if pickups and pickups[spawner_unit] then
							drawer:sphere(position + Vector3(0, 0, 20), 0.6, color)
						end
					end
				end
			end
		end
	end

	self._debug_spread_pickups_draw_mode = draw_mode
end

PickupSystem.disable_teleporting_pickups = function (self)
	for unit, _ in pairs(self._teleporting_pickups) do
		self._teleporting_pickups[unit] = nil
	end
end

PickupSystem.spawn_guarenteed_pickups = function (self)
	local spawners = self.guaranteed_pickup_spawners
	local num_spawners = #spawners
	local spawn_type = "guaranteed"

	for i = 1, num_spawners, 1 do
		self:_spawn_guaranteed_pickup(spawners[i], spawn_type)
	end
end

local potential_pickups = {}

PickupSystem._spawn_guaranteed_pickup = function (self, spawner_unit, spawn_type)
	table.clear(potential_pickups)

	for pickup_name, settings in pairs(AllPickups) do
		local can_spawn = self:_can_spawn(spawner_unit, pickup_name)

		if can_spawn and settings.spawn_weighting > 0 then
			potential_pickups[#potential_pickups + 1] = pickup_name
		end
	end

	local num_potential_pickups = #potential_pickups

	if num_potential_pickups > 0 then
		local random_index = self:_random(num_potential_pickups)
		local pickup_to_spawn = potential_pickups[random_index]
		local position = Unit.local_position(spawner_unit, 0)
		local rotation = Unit.local_rotation(spawner_unit, 0)
		local settings = AllPickups[pickup_to_spawn]
		local spawned_unit, _ = self:_spawn_pickup(settings, pickup_to_spawn, position, rotation, false, spawn_type)

		return spawned_unit
	end
end

PickupSystem._spawn_specified_pickups = function (self)
	local spawners = self.specified_pickup_spawners
	local num_spawners = #spawners
	local spawn_type = "guaranteed"

	for i = 1, num_spawners, 1 do
		local unit = spawners[i]

		table.clear(potential_pickups)

		for pickup_name, settings in pairs(AllPickups) do
			local can_spawn = self:_can_spawn(unit, pickup_name)

			if can_spawn then
				potential_pickups[#potential_pickups + 1] = pickup_name
			end
		end

		local num_potential_pickups = #potential_pickups

		if num_potential_pickups > 0 then
			local random_index = self:_random(num_potential_pickups)
			local pickup_to_spawn = potential_pickups[random_index]
			local position = Unit.local_position(unit, 0)
			local rotation = Unit.local_rotation(unit, 0)
			local settings = AllPickups[pickup_to_spawn]

			self:_spawn_pickup(settings, pickup_to_spawn, position, rotation, false, spawn_type)
		end
	end
end

PickupSystem.update = function (self, dt, t)
	if self.is_server then
		self:_update_life_time_pickups(dt, t)
		self:_update_teleporting_pickups(dt, t)
	end

	local statistics_db = self._statistics_db
	local update_list = self.update_list

	for i = 1, #extension_update, 1 do
		local extension = extension_update[i]

		Profiler.start(extension)
		self:update_extension(extension, dt, nil, t)
		Profiler.stop(extension)
	end

	for extension_name, _ in pairs(self.extensions) do
		local profiler_name = self.profiler_names[extension_name]

		Profiler.start(profiler_name)

		for _, extension in pairs(update_list[extension_name].update) do
			local hide_func = extension.hide_func

			if not DEDICATED_SERVER and hide_func and hide_func(statistics_db) and not extension.hidden then
				extension:hide()
			end
		end

		Profiler.stop(profiler_name)
	end
end

PickupSystem.get_and_delete_limited_owned_pickup_with_index = function (self, owner_peer_id, index)
	local limited_owned_pickups = self._limited_owned_pickups[owner_peer_id]

	if not limited_owned_pickups then
		return nil
	end

	local pickup_units = limited_owned_pickups.units
	local removed_unit = table.remove(pickup_units, index)
	local unit_spawner = Managers.state.unit_spawner
	local is_alive = removed_unit and Unit.alive(removed_unit)

	if not is_alive or (is_alive and unit_spawner:is_marked_for_deletion(removed_unit)) then
		return nil
	end

	if self.is_server then
		self:_delete_pickup(removed_unit)
	else
		local removed_unit_id = Managers.state.network:game_object_or_level_id(removed_unit)

		Managers.state.network.network_transmit:send_rpc_server("rpc_delete_limited_owned_pickup_unit", owner_peer_id, removed_unit_id)
	end

	return removed_unit
end

PickupSystem.delete_limited_owned_pickup_unit = function (self, owner_peer_id, pickup_unit)
	local limited_owned_pickups = self._limited_owned_pickups[owner_peer_id]

	if not limited_owned_pickups then
		return
	end

	local pickup_units = limited_owned_pickups.units
	local index = table.find(pickup_units, pickup_unit)

	if index then
		table.remove(pickup_units, index)
	end

	local unit_spawner = Managers.state.unit_spawner
	local is_alive = pickup_unit and Unit.alive(pickup_unit)

	if not is_alive or (is_alive and unit_spawner:is_marked_for_deletion(pickup_unit)) then
		return
	end

	if self.is_server then
		self:_delete_pickup(pickup_unit)
	else
		local pickup_unit_id = Managers.state.network:game_object_or_level_id(pickup_unit)

		Managers.state.network.network_transmit:send_rpc_server("rpc_delete_limited_owned_pickup_unit", owner_peer_id, pickup_unit_id)
	end
end

PickupSystem.event_delete_limited_owned_pickups = function (self, peer_id)
	if self.is_server then
		local limited_owned_pickups = self._limited_owned_pickups[peer_id]

		if not limited_owned_pickups then
			return
		end

		local pickup_units = limited_owned_pickups.units

		if pickup_units then
			for _, unit in pairs(pickup_units) do
				self:_delete_pickup(unit)
			end

			table.clear(pickup_units)
		end
	elseif Managers.state.network:in_game_session() then
		self.network_transmit:send_rpc_server("rpc_delete_limited_owned_pickups", peer_id)
	end
end

PickupSystem.delete_limited_owned_pickup_type = function (self, peer_id, type)
	if self.is_server then
		local limited_owned_pickups = self._limited_owned_pickups[peer_id]

		if not limited_owned_pickups then
			return
		end

		local pickup_units = limited_owned_pickups.units
		local units_by_type = self._pickup_units_by_type[type]

		if pickup_units and units_by_type then
			for i = 1, #pickup_units, 1 do
				local unit = pickup_units[i]

				if table.index_of(units_by_type, unit) > 0 then
					self:_delete_pickup(unit)
				end
			end

			table.clear(pickup_units)
		end
	elseif Managers.state.network:in_game_session() then
		local pickup_name_id = NetworkLookup.pickup_names[type]

		self.network_transmit:send_rpc_server("rpc_delete_limited_owned_pickup_type", peer_id, pickup_name_id)
	end
end

PickupSystem._update_life_time_pickups = function (self, dt, t)
	for unit, data in pairs(self._life_time_pickups) do
		if data.life_time < t and data.pickup_settings.on_life_over_func then
			data.pickup_settings.on_life_over_func()

			if Unit.alive(unit) then
				Managers.state.unit_spawner:mark_for_deletion(unit)
			end
		end
	end
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

			self:_teleport_pickup(unit)
		elseif data.next_line_of_sight_check < t then
			data.next_line_of_sight_check = t + TIME_BETWEEN_LINE_OF_SIGHT_CHECKS
			local has_los = self:_check_teleporting_pickup_line_of_sight(unit)

			if has_los then
				data.line_of_sight_fails = 0
			else
				local fails = data.line_of_sight_fails + 1

				if MAX_FAILS < fails then
					data.line_of_sight_fails = 0

					self:_teleport_pickup(unit, data)
				else
					data.line_of_sight_fails = fails
				end
			end
		end
	end
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
end

PickupSystem.destroy = function (self)
	Managers.state.event:unregister("delete_limited_owned_pickups", self)
	self.network_event_delegate:unregister(self)
end

PickupSystem.hot_join_sync = function (self, sender)
	return
end

PickupSystem.spawn_pickup = function (self, pickup_name, position, rotation, with_physics, spawn_type, velocity, override_unit_template_name)
	local pickup_settings = AllPickups[pickup_name]
	local owner_peer_id, spawn_limit = nil
	local pickup_unit, _ = self:_spawn_pickup(pickup_settings, pickup_name, position, rotation, with_physics, spawn_type, owner_peer_id, spawn_limit, velocity, override_unit_template_name)

	return pickup_unit
end

PickupSystem.buff_spawn_pickup = function (self, pickup_name, position, raycast_down)
	if not position then
		return
	end

	if raycast_down then
		local physics_world = World.physics_world(self.world)
		local direction = Vector3.down()
		local length = 40
		local result, new_position, _, _ = PhysicsWorld.immediate_raycast(physics_world, position, direction, length, "closest", "collision_filter", "filter_pickup_collision")

		if result then
			position = new_position
		end
	end

	local rotation = Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360)))
	local with_physics = false
	local spawn_type = "buff"
	local pickup_settings = AllPickups[pickup_name]
	local pickup_unit, _ = self:_spawn_pickup(pickup_settings, pickup_name, position, rotation, with_physics, spawn_type)

	if pickup_unit then
		return pickup_unit
	end
end

PickupSystem._spawn_pickup = function (self, pickup_settings, pickup_name, position, rotation, with_physics, spawn_type, owner_peer_id, spawn_limit, velocity, override_unit_template_name)
	local next_index = self._next_index

	if self._taken[next_index] then
		return
	end

	if not Managers.state.network:in_game_session() then
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
			spawn_index = next_index,
			owner_peer_id = owner_peer_id,
			spawn_limit = spawn_limit
		},
		projectile_locomotion_system = {
			network_position = AiAnimUtils.position_network_scale(position, true),
			network_rotation = AiAnimUtils.rotation_network_scale(rotation, true),
			network_velocity = AiAnimUtils.velocity_network_scale(velocity or Vector3.zero(), true),
			network_angular_velocity = AiAnimUtils.velocity_network_scale(Vector3.zero(), true)
		}
	}
	self._next_index = next_index + 1
	local unit_template_name = override_unit_template_name or pickup_settings.unit_template_name or "pickup_unit"
	local additional_data_func = pickup_settings.additional_data_func

	if additional_data_func then
		local extra_extension_init_data = nil
		extra_extension_init_data = self[additional_data_func](self, pickup_settings, position, rotation)

		table.merge(extension_init_data, extra_extension_init_data)
	end

	local additional_data = pickup_settings.additional_data

	if additional_data then
		table.merge(extension_init_data, additional_data)
	end

	local unit_name = pickup_settings.unit_name
	local pickup_unit, pickup_unit_go_id = Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, position, rotation)

	self:_update_limited_limited_owned_pickups(pickup_settings, pickup_name, position, rotation, with_physics, spawn_type, owner_peer_id)

	return pickup_unit, pickup_unit_go_id
end

PickupSystem._update_limited_limited_owned_pickups = function (self, pickup_settings, pickup_name, position, rotation, with_physics, spawn_type, owner_peer_id)
	local limited_owned_pickups = self._limited_owned_pickups[owner_peer_id]

	if not limited_owned_pickups then
		return
	end

	local spawn_limit = limited_owned_pickups.spawn_limit
	local pickup_units = limited_owned_pickups.units
	local num_pickup_units = #pickup_units

	if spawn_limit < num_pickup_units then
		local index = 1
		local removed_unit = table.remove(pickup_units, index)

		self:_delete_pickup(removed_unit)
	end
end

PickupSystem._can_spawn = function (self, spawner_unit, pickup_name)
	return Unit.get_data(spawner_unit, pickup_name) or Managers.mechanism:can_spawn_pickup(spawner_unit, pickup_name)
end

PickupSystem.rpc_spawn_pickup_with_physics = function (self, channel_id, pickup_name_id, position, rotation, spawn_type_id)
	local pickup_name = NetworkLookup.pickup_names[pickup_name_id]

	fassert(AllPickups[pickup_name], "pickup name %s does not exist in Pickups table", pickup_name)

	local pickup_settings = AllPickups[pickup_name]
	local spawn_type = NetworkLookup.pickup_spawn_types[spawn_type_id]

	self:_spawn_pickup(pickup_settings, pickup_name, position, rotation, true, spawn_type)
end

PickupSystem.rpc_spawn_pickup = function (self, channel_id, pickup_name_id, position, rotation, spawn_type_id)
	local pickup_name = NetworkLookup.pickup_names[pickup_name_id]

	fassert(AllPickups[pickup_name], "pickup name %s does not exist in Pickups table", pickup_name)

	local owner_peer_id = CHANNEL_TO_PEER_ID[channel_id or Network.peer_id()]
	local pickup_settings = AllPickups[pickup_name]
	local spawn_type = NetworkLookup.pickup_spawn_types[spawn_type_id]

	self:_spawn_pickup(pickup_settings, pickup_name, position, rotation, false, spawn_type, owner_peer_id)
end

PickupSystem.rpc_spawn_linked_pickup = function (self, channel_id, pickup_name_id, link_position, link_rotation, spawn_type_id, hit_unit_go_id, node_index, is_level_unit, spawn_limit)
	fassert(self.is_server, "Can only spawn linked pickups on the server!")

	local pickup_name = NetworkLookup.pickup_names[pickup_name_id]
	local spawn_type = NetworkLookup.pickup_spawn_types[spawn_type_id]

	fassert(AllPickups[pickup_name], "pickup name %s does not exist in Pickups table", pickup_name)

	local unit_spawner = Managers.state.unit_spawner
	local hit_unit = Managers.state.network:game_object_or_level_unit(hit_unit_go_id, is_level_unit)
	local link_pickup = false
	local with_physics = true

	if hit_unit and Unit.alive(hit_unit) and not unit_spawner:is_marked_for_deletion(hit_unit) then
		link_pickup = true
		with_physics = false
	end

	local owner_peer_id = CHANNEL_TO_PEER_ID[channel_id or Network.peer_id()]
	local pickup_settings = AllPickups[pickup_name]
	local pickup_unit, pickup_unit_go_id = self:_spawn_pickup(pickup_settings, pickup_name, link_position, link_rotation, with_physics, spawn_type, owner_peer_id, spawn_limit)

	if link_pickup then
		local projectile_linker_system = Managers.state.entity:system("projectile_linker_system")

		projectile_linker_system:link_pickup(pickup_unit, link_position, link_rotation, hit_unit, node_index)
		self._network_manager.network_transmit:send_rpc_clients("rpc_link_pickup", pickup_unit_go_id, link_position, link_rotation, hit_unit_go_id, node_index, is_level_unit)
	end
end

PickupSystem._delete_pickup = function (self, unit)
	local unit_spawner = Managers.state.unit_spawner

	if unit and Unit.alive(unit) and not unit_spawner:is_marked_for_deletion(unit) then
		unit_spawner:mark_for_deletion(unit)
	end
end

PickupSystem.rpc_delete_pickup = function (self, channel_id, unit_id)
	local unit = Managers.state.network:game_object_or_level_unit(unit_id)

	self:_delete_pickup(unit)
end

PickupSystem.rpc_delete_limited_owned_pickup_unit = function (self, channel_id, owner_peer_id, pickup_unit_id)
	local pickup_unit = Managers.state.network:game_object_or_level_unit(pickup_unit_id)

	self:delete_limited_owned_pickup_unit(owner_peer_id, pickup_unit)
end

PickupSystem.rpc_delete_limited_owned_pickups = function (self, channel_id, owner_peer_id)
	self:event_delete_limited_owned_pickups(owner_peer_id)
end

PickupSystem.rpc_delete_limited_owned_pickup_type = function (self, channel_id, owner_peer_id, pickup_name_id)
	local pickup_type = NetworkLookup.pickup_names[pickup_name_id]

	self:delete_limited_owned_pickup_type(owner_peer_id, pickup_type)
end

PickupSystem.rpc_force_use_pickup = function (self, channel_id, pickup_name_id)
	local is_server = Managers.player.is_server

	if is_server then
		local network_transmit = self.network_transmit

		network_transmit:send_rpc_clients("rpc_force_use_pickup", pickup_name_id)
	end

	local player = Managers.player:local_player()

	if not player then
		return
	end

	local player_unit = player.player_unit

	if not player_unit or not Unit.alive(player_unit) then
		return
	end

	if player.bot_player then
		return
	end

	local pickup_name = NetworkLookup.pickup_names[pickup_name_id]
	local pickup_settings = AllPickups[pickup_name]
	local on_pick_up_func = pickup_settings.on_pick_up_func

	if on_pick_up_func then
		local world = Application.main_world()

		on_pick_up_func(world, player_unit, is_server)
	end

	local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local slot_name = pickup_settings.slot_name
	local item_name = pickup_settings.item_name
	local wielded_slot_name = inventory_extension:get_wielded_slot_name()

	if pickup_settings.wield_on_pickup or wielded_slot_name == slot_name then
		CharacterStateHelper.stop_weapon_actions(inventory_extension, "picked_up_object")
		CharacterStateHelper.stop_career_abilities(career_extension, "picked_up_object")
	end

	local slot_data = inventory_extension:get_slot_data(slot_name)
	local item_data = ItemMasterList[item_name]

	if slot_data then
		inventory_extension:drop_level_event_item(slot_data)
	end

	local unit_template = nil
	local extra_extension_init_data = {}

	inventory_extension:add_equipment(slot_name, item_data, unit_template, extra_extension_init_data)

	if pickup_settings.wield_on_pickup or wielded_slot_name == slot_name then
		local action_on_wield = pickup_settings.action_on_wield

		if action_on_wield then
			local item_template = BackendUtils.get_item_template(item_data)
			item_template.next_action = action_on_wield
		end

		inventory_extension:wield(slot_name)
	end
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
	local item_name = "training_dummy"
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
end

return
