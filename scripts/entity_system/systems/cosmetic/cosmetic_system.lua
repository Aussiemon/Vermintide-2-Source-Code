require("scripts/unit_extensions/default_player_unit/cosmetic/player_unit_cosmetic_extension")

CosmeticSystem = class(CosmeticSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_set_equipped_frame",
	"rpc_server_request_emote",
	"rpc_server_cancel_emote"
}
local extension_list = {
	"PlayerUnitCosmeticExtension"
}

CosmeticSystem.init = function (self, entity_system_creation_context, system_name)
	table.dump(entity_system_creation_context, "entity_system_creation_context")
	CosmeticSystem.super.init(self, entity_system_creation_context, system_name, extension_list)

	self.profile_synchronizer = entity_system_creation_context.profile_synchronizer
	self._network_event_delegate = entity_system_creation_context.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))

	self._emote_states = {}
end

CosmeticSystem.destroy = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
end

CosmeticSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	extension_init_data.is_server = self.is_server

	return CosmeticSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
end

CosmeticSystem.get_equipped_frame = function (self, unit)
	local player_portrait_frame = "default"

	if Unit.alive(unit) then
		local ext = ScriptUnit.extension(unit, "cosmetic_system")
		local frame_name = ext:get_equipped_frame_name()
		player_portrait_frame = frame_name
	end

	return player_portrait_frame
end

CosmeticSystem.set_equipped_frame = function (self, unit, frame_name)
	local ext = ScriptUnit.extension(unit, "cosmetic_system")

	ext:set_equipped_frame(frame_name)

	local unit_id = self.unit_storage:go_id(unit)
	local frame_name_id = NetworkLookup.cosmetics[frame_name]

	if self.is_server then
		self.network_transmit:send_rpc_clients("rpc_set_equipped_frame", unit_id, frame_name_id)
	else
		self.network_transmit:send_rpc_server("rpc_set_equipped_frame", unit_id, frame_name_id)
	end
end

CosmeticSystem.rpc_set_equipped_frame = function (self, channel_id, unit_id, frame_name_id)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_set_equipped_frame", peer_id, unit_id, frame_name_id)
	end

	local unit = self.unit_storage:unit(unit_id)
	local frame_name = NetworkLookup.cosmetics[frame_name_id]

	if Unit.alive(unit) then
		local ext = ScriptUnit.extension(unit, "cosmetic_system")

		ext:set_equipped_frame(frame_name)
	end
end

CosmeticSystem.rpc_server_request_emote = function (self, channel_id, unit_id, anim_event_id, hide_weapons)
	fassert(self.is_server, "Error! Only the server should process emote requests.")

	local unit = self.unit_storage:unit(unit_id)

	if unit then
		local anim_event = NetworkLookup.anims[anim_event_id]
		self._emote_states[unit_id] = {
			anim_event = anim_event,
			hide_weapons = hide_weapons
		}

		CharacterStateHelper.play_animation_event(unit, anim_event)

		local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")

		CharacterStateHelper.show_inventory_3p(unit, not hide_weapons, true, true, inventory_extension)
	end
end

CosmeticSystem.rpc_server_cancel_emote = function (self, channel_id, unit_id)
	fassert(self.is_server, "Error! Only the server should cancel emotes.")

	local unit = self.unit_storage:unit(unit_id)

	if unit then
		CharacterStateHelper.play_animation_event(unit, "anim_pose_cancel")

		local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")

		CharacterStateHelper.show_inventory_3p(unit, true, true, true, inventory_extension)
	end

	self._emote_states[unit_id] = nil
end

CosmeticSystem.hot_join_sync = function (self, peer_id)
	local network_transmit = self.network_transmit
	local unit_storage = self.unit_storage

	for unit_id, emote_state in pairs(self._emote_states) do
		local event_id = NetworkLookup.anims[emote_state.anim_event]

		network_transmit:send_rpc("rpc_anim_event", peer_id, event_id, unit_id)
		network_transmit:send_rpc("rpc_show_inventory", peer_id, unit_id, not emote_state.hide_weapons)
	end
end

return
