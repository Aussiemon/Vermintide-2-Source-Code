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

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self.network_manager = entity_system_creation_context.network_manager
	self.unit_extension_data = {}
	self.player_group_buffs = {}
	self.volume_buffs = {}
	self.server_controlled_buffs = {}

	if self.is_server then
		self.next_server_buff_id = 1
		self.free_server_buff_ids = {}
	end

	return 
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

			network_transmit.send_rpc(network_transmit, "rpc_add_group_buff", sender, group_buff_template_id, 1)
		end

		for unit, data in pairs(self.server_controlled_buffs) do
			for server_buff_id, buff_data in pairs(data) do
				local template_name = buff_data.template_name
				local attacker_unit = buff_data.attacker_unit
				local unit_object_id = network_manager.unit_game_object_id(network_manager, unit)
				local buff_template_name_id = NetworkLookup.buff_templates[template_name]
				local attacker_unit_object_id = network_manager.unit_game_object_id(network_manager, attacker_unit) or NetworkConstants.invalid_game_object_id

				network_transmit.send_rpc(network_transmit, "rpc_add_buff", sender, unit_object_id, buff_template_name_id, attacker_unit_object_id, server_buff_id, false)
			end
		end
	end

	return 
end
BuffSystem.on_remove_extension = function (self, unit, extension_name)
	self.on_freeze_extension(self, unit, extension_name)

	local unit_data = self.server_controlled_buffs[unit]

	if unit_data then
		for server_buff_id, _ in pairs(unit_data) do
			unit_data[server_buff_id] = nil

			if self.is_server then
				self.free_server_buff_ids[#self.free_server_buff_ids + 1] = server_buff_id
			end
		end

		self.server_controlled_buffs[unit] = nil
	end

	BuffSystem.super.on_remove_extension(self, unit, extension_name)

	return 
end
BuffSystem.on_freeze_extension = function (self, unit, extension_name)
	self.unit_extension_data[unit] = nil

	return 
end
BuffSystem.update = function (self, context, t)
	BuffSystem.super.update(self, context, t)
	self._update_debug(self, t)

	return 
end
BuffSystem.get_player_group_buffs = function (self)
	return self.player_group_buffs
end
BuffSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
	self.unit_extension_data = nil

	return 
end
BuffSystem._next_free_server_buff_id = function (self)
	local free_buff_id = nil
	local free_buff_ids = self.free_server_buff_ids
	local free_buff_ids_size = #free_buff_ids

	if 0 < free_buff_ids_size then
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
BuffSystem._add_buff_helper_function = function (self, unit, template_name, attacker_unit, server_buff_id)
	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	params.attacker_unit = attacker_unit

	if 0 < server_buff_id then
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
			local local_buff_id = buff_extension.add_buff(buff_extension, template_name, params)
			self.server_controlled_buffs[unit][server_buff_id] = {
				local_buff_id = local_buff_id,
				template_name = template_name,
				attacker_unit = attacker_unit
			}
		end
	else
		buff_extension.add_buff(buff_extension, template_name, params)
	end

	return 
end
BuffSystem.add_buff = function (self, unit, template_name, attacker_unit, is_server_controlled)
	if not ScriptUnit.has_extension(unit, "buff_system") then
		return 
	end

	fassert(self.is_server or not is_server_controlled, "[BuffSystem]: Trying to add a server controlled buff from a client!")

	local server_buff_id = (is_server_controlled and self._next_free_server_buff_id(self)) or 0

	if ScriptUnit.has_extension(unit, "buff_system") then
		self._add_buff_helper_function(self, unit, template_name, attacker_unit, server_buff_id)
	end

	local network_manager = self.network_manager
	local unit_object_id = network_manager.game_object_or_level_id(network_manager, unit)
	local attacker_unit_object_id = network_manager.game_object_or_level_id(network_manager, attacker_unit)
	local buff_template_name_id = NetworkLookup.buff_templates[template_name]

	if self.is_server then
		network_manager.network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, attacker_unit_object_id, server_buff_id, false)
	else
		network_manager.network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, attacker_unit_object_id, 0, false)
	end

	return server_buff_id
