require("scripts/unit_extensions/default_player_unit/buffs/buff_templates")
require("scripts/unit_extensions/default_player_unit/buffs/group_buff_templates")
require("scripts/unit_extensions/default_player_unit/buffs/buff_function_templates")
require("scripts/unit_extensions/default_player_unit/buffs/buff_extension")
require("scripts/utils/script_application")

BuffSystem = class(BuffSystem, ExtensionSystemBase)
IGNORED_ITEM_TYPES_FOR_BUFFS = {}
local RPCS = {
	"rpc_add_buff",
	"rpc_add_volume_buff_multiplier",
	"rpc_remove_volume_buff",
	"rpc_add_group_buff",
	"rpc_remove_group_buff",
	"rpc_buff_on_attack",
	"rpc_remove_server_controlled_buff",
	"rpc_proc_event",
	"rpc_remove_gromril_armour"
}
local extensions = {
	"BuffExtension"
}

BuffSystem.init = function (self, entity_system_creation_context, system_name)
	BuffSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.network_manager = entity_system_creation_context.network_manager
	self.unit_extension_data = {}
	self.frozen_unit_extension_data = {}
	self.player_group_buffs = {}
	self.volume_buffs = {}
	self.server_controlled_buffs = {}

	if self.is_server then
		self.next_server_buff_id = 1
		self.free_server_buff_ids = {}
	end

	self.active_buff_units = {}
	self._activated_buff_units_during_update = {}
end

BuffSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local buff_extension = BuffSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
	self.unit_extension_data[unit] = buff_extension

	return buff_extension
end

BuffSystem.hot_join_sync = function (self, sender)
	if self.is_server then
		local num_group_buffs = #self.player_group_buffs
		local network_manager = self.network_manager
		local network_transmit = network_manager.network_transmit

		for i = 1, num_group_buffs, 1 do
			local group_buff_data = self.player_group_buffs[i]
			local group_buff_template_name = group_buff_data.group_buff_template_name
			local group_buff_template_id = NetworkLookup.group_buff_templates[group_buff_template_name]

			network_transmit:send_rpc("rpc_add_group_buff", sender, group_buff_template_id, 1)
		end

		for unit, data in pairs(self.server_controlled_buffs) do
			for server_buff_id, buff_data in pairs(data) do
				local template_name = buff_data.template_name
				local attacker_unit = buff_data.attacker_unit
				local unit_object_id = network_manager:unit_game_object_id(unit)
				local buff_template_name_id = NetworkLookup.buff_templates[template_name]
				local attacker_unit_object_id = network_manager:unit_game_object_id(attacker_unit) or NetworkConstants.invalid_game_object_id

				network_transmit:send_rpc("rpc_add_buff", sender, unit_object_id, buff_template_name_id, attacker_unit_object_id, server_buff_id, false)
			end
		end
	end
end

