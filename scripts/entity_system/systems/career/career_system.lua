CareerSystem = class(CareerSystem, ExtensionSystemBase)
local extension_list = {
	"CareerExtension"
}
local RPCS = {
	"rpc_server_reduce_activated_ability_cooldown",
	"rpc_server_reduce_activated_ability_cooldown_percent",
	"rpc_reduce_activated_ability_cooldown",
	"rpc_reduce_activated_ability_cooldown_percent",
	"rpc_ability_activated"
}

CareerSystem.init = function (self, entity_system_creation_context, system_name)
	CareerSystem.super.init(self, entity_system_creation_context, system_name, extension_list)

	self.unit_extensions = {}
	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.unit_storage = Managers.state.unit_storage
	self.network_transmit = Managers.state.network.network_transmit
	self.player_manager = Managers.player
end

CareerSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
end

CareerSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local career_extension = CareerSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
	self.unit_extensions[unit] = career_extension

	return career_extension
end

CareerSystem.on_remove_extension = function (self, unit, extension_name)
	self.unit_extensions[unit] = nil

	CareerSystem.super.on_remove_extension(self, unit, extension_name)
end

CareerSystem.server_reduce_activated_ability_cooldown = function (self, units, amount, ability_id, ignore_paused)
	if not units then
		return
	end

	local unit_storage = self.unit_storage
	local unit_ids = {}
	local unit_count = 0

	for i = 1, #units do
		local unit = units[i]

		if ALIVE[unit] then
			local unit_id = unit_storage:go_id(unit)
			unit_count = unit_count + 1
			unit_ids[unit_count] = unit_id
		end
	end

	if unit_count > 0 then
		self.network_transmit:send_rpc_server("rpc_server_reduce_activated_ability_cooldown", unit_ids, amount, ability_id, ignore_paused)
	end
end

CareerSystem.rpc_server_reduce_activated_ability_cooldown = function (self, sender, unit_game_object_ids, amount, ability_id, ignore_paused)
	local network_transmit = self.network_transmit

	if self.is_server then
		local unit_storage = self.unit_storage
		local player_manager = self.player_manager

		for i = 1, #unit_game_object_ids do
			local unit_game_object_id = unit_game_object_ids[i]
			local unit = unit_storage:unit(unit_game_object_id)

			if unit then
				local owner_player = player_manager:owner(unit)
				local peer_id = owner_player:network_id()

				network_transmit:send_rpc("rpc_reduce_activated_ability_cooldown", peer_id, unit_game_object_id, amount, ability_id, ignore_paused)
			end
		end
	else
		network_transmit:send_rpc_server("rpc_server_reduce_activated_ability_cooldown", unit_game_object_ids, amount, ability_id, ignore_paused)
	end
end

CareerSystem.rpc_reduce_activated_ability_cooldown = function (self, sender, unit_game_object_id, amount, ability_id, ignore_paused)
	local unit = self.unit_storage:unit(unit_game_object_id)
	local career_extension = self.unit_extensions[unit]

	if career_extension then
		career_extension:reduce_activated_ability_cooldown(amount, ability_id, ignore_paused)
	end
end

CareerSystem.rpc_server_reduce_activated_ability_cooldown_percent = function (self, sender, unit_game_object_id, amount, ability_id, ignore_paused)
	local network_transmit = self.network_transmit

	if self.is_server then
		local unit_storage = self.unit_storage
		local player_manager = self.player_manager
		local unit = unit_storage:unit(unit_game_object_id)

		if unit then
			local owner_player = player_manager:owner(unit)
			local peer_id = owner_player:network_id()

			network_transmit:send_rpc("rpc_reduce_activated_ability_cooldown_percent", peer_id, unit_game_object_id, amount, ability_id, ignore_paused)
		end
	else
		network_transmit:send_rpc_server("rpc_server_rpc_reduce_activated_ability_cooldown_percent", unit_game_object_id, amount, ability_id, ignore_paused)
	end
end

CareerSystem.rpc_reduce_activated_ability_cooldown_percent = function (self, sender, unit_game_object_id, amount, ability_id, ignore_paused)
	local unit = self.unit_storage:unit(unit_game_object_id)
	local career_extension = self.unit_extensions[unit]

	if career_extension then
		career_extension:reduce_activated_ability_cooldown_percent(amount, ability_id, ignore_paused)
	end
end

CareerSystem.rpc_ability_activated = function (self, channel_id, unit_game_object_id, ability_id)
	local unit = self.unit_storage:unit(unit_game_object_id)
	local local_players = Managers.player:players_at_peer(Network.peer_id())

	if local_players and unit then
		for _, player in pairs(local_players) do
			local player_unit = player.player_unit

			if ALIVE[player_unit] then
				local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

				if buff_extension then
					buff_extension:trigger_procs("on_ability_activated", unit, ability_id)
					Managers.state.achievement:trigger_event("any_ability_used", unit, ability_id)
				end
			end
		end
	end

	local units_buff_extension = ScriptUnit.has_extension(unit, "buff_system")

	if units_buff_extension then
		units_buff_extension:trigger_procs("on_ability_activated", unit, ability_id)
	end

	local units_cosmetic_extension = ScriptUnit.has_extension(unit, "cosmetic_system")

	if units_cosmetic_extension then
		units_cosmetic_extension:trigger_ability_activated_events()
	end

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_ability_activated", peer_id, unit_game_object_id, ability_id)
	end
end
