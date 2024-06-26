﻿-- chunkname: @scripts/entity_system/systems/doors/door_system.lua

require("scripts/unit_extensions/level/door_extension")
require("scripts/unit_extensions/level/simple_door_extension")
require("scripts/unit_extensions/level/boss_door_extension")
require("scripts/unit_extensions/level/big_boy_destructible_extension")
require("scripts/unit_extensions/level/crawl_space_extension")

DoorSystem = class(DoorSystem, ExtensionSystemBase)

local RPCS = {
	"rpc_sync_door_state",
	"rpc_sync_boss_door_state",
}
local extensions = {
	"DoorExtension",
	"SimpleDoorExtension",
	"BossDoorExtension",
	"BigBoyDestructibleExtension",
	"CrawlSpaceExtension",
}

DoorSystem.init = function (self, entity_system_creation_context, system_name)
	DoorSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate

	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.unit_extension_data = {}
	self._broadphase = Broadphase(127, 1.5)
	self._boss_doors = {}
	self._active_groups = {}
	self._crawl_space_tunnels = {}
	self._crawl_space_spawners = {}
end

DoorSystem.on_add_extension = function (self, world, unit, extension_name, ...)
	local door_extension = DoorSystem.super.on_add_extension(self, world, unit, extension_name)

	self.unit_extension_data[unit] = door_extension

	local position = Unit.world_position(unit, 0)

	if extension_name ~= "CrawlSpaceExtension" then
		door_extension.__broadphase_id = Broadphase.add(self._broadphase, unit, position, 0.5)
	end

	if extension_name == "BossDoorExtension" then
		local boss_doors = self._boss_doors

		for i = 0, 2 do
			repeat
				local map_section = Unit.get_data(unit, "map_sections", i)

				if not map_section or map_section == 0 then
					break
				end

				if not boss_doors[map_section] then
					boss_doors[map_section] = {}
				end

				local boss_doors_in_section = boss_doors[map_section]

				boss_doors_in_section[#boss_doors_in_section + 1] = unit
			until true
		end
	end

	if extension_name == "CrawlSpaceExtension" then
		local crawl_space_id = Unit.get_data(unit, "crawl_space_id")

		if crawl_space_id == 0 then
			self._crawl_space_spawners[#self._crawl_space_spawners + 1] = door_extension
		elseif self._crawl_space_tunnels[crawl_space_id] then
			door_extension.partner_unit = self._crawl_space_tunnels[crawl_space_id].unit
			self._crawl_space_tunnels[crawl_space_id].partner_unit = unit
		else
			self._crawl_space_tunnels[crawl_space_id] = door_extension
		end
	end

	return door_extension
end

DoorSystem.extensions_ready = function (self, world, unit, extension_name)
	if extension_name == "CrawlSpaceExtension" then
		self._crawl_spaces_ready = true
	end
end

local sections_to_open = {}

DoorSystem.update = function (self, context, t)
	DoorSystem.super.update(self, context, t)

	if self.is_server then
		table.clear(sections_to_open)

		local active_groups = self._active_groups
		local ai_group_system = Managers.state.entity:system("ai_group_system")

		for map_section, groups in pairs(active_groups) do
			local open_map_section = false

			for i = 1, #groups do
				local data = groups[i]
				local group_id = data.group_id
				local active = data.active
				local group = ai_group_system:get_ai_group(group_id)

				if group and not active then
					data.active = true
				elseif active and not group then
					open_map_section = true
				elseif active and group then
					local members = group.members
					local should_open = true

					for unit, extension in pairs(members) do
						if HEALTH_ALIVE[unit] then
							local blackboard = BLACKBOARDS[unit]
							local breed = blackboard.breed
							local is_boss = breed and breed.boss

							if is_boss then
								local health_extension = ScriptUnit.has_extension(unit, "health_system")
								local last_damage_taken_t = health_extension:last_damage_t() or t
								local last_damage_interval = 60
								local not_damaged = t > last_damage_taken_t + last_damage_interval
								local navigation_extension = blackboard.navigation_extension
								local path_found = navigation_extension and navigation_extension:is_following_path()

								if not_damaged and not path_found then
									should_open = true
								else
									should_open = false

									break
								end
							else
								should_open = false

								break
							end
						end
					end

					if should_open then
						open_map_section = true
					end
				end
			end

			if open_map_section then
				sections_to_open[#sections_to_open + 1] = map_section
			end
		end

		for i = 1, #sections_to_open do
			local map_section = sections_to_open[i]

			self:open_boss_doors(map_section)

			self._active_groups[map_section] = nil
		end
	end
end

DoorSystem.get_doors = function (self, position, radius, result)
	return Broadphase.query(self._broadphase, position, radius, result)
end

DoorSystem.get_boss_door_units = function (self)
	local boss_doors = self._boss_doors
	local boss_door_units = {}

	for map_section, map_section_door_units in pairs(boss_doors) do
		for i = 1, #map_section_door_units do
			local boss_door_unit = map_section_door_units[i]

			boss_door_units[#boss_door_units + 1] = boss_door_unit
		end
	end

	return boss_door_units
end

DoorSystem.on_remove_extension = function (self, unit, extension_name)
	DoorSystem.super.on_remove_extension(self, unit, extension_name)

	local extension = self.unit_extension_data[unit]

	if extension_name ~= "CrawlSpaceExtension" then
		Broadphase.remove(self._broadphase, extension.__broadphase_id)
	end

	self.unit_extension_data[unit] = nil
end

DoorSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
	self.unit_extension_data = nil
	self._broadphase = nil
end

DoorSystem.close_boss_doors = function (self, map_section, group_id, breed_name)
	local boss_doors = self._boss_doors[map_section]
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit

	if boss_doors then
		for i = 1, #boss_doors do
			local boss_door_unit = boss_doors[i]
			local extension = ScriptUnit.extension(boss_door_unit, "door_system")

			extension:set_door_state("closed", breed_name)

			local level = LevelHelper:current_level(self.world)
			local level_index = Level.unit_index(level, boss_door_unit)
			local door_state_id = NetworkLookup.door_states.closed
			local breed_id = breed_name and NetworkLookup.breeds[breed_name] or NetworkLookup.breeds["n/a"]

			network_transmit:send_rpc_clients("rpc_sync_boss_door_state", level_index, door_state_id, breed_id)
		end

		if not self._active_groups[map_section] then
			self._active_groups[map_section] = {}
		end

		local active_groups_in_section = self._active_groups[map_section]

		active_groups_in_section[#active_groups_in_section + 1] = {
			active = false,
			group_id = group_id,
		}
	end
end

DoorSystem.open_boss_doors = function (self, map_section)
	local boss_doors = self._boss_doors[map_section]
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit

	for i = 1, #boss_doors do
		local boss_door_unit = boss_doors[i]
		local extension = ScriptUnit.extension(boss_door_unit, "door_system")

		extension:set_door_state("open")

		local level = LevelHelper:current_level(self.world)
		local level_index = Level.unit_index(level, boss_door_unit)
		local door_state_id = NetworkLookup.door_states.open
		local breed_id = NetworkLookup.breeds["n/a"]

		network_transmit:send_rpc_clients("rpc_sync_boss_door_state", level_index, door_state_id, breed_id)
	end
end

DoorSystem.get_boss_door_units = function (self)
	local boss_door_units = {}

	for map_section, boss_doors in pairs(self._boss_doors) do
		for i = 1, #boss_doors do
			local boss_door_unit = boss_doors[i]

			boss_door_units[#boss_door_units + 1] = boss_door_unit
		end
	end

	return boss_door_units
end

DoorSystem.get_crawl_space_tunnel_units = function (self, disabled_too)
	if not self._crawl_spaces_ready then
		return
	end

	local crawl_space_units = {}

	for _, crawl_space in pairs(self._crawl_space_tunnels) do
		local unit = crawl_space.unit
		local partner_unit = crawl_space.partner_unit
		local interactable_extension = ScriptUnit.extension(unit, "interactable_system")
		local interactable_partner_extension = ScriptUnit.has_extension(partner_unit, "interactable_system")

		if interactable_extension:is_enabled() or disabled_too then
			crawl_space_units[#crawl_space_units + 1] = unit
		end

		if partner_unit and (interactable_partner_extension:is_enabled() or disabled_too) then
			crawl_space_units[#crawl_space_units + 1] = partner_unit
		end
	end

	return crawl_space_units
end

DoorSystem.get_crawl_space_spawner_units = function (self)
	if not self._crawl_spaces_ready then
		return
	end

	local crawl_space_units = {}

	for _, crawl_space in pairs(self._crawl_space_spawners) do
		crawl_space_units[#crawl_space_units + 1] = crawl_space.unit
	end

	return crawl_space_units
end

DoorSystem.rpc_sync_door_state = function (self, channel_id, level_object_id, door_state_id)
	local level = LevelHelper:current_level(self.world)
	local door_unit = Level.unit_by_index(level, level_object_id)
	local door_extension = ScriptUnit.has_extension(door_unit, "door_system")

	if door_extension then
		local new_state = NetworkLookup.door_states[door_state_id]

		door_extension:set_door_state(new_state)
	else
		Application.warning(string.format("[DoorSystem:rpc_sync_door_state] The synced level_object_id (%s) doesn't correspond to a unit with a 'door_system' extension. Unit: %s", level_object_id, tostring(door_unit)))
	end
end

DoorSystem.rpc_sync_boss_door_state = function (self, channel_id, level_object_id, door_state_id, breed_id)
	local level = LevelHelper:current_level(self.world)
	local door_unit = Level.unit_by_index(level, level_object_id)
	local door_extension = ScriptUnit.has_extension(door_unit, "door_system")

	if door_extension then
		local new_state = NetworkLookup.door_states[door_state_id]
		local breed_name = NetworkLookup.breeds[breed_id]

		door_extension:set_door_state(new_state, breed_name)
	else
		Application.warning(string.format("[DoorSystem:rpc_sync_boss_door_state] The synced level_object_id (%s) doesn't correspond to a unit with a 'door_system' extension. Unit: %s", level_object_id, tostring(door_unit)))
	end
end
