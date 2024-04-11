-- chunkname: @scripts/entity_system/systems/buff/buff_system.lua

require("scripts/entity_system/systems/buff/buff_sync_type")
require("scripts/unit_extensions/default_player_unit/buffs/buff_templates")
require("scripts/unit_extensions/default_player_unit/buffs/group_buff_templates")
require("scripts/unit_extensions/default_player_unit/buffs/buff_function_templates")
require("scripts/unit_extensions/default_player_unit/buffs/buff_extension")

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
	"rpc_remove_gromril_armour",
	"rpc_add_buff_synced",
	"rpc_add_buff_synced_params",
	"rpc_add_buff_synced_relay",
	"rpc_add_buff_synced_relay_params",
	"rpc_add_buff_synced_response",
	"rpc_remove_buff_synced",
}
local extensions = {
	"BuffExtension",
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

BuffSystem.hot_join_sync = function (self, peer_id)
	if self.is_server then
		local num_group_buffs = #self.player_group_buffs
		local network_manager = self.network_manager
		local network_transmit = network_manager.network_transmit

		for i = 1, num_group_buffs do
			local group_buff_data = self.player_group_buffs[i]
			local group_buff_template_name = group_buff_data.group_buff_template_name
			local group_buff_template_id = NetworkLookup.group_buff_templates[group_buff_template_name]

			network_transmit:send_rpc("rpc_add_group_buff", peer_id, group_buff_template_id, 1)
		end

		for unit, data in pairs(self.server_controlled_buffs) do
			for server_buff_id, buff_data in pairs(data) do
				local unit_object_id = network_manager:unit_game_object_id(unit)

				if unit_object_id then
					local template_name = buff_data.template_name
					local attacker_unit = buff_data.attacker_unit
					local buff_template_name_id = NetworkLookup.buff_templates[template_name]
					local attacker_unit_object_id = network_manager:unit_game_object_id(attacker_unit) or NetworkConstants.invalid_game_object_id

					network_transmit:send_rpc("rpc_add_buff", peer_id, unit_object_id, buff_template_name_id, attacker_unit_object_id, server_buff_id, false)
				end
			end
		end

		self:_hot_join_sync_synced_buffs(peer_id)
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
	local extension = self.unit_extension_data[unit]

	if extension then
		extension:clear()
	end

	self.frozen_unit_extension_data[unit] = nil
	self.unit_extension_data[unit] = nil
	self.active_buff_units[unit] = nil

	self:_clean_up_server_controller_buffs(unit)
	BuffSystem.super.on_remove_extension(self, unit, extension_name)
end

BuffSystem.on_freeze_extension = function (self, unit, extension_name)
	self:freeze(unit, extension_name)
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

	extension:unfreeze()
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
	local free_buff_id

	if free_buff_ids_size > 0 then
		free_buff_id = free_buff_ids[free_buff_ids_size]
		free_buff_ids[free_buff_ids_size] = nil
	else
		free_buff_id = self.next_server_buff_id
		self.next_server_buff_id = self.next_server_buff_id + 1
	end

	if free_buff_id > NetworkConstants.server_controlled_buff_id.max then
		print("===== [BuffSystem] server controlled buffs dump =====")

		local count = 0

		for unit, buffs in pairs(self.server_controlled_buffs) do
			for server_id, buff_data in pairs(buffs) do
				print(unit, server_id, HEALTH_ALIVE[unit], buff_data.template_name, buff_data.attacker_unit)

				count = count + 1
			end
		end

		printf("Found %s buffs", count)
		ferror("[BuffSystem] ERROR! Too many server controlled buffs! (%d/%d)", free_buff_id, NetworkConstants.server_controlled_buff_id.max)
	end

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

		local buff_template = BuffUtils.get_buff_template(template_name)
		local buffs = buff_template.buffs

		for i = 1, #buffs do
			local sub_buff = buffs[i]

			fassert(sub_buff.duration == nil, "[BuffSystem] Error! Cannot use duration for server controlled buffs! (template = %s) Use a normal buff if it should have a duration!", template_name)
		end

		if not self.server_controlled_buffs[unit][server_buff_id] then
			local local_buff_id = buff_extension:add_buff(template_name, params)

			self.server_controlled_buffs[unit][server_buff_id] = {
				local_buff_id = local_buff_id,
				template_name = template_name,
				attacker_unit = attacker_unit,
				source_attacker_unit = source_attacker_unit,
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

	if is_server_controlled and not HEALTH_ALIVE[unit] then
		return nil
	end

	local server_buff_id = is_server_controlled and self:_next_free_server_buff_id() or 0

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

	if ALIVE[unit] and server_buff_id then
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

		if unit_object_id then
			network_manager.network_transmit:send_rpc_clients("rpc_remove_server_controlled_buff", unit_object_id, server_buff_id)
		end
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
		external_optional_multiplier = multiplier,
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

BuffSystem.rpc_add_buff = function (self, channel_id, unit_id, buff_template_name_id, attacker_unit_id, server_buff_id, send_to_sender)
	if self.is_server then
		if send_to_sender then
			self.network_manager.network_transmit:send_rpc_clients("rpc_add_buff", unit_id, buff_template_name_id, attacker_unit_id, 0, false)
		else
			local peer_id = CHANNEL_TO_PEER_ID[channel_id]

			self.network_manager.network_transmit:send_rpc_clients_except("rpc_add_buff", peer_id, unit_id, buff_template_name_id, attacker_unit_id, 0, false)
		end
	end

	local unit = self.unit_storage:unit(unit_id)
	local attacker_unit = self.unit_storage:unit(attacker_unit_id)
	local buff_template_name = NetworkLookup.buff_templates[buff_template_name_id]

	if ScriptUnit.has_extension(unit, "buff_system") then
		self:_add_buff_helper_function(unit, buff_template_name, attacker_unit, server_buff_id)
	end
end

BuffSystem.rpc_remove_server_controlled_buff = function (self, channel_id, unit_id, server_buff_id)
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

BuffSystem.rpc_add_volume_buff_multiplier = function (self, channel_id, unit_id, buff_template_name_id, multiplier)
	local unit = self.unit_storage:unit(unit_id)
	local buff_template_name = NetworkLookup.buff_templates[buff_template_name_id]

	self:add_volume_buff(unit, buff_template_name, multiplier)
end

BuffSystem.rpc_remove_volume_buff = function (self, channel_id, unit_id, buff_template_name_id)
	local unit = self.unit_storage:unit(unit_id)
	local buff_template_name = NetworkLookup.buff_templates[buff_template_name_id]

	self:remove_volume_buff(unit, buff_template_name)
end

BuffSystem.rpc_add_group_buff = function (self, channel_id, group_buff_template_id, num_instances)
	if self.is_server then
		self.network_manager.network_transmit:send_rpc_clients("rpc_add_group_buff", group_buff_template_id, num_instances)
	end

	local group_buff_template_name = NetworkLookup.group_buff_templates[group_buff_template_id]
	local group_buff = GroupBuffTemplates[group_buff_template_name]
	local buff_per_instance = group_buff.buff_per_instance
	local buff_side_name = group_buff.side_name
	local side = Managers.state.side:get_side_from_name(buff_side_name)
	local player_units = side:player_units()

	for i = 1, num_instances do
		local group_buff_data = {
			group_buff_template_name = group_buff_template_name,
			recipients = {},
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

BuffSystem.rpc_remove_group_buff = function (self, channel_id, group_buff_template_id, num_instances)
	local group_buff_template_name = NetworkLookup.group_buff_templates[group_buff_template_id]
	local group_buffs = self.player_group_buffs

	for i = 1, num_instances do
		local num_group_buffs = #group_buffs
		local group_buff_data, index_to_remove

		for j = 1, num_group_buffs do
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

BuffSystem.rpc_buff_on_attack = function (self, channel_id, attacking_unit_id, hit_unit_id, attack_type_id, is_critical, hit_zone_id, target_number, buff_type_id)
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

BuffSystem.rpc_proc_event = function (self, channel_id, peer_id, local_player_id, event_id)
	local player = Managers.player:player(peer_id, local_player_id)
	local event = NetworkLookup.proc_events[event_id]
	local player_unit = player.player_unit
	local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

	if buff_extension then
		buff_extension:trigger_procs(event)
	end
end

BuffSystem.rpc_remove_gromril_armour = function (self, channel_id, unit_id)
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

local function buff_param_pack_float(input)
	return math.floor(input * 100 + 32768)
end

local function buff_param_unpack_float(input)
	return (input - 32768) / 100
end

local function buff_param_pack_t(input)
	return math.floor(input * 10)
end

local function buff_param_unpack_t(input)
	return input / 10
end

local function buff_param_raw(input)
	return input
end

local function buff_param_damage_source(input)
	return NetworkLookup.damage_sources[input]
end

local function buff_param_pack_unit(input, ctx)
	return ctx.network_manager:unit_game_object_id(input) or NetworkConstants.invalid_game_object_id
end

local function buff_param_unpack_unit(input, ctx)
	return ctx.unit_storage:unit(input)
end

local function buff_param_pack_parent_id(input, ctx, unit)
	return ScriptUnit.extension(unit, "buff_system"):id_to_sync_id(input) or 0
end

local function buff_param_unpack_parent_id(input, ctx, unit)
	return ScriptUnit.extension(unit, "buff_system"):sync_id_to_id(input) or 0
end

local buff_param_packing_methods = {
	attacker_unit = {
		pack = buff_param_pack_unit,
		unpack = buff_param_unpack_unit,
	},
	source_attacker_unit = {
		pack = buff_param_pack_unit,
		unpack = buff_param_unpack_unit,
	},
	damage_source = {
		pack = buff_param_damage_source,
		unpack = buff_param_damage_source,
	},
	power_level = {
		pack = buff_param_raw,
		unpack = buff_param_raw,
	},
	variable_value = {
		pack = buff_param_pack_float,
		unpack = buff_param_unpack_float,
	},
	external_optional_bonus = {
		pack = buff_param_pack_float,
		unpack = buff_param_unpack_float,
	},
	external_optional_multiplier = {
		pack = buff_param_pack_float,
		unpack = buff_param_unpack_float,
	},
	external_optional_value = {
		pack = buff_param_pack_float,
		unpack = buff_param_unpack_float,
	},
	external_optional_proc_chance = {
		pack = buff_param_pack_float,
		unpack = buff_param_unpack_float,
	},
	external_optional_duration = {
		pack = buff_param_pack_float,
		unpack = buff_param_unpack_float,
	},
	external_optional_range = {
		pack = buff_param_pack_float,
		unpack = buff_param_unpack_float,
	},
	_hot_join_sync_buff_age = {
		pack = buff_param_pack_t,
		unpack = buff_param_unpack_t,
	},
	_flags = {
		pack = buff_param_raw,
		unpack = buff_param_raw,
	},
}
local buff_params_list = table.keys(buff_param_packing_methods)
local buff_params_list_lookup = table.mirror_array_inplace(table.keys(buff_param_packing_methods))
local buff_param_count = #buff_params_list
local packed_param_flags = {
	"refresh_duration_only",
}

table.mirror_array_inplace(packed_param_flags)

local buff_param_flag_count = #packed_param_flags
local packed_param_flag_bits = Script.new_map(buff_param_flag_count)

for i = 1, buff_param_flag_count do
	packed_param_flag_bits[packed_param_flags[i]] = bit.rshift(1, i - 1)
end

local packed_buff_param_ids = Script.new_array(buff_param_count)
local packed_buff_param_vals = Script.new_array(buff_param_count)
local unpacked_buff_params = Script.new_map(buff_param_count)

BuffSystem._pack_buff_params = function (self, buff_params, dest_param_ids, dest_param_vals, unit)
	table.clear(packed_buff_param_ids)
	table.clear(packed_buff_param_vals)

	local packed_buff_param_flags = 0
	local num_params = 0

	for name, val in pairs(buff_params) do
		if packed_param_flag_bits[name] then
			packed_buff_param_flags = bit.bor(packed_buff_param_flags, packed_param_flag_bits[name])
		elseif buff_params_list_lookup[name] then
			num_params = num_params + 1
			dest_param_ids[num_params] = buff_params_list_lookup[name]
			dest_param_vals[num_params] = buff_param_packing_methods[name].pack(val, self, unit)
		end
	end

	if packed_buff_param_flags > 0 then
		num_params = num_params + 1
		dest_param_ids[num_params] = buff_params_list_lookup._flags
		dest_param_vals[num_params] = packed_buff_param_flags
	end

	return dest_param_ids, dest_param_vals
end

BuffSystem._unpack_buff_params = function (self, dest_table, param_ids, param_vals, unit)
	table.clear(dest_table)

	local num_params = #param_ids
	local flags_param_id = param_ids[num_params]

	if buff_params_list[flags_param_id] == "_flags" then
		local packed_buff_flags = param_vals[num_params]

		for i = 1, buff_param_flag_count do
			local flag_name = packed_param_flags[i]
			local flag_bit = packed_param_flag_bits[flag_name]

			if bit.band(packed_buff_flags, flag_bit) == flag_bit then
				dest_table[flag_name] = true
			end
		end

		num_params = num_params - 1
	end

	for i = 1, num_params do
		local param_id = param_ids[i]
		local param_name = buff_params_list[param_id]
		local param_type_data = buff_param_packing_methods[param_name]

		dest_table[param_name] = param_type_data.unpack(param_vals[i], self, unit)
	end

	return dest_table
end

local invalid_buff_sync_id = 0

BuffSystem._prepare_sync = function (self, target_unit, template_name, sync_type, params)
	local network_manager = Managers.state.network
	local target_unit_id = network_manager:unit_game_object_id(target_unit)
	local template_name_id = NetworkLookup.buff_templates[template_name]
	local sync_type_id = BuffSyncTypeLookup[sync_type]
	local rpc_name = "rpc_add_buff_synced"
	local param_ids, param_vals

	if params then
		rpc_name = "rpc_add_buff_synced_params"
		param_ids, param_vals = self:_pack_buff_params(params, packed_buff_param_ids, packed_buff_param_vals, target_unit)
	end

	return target_unit_id, template_name_id, sync_type_id, rpc_name, param_ids, param_vals
end

local function debug_sync_print(...)
	if script_data.debug_synced_buffs then
		print(...)
	end
end

local sync_by_sync_type = {
	[BuffSyncType.Local] = function (buff_system, target_unit, template_name, sync_type, local_sync_id, params, optional_peer_id)
		return true
	end,
	[BuffSyncType.Client] = function (buff_system, target_unit, template_name, sync_type, local_sync_id, params, receiver_peer_id)
		if receiver_peer_id == Network.peer_id() then
			return true
		end

		local target_unit_id, template_name_id, sync_type_id, rpc_name, param_ids, param_vals = buff_system:_prepare_sync(target_unit, template_name, sync_type, params)
		local network_transmit = Managers.state.network.network_transmit

		network_transmit:send_rpc(rpc_name, receiver_peer_id, target_unit_id, template_name_id, local_sync_id, sync_type_id, param_ids, param_vals)
	end,
	[BuffSyncType.LocalAndServer] = function (buff_system, target_unit, template_name, sync_type, local_sync_id, params, optional_peer_id)
		if buff_system.is_server then
			return true
		end

		local target_unit_id, template_name_id, sync_type_id, rpc_name, param_ids, param_vals = buff_system:_prepare_sync(target_unit, template_name, sync_type, params)
		local network_transmit = Managers.state.network.network_transmit

		network_transmit:send_rpc_server(rpc_name, target_unit_id, template_name_id, local_sync_id, sync_type_id, param_ids, param_vals)
	end,
	[BuffSyncType.ClientAndServer] = function (buff_system, target_unit, template_name, sync_type, local_sync_id, params, receiver_peer_id)
		if buff_system.is_server and receiver_peer_id == Network.peer_id() then
			return true
		end

		local target_unit_id, template_name_id, sync_type_id, rpc_name, param_ids, param_vals = buff_system:_prepare_sync(target_unit, template_name, sync_type, params)
		local network_transmit = Managers.state.network.network_transmit

		if buff_system.is_server then
			network_transmit:send_rpc(rpc_name, receiver_peer_id, target_unit_id, template_name_id, local_sync_id, sync_type_id, param_ids, param_vals)
		else
			network_transmit:send_rpc_server(rpc_name, target_unit_id, template_name_id, local_sync_id, sync_type_id, param_ids, param_vals)
		end
	end,
	[BuffSyncType.Server] = function (buff_system, target_unit, template_name, sync_type, local_sync_id, params, optional_peer_id)
		if buff_system.is_server then
			return true
		end

		local target_unit_id, template_name_id, sync_type_id, rpc_name, param_ids, param_vals = buff_system:_prepare_sync(target_unit, template_name, sync_type, params)
		local network_transmit = Managers.state.network.network_transmit

		network_transmit:send_rpc_server(rpc_name, target_unit_id, template_name_id, local_sync_id, sync_type_id, param_ids, param_vals)
	end,
	[BuffSyncType.All] = function (buff_system, target_unit, template_name, sync_type, local_sync_id, params, optional_peer_id)
		local target_unit_id, template_name_id, sync_type_id, rpc_name, param_ids, param_vals = buff_system:_prepare_sync(target_unit, template_name, sync_type, params)
		local network_transmit = Managers.state.network.network_transmit

		if buff_system.is_server then
			network_transmit:send_rpc_clients(rpc_name, target_unit_id, template_name_id, local_sync_id, sync_type_id, param_ids, param_vals)
		else
			network_transmit:send_rpc_server(rpc_name, target_unit_id, template_name_id, local_sync_id, sync_type_id, param_ids, param_vals)
		end
	end,
}

BuffSystem.add_buff_synced = function (self, target_unit, template_name, sync_type, params, optional_peer_id)
	local buff_id = -1
	local num_sub_buffs
	local buff_extension = self.unit_extension_data[target_unit]

	if buff_extension then
		if sync_type == BuffSyncType.Client and optional_peer_id ~= Network.peer_id() or sync_type == BuffSyncType.Server and not self.is_server then
			buff_id = buff_extension:claim_buff_id()
			num_sub_buffs = 1
		else
			buff_id, num_sub_buffs = buff_extension:add_buff(template_name, params)
		end

		local local_sync_id = invalid_buff_sync_id

		if num_sub_buffs > 0 then
			local_sync_id = buff_extension:generate_sync_id()

			buff_extension:set_pending_sync_id(buff_id, local_sync_id, sync_type)

			if self.is_server then
				buff_extension:apply_remote_sync_id(buff_id, local_sync_id, sync_type, optional_peer_id or Network.peer_id())
			end
		else
			buff_id = -1
		end

		local local_only = sync_by_sync_type[sync_type](self, target_unit, template_name, sync_type, local_sync_id, params, optional_peer_id)
	end

	return buff_id
end

BuffSystem.remove_buff_synced = function (self, target_unit, buff_id)
	local buff_extension = self.unit_extension_data[target_unit]

	if buff_extension and buff_id then
		buff_extension:remove_buff(buff_id)
	end
end

BuffSystem.rpc_add_buff_synced = function (self, channel_id, target_unit_id, template_name_id, remote_sync_id, sync_type_id)
	local target_unit = self.unit_storage:unit(target_unit_id)
	local buff_extension = self.unit_extension_data[target_unit]

	if buff_extension then
		local template_name = NetworkLookup.buff_templates[template_name_id]
		local id, num_sub_buffs = buff_extension:add_buff(template_name)

		if num_sub_buffs <= 0 then
			remote_sync_id = invalid_buff_sync_id
		end

		local local_sync_id = remote_sync_id ~= invalid_buff_sync_id and buff_extension:generate_sync_id() or invalid_buff_sync_id
		local server_sync_id = self.is_server and local_sync_id or remote_sync_id
		local sync_type = BuffSyncTypeLookup[sync_type_id]
		local owner_peer_id = CHANNEL_TO_PEER_ID[channel_id]

		if server_sync_id ~= invalid_buff_sync_id then
			buff_extension:apply_remote_sync_id(id, server_sync_id, sync_type, owner_peer_id)
		end

		if remote_sync_id == invalid_buff_sync_id then
			debug_sync_print("[BuffSystem] rpc_add_buff_synced, response consumed due to blind fire sync", owner_peer_id, target_unit_id, template_name)

			return
		end

		local network_manager = Managers.state.network

		if self.is_server then
			if sync_type == BuffSyncType.All then
				network_manager.network_transmit:send_rpc_clients_except("rpc_add_buff_synced_relay", owner_peer_id, target_unit_id, template_name_id, server_sync_id, sync_type_id)
			end

			network_manager.network_transmit:send_rpc("rpc_add_buff_synced_response", owner_peer_id, target_unit_id, remote_sync_id, server_sync_id)
		elseif sync_type == BuffSyncType.ClientAndServer then
			network_manager.network_transmit:send_rpc_server("rpc_add_buff_synced_response", target_unit_id, remote_sync_id, server_sync_id)
		elseif sync_type == BuffSyncType.Client then
			network_manager.network_transmit:send_rpc("rpc_add_buff_synced_response", owner_peer_id, target_unit_id, remote_sync_id, server_sync_id)
		end
	end
end

BuffSystem.rpc_add_buff_synced_relay = function (self, channel_id, target_unit_id, template_name_id, server_sync_id, sync_type_id)
	local target_unit = self.unit_storage:unit(target_unit_id)
	local buff_extension = self.unit_extension_data[target_unit]

	if buff_extension then
		local template_name = NetworkLookup.buff_templates[template_name_id]
		local local_buff_id = buff_extension:add_buff(template_name)

		if server_sync_id ~= invalid_buff_sync_id then
			local sync_type = BuffSyncTypeLookup[sync_type_id]

			buff_extension:apply_remote_sync_id(local_buff_id, server_sync_id, sync_type)
		end
	end
end

BuffSystem.rpc_add_buff_synced_params = function (self, channel_id, target_unit_id, template_name_id, remote_sync_id, sync_type_id, param_ids, param_vals)
	local target_unit = self.unit_storage:unit(target_unit_id)
	local buff_extension = self.unit_extension_data[target_unit]

	if buff_extension then
		local template_name = NetworkLookup.buff_templates[template_name_id]
		local params = self:_unpack_buff_params(unpacked_buff_params, param_ids, param_vals, target_unit)
		local id = buff_extension:add_buff(template_name, params)
		local local_sync_id = remote_sync_id ~= invalid_buff_sync_id and buff_extension:generate_sync_id() or invalid_buff_sync_id
		local server_sync_id = self.is_server and local_sync_id or remote_sync_id
		local sync_type = BuffSyncTypeLookup[sync_type_id]
		local owner_peer_id = CHANNEL_TO_PEER_ID[channel_id]

		if server_sync_id ~= invalid_buff_sync_id then
			buff_extension:apply_remote_sync_id(id, server_sync_id, sync_type, owner_peer_id)
		end

		if remote_sync_id == invalid_buff_sync_id then
			debug_sync_print("[BuffSystem] rpc_add_buff_synced_params, response consumed due to blind fire sync", owner_peer_id, target_unit_id, template_name)

			return
		end

		local network_manager = Managers.state.network

		if self.is_server then
			if sync_type == BuffSyncType.All then
				network_manager.network_transmit:send_rpc_clients_except("rpc_add_buff_synced_relay_params", owner_peer_id, target_unit_id, template_name_id, server_sync_id, sync_type_id, param_ids, param_vals)
			end

			network_manager.network_transmit:send_rpc("rpc_add_buff_synced_response", owner_peer_id, target_unit_id, remote_sync_id, server_sync_id)
		elseif sync_type == BuffSyncType.ClientAndServer then
			network_manager.network_transmit:send_rpc_server("rpc_add_buff_synced_response", target_unit_id, remote_sync_id, server_sync_id)
		elseif sync_type == BuffSyncType.Client then
			network_manager.network_transmit:send_rpc("rpc_add_buff_synced_response", owner_peer_id, target_unit_id, remote_sync_id, server_sync_id)
		end
	end
end

BuffSystem.rpc_add_buff_synced_relay_params = function (self, channel_id, target_unit_id, template_name_id, server_sync_id, sync_type_id, param_ids, param_vals)
	local target_unit = self.unit_storage:unit(target_unit_id)
	local buff_extension = self.unit_extension_data[target_unit]

	if buff_extension then
		local template_name = NetworkLookup.buff_templates[template_name_id]
		local params = self:_unpack_buff_params(unpacked_buff_params, param_ids, param_vals, target_unit)
		local local_buff_id = buff_extension:add_buff(template_name, params)

		if server_sync_id ~= invalid_buff_sync_id then
			local sync_type = BuffSyncTypeLookup[sync_type_id]

			buff_extension:apply_remote_sync_id(local_buff_id, server_sync_id, sync_type)
		end
	end
end

BuffSystem.rpc_add_buff_synced_response = function (self, channel_id, target_unit_id, local_sync_id, server_sync_id)
	local target_unit = self.unit_storage:unit(target_unit_id)
	local buff_extension = self.unit_extension_data[target_unit]

	if buff_extension and not buff_extension:apply_sync_id(local_sync_id, server_sync_id) then
		local network_manager = Managers.state.network

		if self.is_server then
			local peer_id = CHANNEL_TO_PEER_ID[channel_id]

			network_manager.network_transmit:send_rpc("rpc_remove_buff_synced", peer_id, target_unit_id, server_sync_id)
		else
			network_manager.network_transmit:send_rpc_server("rpc_remove_buff_synced", target_unit_id, server_sync_id)
		end
	end
end

BuffSystem.rpc_remove_buff_synced = function (self, channel_id, target_unit_id, server_sync_id)
	local target_unit = self.unit_storage:unit(target_unit_id)
	local buff_extension = self.unit_extension_data[target_unit]

	if buff_extension then
		local buff_id = buff_extension:sync_id_to_id(server_sync_id)

		if buff_id then
			if self.is_server then
				local sync_type = buff_extension:buff_sync_type(buff_id)

				if sync_type == BuffSyncType.All then
					local peer_id = CHANNEL_TO_PEER_ID[channel_id]
					local network_transmit = Managers.state.network.network_transmit

					network_transmit:send_rpc_clients_except("rpc_remove_buff_synced", peer_id, target_unit_id, server_sync_id)
				end
			end

			buff_extension:remove_buff(buff_id, true)
		end
	end
end

BuffSystem._hot_join_sync_synced_buffs = function (self, peer_id)
	local t = Managers.time:time("game")
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local sync_type_id = BuffSyncTypeLookup[BuffSyncType.All]
	local buff_params = {}
	local active_buff_units = self.active_buff_units

	for unit, extension in pairs(active_buff_units) do
		local buff_to_sync_type = extension._buff_to_sync_type

		if buff_to_sync_type then
			local unit_id = network_manager:unit_game_object_id(unit)
			local id_to_server_sync = extension._id_to_server_sync

			for buff_id, sync_type in pairs(buff_to_sync_type) do
				if sync_type == BuffSyncType.All then
					local buff = extension:get_buff_by_id(buff_id)

					if buff then
						local template_name_id = NetworkLookup.buff_templates[buff.buff_template_name]
						local server_sync_id = id_to_server_sync[buff_id]

						table.clear(buff_params)

						buff_params.external_optional_bonus = buff.bonus
						buff_params.external_optional_multiplier = buff.multiplier
						buff_params.external_optional_value = buff.value
						buff_params.external_optional_proc_chance = buff.proc_chance
						buff_params.external_optional_range = buff.range
						buff_params.damage_source = buff.damage_source
						buff_params.power_level = buff.power_level
						buff_params.attacker_unit = buff.attacker_unit
						buff_params.source_attacker_unit = buff.source_attacker_unit
						buff_params._hot_join_sync_buff_age = buff.duration and math.min(t - buff.start_time, 6550)

						self:_pack_buff_params(buff_params, packed_buff_param_ids, packed_buff_param_vals, unit)
						network_transmit:send_rpc("rpc_add_buff_synced_relay_params", peer_id, unit_id, template_name_id, server_sync_id, sync_type_id, packed_buff_param_ids, packed_buff_param_vals)
					else
						if extension.debug_buff_names then
							local buff_name = extension.debug_buff_names[buff_id]

							print("Server would have crashed buff name ", buff_name)
							Crashify.print_exception("[BuffSystem]", "buff_id points to missing buff: %s", buff_name)
						end

						buff_to_sync_type[buff_id] = nil
					end
				end
			end
		end
	end
end
