-- chunkname: @scripts/entity_system/systems/weapon/ammo_system.lua

AmmoSystem = class(AmmoSystem, ExtensionSystemBase)

local extensions = {
	"ActiveReloadAmmoUserExtension",
	"GenericAmmoUserExtension",
}
local RPCS = {
	"rpc_give_ammo_fraction_to_owner",
}

AmmoSystem.init = function (self, entity_system_creation_context, system_name)
	AmmoSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self._world = entity_system_creation_context.world
	self._network_event_delegate = entity_system_creation_context.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))

	self._unit_extensions = {}
	self._unit_extensions_by_owener = {}
end

AmmoSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = AmmoSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)

	self._unit_extensions[unit] = extension

	local extension_owners = self._unit_extensions_by_owener[extension.owner_unit]

	if not extension_owners then
		self._unit_extensions_by_owener[extension.owner_unit] = {
			extension,
		}
	else
		extension_owners[#extension_owners + 1] = extension
	end

	return extension
end

AmmoSystem.on_remove_extension = function (self, unit, extension_name)
	local extension = self._unit_extensions[unit]

	self._unit_extensions[unit] = nil

	local extension_owners = self._unit_extensions_by_owener[extension.owner_unit]

	if extension_owners then
		local index = table.index_of(extension_owners, extension)

		if index then
			table.swap_delete(extension_owners, index)
		end
	end

	AmmoSystem.super.on_remove_extension(self, unit, extension_name)
end

AmmoSystem.destroy = function (self)
	self._network_event_delegate:unregister(self)
end

AmmoSystem.give_ammo_fraction_to_owner = function (self, owner_unit, fraction, to_reserve)
	local player = Managers.player:owner(owner_unit)

	if player then
		local is_local = player and not player.remote

		if is_local then
			local extensions = self._unit_extensions_by_owener[owner_unit]

			if not extensions then
				return
			end

			for extension_id = 1, #extensions do
				local extension = extensions[extension_id]

				if extension.slot_name == "slot_ranged" then
					local ammo_amount = math.max(math.round(extension:max_ammo() * fraction), 1)

					if to_reserve then
						extension:add_ammo_to_reserve(ammo_amount)
					else
						extension:add_ammo(ammo_amount)
					end
				end
			end
		else
			local network_transmit = Managers.state.network.network_transmit
			local target_peer_id = player.peer_id
			local unit_id = Managers.state.unit_storage:go_id(owner_unit)

			if self.is_server then
				network_transmit:send_rpc("rpc_give_ammo_fraction_to_owner", target_peer_id, unit_id, fraction, to_reserve)
			else
				network_transmit:send_rpc_server("rpc_give_ammo_fraction_to_owner", unit_id, fraction, to_reserve)
			end
		end
	end
end

AmmoSystem.rpc_give_ammo_fraction_to_owner = function (self, channel_id, unit_id, fraction, to_reserve)
	local unit = Managers.state.unit_storage:unit(unit_id)

	self:give_ammo_fraction_to_owner(unit, fraction, to_reserve)
end