end
BuffSystem.remove_server_controlled_buff = function (self, unit, server_buff_id, debug_print)
	fassert(self.is_server, "[BuffSystem]: Only the server can explicitly remove buffs!")

	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local id = self.server_controlled_buffs[unit][server_buff_id].local_buff_id
	local num_buffs_removed = buff_extension.remove_buff(buff_extension, id, debug_print)
	self.server_controlled_buffs[unit][server_buff_id] = nil
	self.free_server_buff_ids[#self.free_server_buff_ids + 1] = server_buff_id
	local network_manager = self.network_manager
	local unit_object_id = network_manager.game_object_or_level_id(network_manager, unit)

	network_manager.network_transmit:send_rpc_clients("rpc_remove_server_controlled_buff", unit_object_id, server_buff_id)

	return num_buffs_removed
end
BuffSystem.add_volume_buff_multiplier = function (self, unit, buff_template_name, multiplier)
	fassert(self.is_server, "[BuffSystem] add_volume_buff_multiplier should only be called on server!")

	local owner = Managers.player:unit_owner(unit)

	if owner.remote then
		local network_manager = Managers.state.network
		local unit_object_id = network_manager.unit_game_object_id(network_manager, unit)
		local buff_template_name_id = NetworkLookup.buff_templates.movement_volume_generic_slowdown

		network_manager.network_transmit:send_rpc("rpc_add_volume_buff_multiplier", owner.peer_id, unit_object_id, buff_template_name_id, multiplier)
	else
		self.add_volume_buff(self, unit, buff_template_name, multiplier)
	end

	return 
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
		self.volume_buffs[unit][buff_template_name] = buff_extension.add_buff(buff_extension, buff_template_name, params)
	end

	return 
end
BuffSystem.remove_volume_buff_multiplier = function (self, unit, buff_template_name)
	fassert(self.is_server, "[BuffSystem] remove_volume_buff should only be called on server!")

	local owner = Managers.player:unit_owner(unit)

	if owner.remote then
		local network_manager = Managers.state.network
		local unit_object_id = network_manager.unit_game_object_id(network_manager, unit)
		local buff_template_name_id = NetworkLookup.buff_templates.movement_volume_generic_slowdown

		network_manager.network_transmit:send_rpc("rpc_remove_volume_buff", owner.peer_id, unit_object_id, buff_template_name_id)
	else
		self.remove_volume_buff(self, unit, buff_template_name)
	end

	return 
end
BuffSystem.remove_volume_buff = function (self, unit, buff_template_name)
	if not Unit.alive(unit) then
		return 
	end

	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local id = self.volume_buffs[unit][buff_template_name]

	buff_extension.remove_buff(buff_extension, id)

	self.volume_buffs[unit][buff_template_name] = nil

	return 
end
BuffSystem._update_debug = function (self, t)
	if self.is_server and script_data.debug_server_controlled_buffs then
		local num_free_buffs = #self.free_server_buff_ids
		local next_server_buff_id = self.next_server_buff_id

		Debug.text("NUM SERVER CONTROLLED BUFFS: %d", next_server_buff_id - num_free_buffs - 1)
	end

	if script_data.debug_legendary_traits then
		local human_players = Managers.player:human_players()
		local offset_vector = Vector3(0, 0, 0.5)
		local color = Vector3(0, 0, 255)
		local viewport_name = "player_1"

		if Managers.state.camera:has_viewport("player_1") then
			for _, player in pairs(human_players) do
				local unit = player.player_unit
				local health_extension = ScriptUnit.has_extension(unit, "health_system")
				local has_shield = health_extension and health_extension.has_assist_shield(health_extension)

				if has_shield then
					local head_node = Unit.node(unit, "c_head")
					local text = string.format("has shield")

					Managers.state.debug_text:clear_unit_text(unit, "has_shield")
					Managers.state.debug_text:output_unit_text(text, 0.3, unit, head_node, offset_vector, nil, "has_shield", color, viewport_name)
				else
					Managers.state.debug_text:clear_unit_text(unit, "has_shield")
				end
			end
		end
	end

	return 
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
		self._add_buff_helper_function(self, unit, buff_template_name, attacker_unit, server_buff_id)
	end

	return 
end
BuffSystem.rpc_remove_server_controlled_buff = function (self, sender, unit_id, server_buff_id)
	local unit = self.unit_storage:unit(unit_id)

	if Unit.alive(unit) then
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local id = self.server_controlled_buffs[unit][server_buff_id].local_buff_id

		buff_extension.remove_buff(buff_extension, id)

		self.server_controlled_buffs[unit][server_buff_id] = nil
	end

	return 
end
BuffSystem.rpc_add_volume_buff_multiplier = function (self, sender, unit_id, buff_template_name_id, multiplier)
	local unit = self.unit_storage:unit(unit_id)
	local buff_template_name = NetworkLookup.buff_templates[buff_template_name_id]

	self.add_volume_buff(self, unit, buff_template_name, multiplier)

	return 
end
BuffSystem.rpc_remove_volume_buff = function (self, sender, unit_id, buff_template_name_id)
	local unit = self.unit_storage:unit(unit_id)
	local buff_template_name = NetworkLookup.buff_templates[buff_template_name_id]

	self.remove_volume_buff(self, unit, buff_template_name)

	return 
end
BuffSystem.rpc_add_group_buff = function (self, sender, group_buff_template_id, num_instances)
	local group_buff_template_name = NetworkLookup.group_buff_templates[group_buff_template_id]
	local group_buff = GroupBuffTemplates[group_buff_template_name]
	local buff_per_instance = group_buff.buff_per_instance

	if self.is_server then
		self.network_manager.network_transmit:send_rpc_clients("rpc_add_group_buff", group_buff_template_id, num_instances)
	end

	local players = Managers.player:human_and_bot_players()

	for i = 1, num_instances, 1 do
		local group_buff_data = {
			group_buff_template_name = group_buff_template_name,
			recipients = {}
		}

		for _, player in pairs(players) do
			local unit = player.player_unit

			if Unit.alive(unit) then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				local id = buff_extension.add_buff(buff_extension, buff_per_instance)
				local recipients = group_buff_data.recipients
				recipients[unit] = id
			end
		end

		self.player_group_buffs[#self.player_group_buffs + 1] = group_buff_data
	end

	return 
end
BuffSystem.rpc_remove_group_buff = function (self, sender, group_buff_template_id, num_instances)
	local group_buff_template_name = NetworkLookup.group_buff_templates[group_buff_template_id]
	local group_buffs = self.player_group_buffs

	for i = 1, num_instances, 1 do
		local num_group_buffs = #group_buffs
		local group_buff_data, index_to_remove = nil

		for i = 1, num_group_buffs, 1 do
			group_buff_data = group_buffs[i]

			if group_buff_data.group_buff_template_name == group_buff_template_name then
				index_to_remove = i

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

				buff_extension.remove_buff(buff_extension, id)
			end
		end
	end

	return 
end
BuffSystem.rpc_buff_on_attack = function (self, sender, attacking_unit_id, hit_unit_id, attack_type_id, is_critical, hit_zone_id, target_number)
	local hit_unit = self.unit_storage:unit(hit_unit_id)
	local attacking_unit = self.unit_storage:unit(attacking_unit_id)
	local attack_type = NetworkLookup.buff_attack_types[attack_type_id]
	local hit_zone_name = NetworkLookup.hit_zones[hit_zone_id]

	if not Unit.alive(attacking_unit) then
		return 
	end

	local send_to_server = false

	DamageUtils.buff_on_attack(attacking_unit, hit_unit, attack_type, is_critical, hit_zone_name, target_number, send_to_server)

	return 
end
BuffSystem.rpc_proc_event = function (self, sender, peer_id, local_player_id, event_id)
	local player = Managers.player:player(peer_id, local_player_id)
	local event = NetworkLookup.proc_events[event_id]
	local player_unit = player.player_unit
	local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

	buff_extension.trigger_procs(buff_extension, event)

	return 
end
BuffSystem.rpc_remove_gromril_armour = function (self, sender, unit_id)
	local unit = self.unit_storage:unit(unit_id)

	if not Unit.alive(unit) then
		return 
	end

	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local has_gromril_armour = buff_extension.has_buff_type(buff_extension, "bardin_ironbreaker_gromril_armour")

	if has_gromril_armour then
		local buff = buff_extension.get_non_stacking_buff(buff_extension, "bardin_ironbreaker_gromril_armour")
		local id = buff.id

		buff_extension.remove_buff(buff_extension, id)
	end

	buff_extension.trigger_procs(buff_extension, "on_gromril_armour_removed")

	return 
end

return 
