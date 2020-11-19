require("scripts/unit_extensions/default_player_unit/weaves/player_unit_weave_loadout_extension")
require("scripts/unit_extensions/default_player_unit/weaves/player_husk_weave_loadout_extension")

WeaveLoadoutSystem = class(WeaveLoadoutSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_add_weave_buffs"
}
local extension_list = {
	"PlayerUnitWeaveLoadoutExtension",
	"PlayerHuskWeaveLoadoutExtension"
}

WeaveLoadoutSystem.init = function (self, entity_system_creation_context, system_name)
	WeaveLoadoutSystem.super.init(self, entity_system_creation_context, system_name, extension_list)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

WeaveLoadoutSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
end

WeaveLoadoutSystem.rpc_add_weave_buffs = function (self, channel_id, go_id, num_buffs, buff_ids, buff_data_type_ids, buff_values)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_add_weave_buffs", peer_id, go_id, num_buffs, buff_ids, buff_data_type_ids, buff_values)
	end

	local unit = self.unit_storage:unit(go_id)
	local weave_loadout_extension = ScriptUnit.extension(unit, "weave_loadout_system")

	weave_loadout_extension:add_buffs(num_buffs, buff_ids, buff_data_type_ids, buff_values)
end

return