BuffSystem._clean_up_server_controller_buffs = function (self, unit)
	local unit_data = self.server_controlled_buffs[unit]

	if unit_data then
		for server_buff_id, _ in pairs(unit_data) do
			unit_data[server_buff_id] = nil

			if self.is_server then
				self.free_server_buff_ids[#self.free_server_buff_ids + 1] = server_buff_id
			end
		end

		self.server_controlled_buffs[unit] = nil

		Managers.state.event:trigger("on_clean_up_server_controlled_buffs", unit)
	end
end

BuffSystem.on_remove_extension = function (self, unit, extension_name)
	self.frozen_unit_extension_data[unit] = nil
	self.unit_extension_data[unit] = nil
	self.active_buff_units[unit] = nil

	self:_clean_up_server_controller_buffs(unit)
	BuffSystem.super.on_remove_extension(self, unit, extension_name)
end

BuffSystem.on_freeze_extension = function (self, unit, extension_name)
	return
end

BuffSystem.freeze = function (self, unit, extension_name, reason)
	local frozen_extensions = self.frozen_unit_extension_data

	if frozen_extensions[unit] then
		return
	end

	local extension = self.unit_extension_data[unit]

	fassert(extension, "Unit to freeze didn't have unfrozen extension")

	self.unit_extension_data[unit] = nil
	frozen_extensions[unit] = extension

	extension:freeze()
	self:_clean_up_server_controller_buffs(unit)
	fassert(self.active_buff_units[unit] == nil, "Unit had active buffs after freeze!")
end

BuffSystem.unfreeze = function (self, unit)
	local extension = self.frozen_unit_extension_data[unit]

	fassert(extension, "Unit to unfreeze didn't have frozen extension")

	self.frozen_unit_extension_data[unit] = nil
	self.unit_extension_data[unit] = extension
end

local dummy_input = {}

BuffSystem.update = function (self, context, t)
	if not script_data.buff_no_opt then
		local dt = context.dt
		local active_buff_units = self.active_buff_units
		self.in_update = true

		for unit, _ in pairs(active_buff_units) do
			local extension = active_buff_units[unit]

			assert(#extension._buffs > 0, "Unit was active but didn't have buffs")
			extension:update(unit, dummy_input, dt, context, t)
		end

		for unit, extension in pairs(self._activated_buff_units_during_update) do
			active_buff_units[unit] = extension
		end

		table.clear(self._activated_buff_units_during_update)

		self.in_update = false
	else
		BuffSystem.super.update(self, context, t)
	end
end

BuffSystem.get_player_group_buffs = function (self)
	return self.player_group_buffs
end

BuffSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
	self.unit_extension_data = nil
	self.active_buff_units = nil
end

BuffSystem._next_free_server_buff_id = function (self)
	local free_buff_ids = self.free_server_buff_ids
	local free_buff_ids_size = #free_buff_ids
	local free_buff_id = nil

	if free_buff_ids_size > 0 then
		free_buff_id = free_buff_ids[free_buff_ids_size]
		free_buff_ids[free_buff_ids_size] = nil
	else
		free_buff_id = self.next_server_buff_id
		self.next_server_buff_id = self.next_server_buff_id + 1
	end

	fassert(free_buff_id <= NetworkConstants.server_controlled_buff_id.max, "[BuffSystem] ERROR! Too many server controlled buffs! (%d/%d)", free_buff_id, NetworkConstants.server_controlled_buff_id.max)

	return free_buff_id
end

local params = {}

BuffSystem._add_buff_helper_function = function (self, unit, template_name, attacker_unit, server_buff_id, power_level, source_attacker_unit)
	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	params.attacker_unit = attacker_unit
	params.power_level = power_level
	params.source_attacker_unit = source_attacker_unit

	if server_buff_id > 0 then
		if not self.server_controlled_buffs[unit] then
			self.server_controlled_buffs[unit] = {}
		end

		local buff_template = BuffTemplates[template_name]
		local buffs = buff_template.buffs

		for i = 1, #buffs, 1 do
			local sub_buff = buffs[i]

			fassert(sub_buff.duration == nil, "[BuffSystem] Error! Cannot use duration for server controlled buffs! (template = %s) Use a normal buff if it should have a duration!", template_name)
		end

		if not self.server_controlled_buffs[unit][server_buff_id] then
			local local_buff_id = buff_extension:add_buff(template_name, params)
			self.server_controlled_buffs[unit][server_buff_id] = {
				local_buff_id = local_buff_id,
				template_name = template_name,
				attacker_unit = attacker_unit,
				source_attacker_unit = source_attacker_unit
			}
		end
	else
		buff_extension:add_buff(template_name, params)
	end
end

BuffSystem.add_buff = function (self, unit, template_name, attacker_unit, is_server_controlled, power_level, source_attacker_unit)
	if not ScriptUnit.has_extension(unit, "buff_system") then
		return
	end

	fassert(self.is_server or not is_server_controlled, "[BuffSystem]: Trying to add a server controlled buff from a client!")

	local server_buff_id = (is_server_controlled and self:_next_free_server_buff_id()) or 0

	if ScriptUnit.has_extension(unit, "buff_system") then
		self:_add_buff_helper_function(unit, template_name, attacker_unit, server_buff_id, power_level, source_attacker_unit)
	end

	local network_manager = self.network_manager
	local unit_object_id = network_manager:game_object_or_level_id(unit)
	local attacker_unit_object_id = network_manager:game_object_or_level_id(attacker_unit)
	local buff_template_name_id = NetworkLookup.buff_templates[template_name]

	if self.is_server then
		network_manager.network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, attacker_unit_object_id, server_buff_id, false)
	else
		network_manager.network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, attacker_unit_object_id, 0, false)
	end

	return server_buff_id
end

BuffSystem.remove_server_controlled_buff = function (self, unit, server_buff_id)
	fassert(self.is_server, "[BuffSystem]: Only the server can explicitly remove server controlled buffs!")

	local num_buffs_removed = 0

	if unit and server_buff_id then
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local server_buffs = self.server_controlled_buffs
		local unit_server_buffs = server_buffs and server_buffs[unit]

		if unit_server_buffs then
			local unit_server_buff_table = unit_server_buffs[server_buff_id]
			local id = unit_server_buff_table and unit_server_buff_table.local_buff_id
			num_buffs_removed = id and buff_extension:remove_buff(id)
			unit_server_buffs[server_buff_id] = nil
		end

		self.free_server_buff_ids[#self.free_server_buff_ids + 1] = server_buff_id
		local network_manager = self.network_manager
		local unit_object_id = network_manager:game_object_or_level_id(unit)

		network_manager.network_transmit:send_rpc_clients("rpc_remove_server_controlled_buff", unit_object_id, server_buff_id)
	end

	return num_buffs_removed
end

BuffSystem.has_server_controlled_buff = function (self, unit, server_buff_id)
	fassert(self.is_server, "[BuffSystem]: Only the server can explicitly can check server controlled buffs!")

	return self.server_controlled_buffs[unit] and self.server_controlled_buffs[unit][server_buff_id]
end

BuffSystem.add_volume_buff_multiplier = function (self, unit, buff_template_name, multiplier)
	fassert(self.is_server, "[BuffSystem] add_volume_buff_multiplier should only be called on server!")

	local owner = Managers.player:unit_owner(unit)

	if owner.remote then
		local network_manager = Managers.state.network
		local unit_object_id = network_manager:unit_game_object_id(unit)
		local buff_template_name_id = NetworkLookup.buff_templates.movement_volume_generic_slowdown

		network_manager.network_transmit:send_rpc("rpc_add_volume_buff_multiplier", owner.peer_id, unit_object_id, buff_template_name_id, multiplier)
	else
		self:add_volume_buff(unit, buff_template_name, multiplier)
	end
end

BuffSystem.add_volume_buff = function (self, unit, buff_template_name, multiplier)
	if not Unit.alive(unit) then
		return
	end

	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local params = {
		external_optional_multiplier = multiplier
	}

	if not self.volume_buffs[unit] then
		self.volume_buffs[unit] = {}
	end

	if not self.volume_buffs[unit][buff_template_name] then
		self.volume_buffs[unit][buff_template_name] = buff_extension:add_buff(buff_template_name, params)
	end
end

BuffSystem.remove_volume_buff_multiplier = function (self, unit, buff_template_name)
	fassert(self.is_server, "[BuffSystem] remove_volume_buff should only be called on server!")

	local owner = Managers.player:unit_owner(unit)

	if owner.remote then
		local network_manager = Managers.state.network
		local unit_object_id = network_manager:unit_game_object_id(unit)
		local buff_template_name_id = NetworkLookup.buff_templates.movement_volume_generic_slowdown

		network_manager.network_transmit:send_rpc("rpc_remove_volume_buff", owner.peer_id, unit_object_id, buff_template_name_id)
	else
		self:remove_volume_buff(unit, buff_template_name)
	end
end

BuffSystem.remove_volume_buff = function (self, unit, buff_template_name)
	if not Unit.alive(unit) then
		return
	end

	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local id = self.volume_buffs[unit][buff_template_name]

	buff_extension:remove_buff(id)

	self.volume_buffs[unit][buff_template_name] = nil
end

BuffSystem.rpc_add_buff = function (self, sender, unit_id, buff_template_name_id, attacker_unit_id, server_buff_id, send_to_sender)
	if self.is_server then
		if send_to_sender then
			self.network_manager.network_transmit:send_rpc_clients("rpc_add_buff", unit_id, buff_template_name_id, attacker_unit_id, 0, false)
		else
			self.network_manager.network_transmit:send_rpc_clients_except("rpc_add_buff", sender, unit_id, buff_template_name_id, attacker_unit_id, 0, false)
		end
	end

	local unit = self.unit_storage:unit(unit_id)
	local attacker_unit = self.unit_storage:unit(attacker_unit_id)
	local buff_template_name = NetworkLookup.buff_templates[buff_template_name_id]

	if ScriptUnit.has_extension(unit, "buff_system") then
		self:_add_buff_helper_function(unit, buff_template_name, attacker_unit, server_buff_id)
	end
end

BuffSystem.rpc_remove_server_controlled_buff = function (self, sender, unit_id, server_buff_id)
	local unit = self.unit_storage:unit(unit_id)

	if Unit.alive(unit) then
		local unit_buffs = self.server_controlled_buffs[unit]
		local buff = unit_buffs and unit_buffs[server_buff_id]

		if buff then
			local id = buff.local_buff_id

			if id then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				buff_extension:remove_buff(id)
			end

			self.server_controlled_buffs[unit][server_buff_id] = nil
		end
	end
end

BuffSystem.rpc_add_volume_buff_multiplier = function (self, sender, unit_id, buff_template_name_id, multiplier)
	local unit = self.unit_storage:unit(unit_id)
	local buff_template_name = NetworkLookup.buff_templates[buff_template_name_id]

	self:add_volume_buff(unit, buff_template_name, multiplier)
end

BuffSystem.rpc_remove_volume_buff = function (self, sender, unit_id, buff_template_name_id)
	local unit = self.unit_storage:unit(unit_id)
	local buff_template_name = NetworkLookup.buff_templates[buff_template_name_id]

	self:remove_volume_buff(unit, buff_template_name)
end

BuffSystem.rpc_add_group_buff = function (self, sender, group_buff_template_id, num_instances)
	if self.is_server then
		self.network_manager.network_transmit:send_rpc_clients("rpc_add_group_buff", group_buff_template_id, num_instances)
	end

	local group_buff_template_name = NetworkLookup.group_buff_templates[group_buff_template_id]
	local group_buff = GroupBuffTemplates[group_buff_template_name]
	local buff_per_instance = group_buff.buff_per_instance
	local buff_side_name = group_buff.side_name
	local side = Managers.state.side:get_side_from_name(buff_side_name)
	local player_units = side:player_units()

	for i = 1, num_instances, 1 do
		local group_buff_data = {
			group_buff_template_name = group_buff_template_name,
			recipients = {}
		}

		for _, unit in ipairs(player_units) do
			if Unit.alive(unit) then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				local id = buff_extension:add_buff(buff_per_instance)
				local recipients = group_buff_data.recipients
				recipients[unit] = id
			end
		end

		self.player_group_buffs[#self.player_group_buffs + 1] = group_buff_data
	end
end

BuffSystem.rpc_remove_group_buff = function (self, sender, group_buff_template_id, num_instances)
	local group_buff_template_name = NetworkLookup.group_buff_templates[group_buff_template_id]
	local group_buffs = self.player_group_buffs

	for i = 1, num_instances, 1 do
		local num_group_buffs = #group_buffs
		local group_buff_data, index_to_remove = nil

		for j = 1, num_group_buffs, 1 do
			group_buff_data = group_buffs[j]

			if group_buff_data.group_buff_template_name == group_buff_template_name then
				index_to_remove = j

				break
			end
		end

		fassert(index_to_remove, "trying to remove a player group buff that isn't currently applied")
		table.remove(group_buffs, index_to_remove)

		if self.is_server then
			self.network_manager.network_transmit:send_rpc_clients("rpc_remove_group_buff", group_buff_template_id, num_instances)
		end

		local recipients = group_buff_data.recipients

		for unit, id in pairs(recipients) do
			if Unit.alive(unit) then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				buff_extension:remove_buff(id)
			end
		end
	end
end

BuffSystem.rpc_buff_on_attack = function (self, sender, attacking_unit_id, hit_unit_id, attack_type_id, is_critical, hit_zone_id, target_number, buff_type_id)
	local hit_unit = self.unit_storage:unit(hit_unit_id)
	local attacking_unit = self.unit_storage:unit(attacking_unit_id)
	local attack_type = NetworkLookup.buff_attack_types[attack_type_id]
	local hit_zone_name = NetworkLookup.hit_zones[hit_zone_id]
	local buff_weapon_type = NetworkLookup.buff_weapon_types[buff_type_id]

	if not Unit.alive(attacking_unit) then
		return
	end

	local send_to_server = false

	DamageUtils.buff_on_attack(attacking_unit, hit_unit, attack_type, is_critical, hit_zone_name, target_number, send_to_server, buff_weapon_type)
end

BuffSystem.rpc_proc_event = function (self, sender, peer_id, local_player_id, event_id)
	local player = Managers.player:player(peer_id, local_player_id)
	local event = NetworkLookup.proc_events[event_id]
	local player_unit = player.player_unit
	local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

	if buff_extension then
		buff_extension:trigger_procs(event)
	end
end

BuffSystem.rpc_remove_gromril_armour = function (self, sender, unit_id)
	local unit = self.unit_storage:unit(unit_id)

	if not Unit.alive(unit) then
		return
	end

	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local has_gromril_armour = buff_extension:has_buff_type("bardin_ironbreaker_gromril_armour")

	if has_gromril_armour then
		local buff = buff_extension:get_non_stacking_buff("bardin_ironbreaker_gromril_armour")
		local id = buff.id

		buff_extension:remove_buff(id)
	end

	buff_extension:trigger_procs("on_gromril_armour_removed")
end

BuffSystem.set_buff_ext_active = function (self, unit, is_active)
	if is_active then
		if self.in_update then
			self._activated_buff_units_during_update[unit] = self.unit_extension_data[unit]
		else
			self.active_buff_units[unit] = self.unit_extension_data[unit]
		end
	else
		self.active_buff_units[unit] = nil
	end
end

return
