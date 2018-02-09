require("scripts/unit_extensions/default_player_unit/ping/context_aware_ping_extension")
require("scripts/unit_extensions/default_player_unit/ping/ping_target_extension")

local PING_DURATION = 15
local RPCS = {
	"rpc_ping_unit",
	"rpc_remove_unit_ping"
}
local extensions = {
	"ContextAwarePingExtension",
	"PingTargetExtension"
}
PingSystem = class(PingSystem, ExtensionSystemBase)
PingSystem.init = function (self, context, system_name)
	PingSystem.super.init(self, context, system_name, extensions)

	local network_event_delegate = context.network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate
	self._unit_storage = context.unit_storage
	self._world = context.world
	self._wwise_world = Managers.world:wwise_world(self._world)
	self._pinged_units = {}

	return 
end
PingSystem.destroy = function (self)
	self._network_event_delegate:unregister(self)

	return 
end
PingSystem.update = function (self, context, t)
	PingSystem.super.update(self, context, t)

	local pinged_units = self._pinged_units

	for pinger_unit, data in pairs(pinged_units) do
		local pinged_unit = data.pinged_unit

		if Unit.alive(pinged_unit) then
			if Unit.alive(pinger_unit) then
				local start_time = data.start_time

				if start_time + PING_DURATION <= t then
					self.remove_ping(self, pinger_unit)
				end
			else
				self.remove_ping(self, pinger_unit)
			end
		else
			self.remove_ping(self, pinger_unit)
		end
	end

	return 
end
PingSystem.rpc_ping_unit = function (self, sender, pinger_unit_id, pinged_unit_id)
	local pinger_unit = self._unit_storage:unit(pinger_unit_id)
	local pinged_unit = self._unit_storage:unit(pinged_unit_id)

	if not Unit.alive(pinged_unit) then
		return 
	end

	if self.is_server then
		if self._pinged_units[pinger_unit] then
			self.remove_ping(self, pinger_unit)
		end

		local t = Managers.time:time("game")
		self._pinged_units[pinger_unit] = {
			start_time = t,
			pinged_unit = pinged_unit
		}

		self.network_transmit:send_rpc_clients("rpc_ping_unit", pinger_unit_id, pinged_unit_id)
		self.play_ping_vo(self, pinger_unit, pinged_unit)
	end

	self.add_ping(self, pinger_unit, pinged_unit)

	return 
end
PingSystem.rpc_remove_unit_ping = function (self, sender, pinged_unit_id)
	local pinged_unit = self._unit_storage:unit(pinged_unit_id)

	if not Unit.alive(pinged_unit) then
		return 
	end

	local ping_extension = ScriptUnit.extension(pinged_unit, "ping_system")

	if ping_extension.set_pinged then
		ping_extension.set_pinged(ping_extension, false)
	end

	return 
end
PingSystem.add_ping = function (self, pinger_unit, pinged_unit)
	local ping_extension = ScriptUnit.extension(pinged_unit, "ping_system")

	if ping_extension.set_pinged then
		ping_extension.set_pinged(ping_extension, true, pinger_unit)
	end

	local event = "hud_ping"

	if Unit.get_data(pinged_unit, "breed") then
		event = "hud_ping_enemy"
	end

	WwiseWorld.trigger_event(self._wwise_world, event)

	local breed = Unit.get_data(pinged_unit, "breed")

	if breed and breed.boss then
		Managers.state.event:trigger("show_boss_health_bar", pinged_unit)
	end

	return 
end
PingSystem.remove_ping_from_unit = function (self, target_unit)
	for pinger_unit, target in pairs(self._pinged_units) do
		if target_unit == target.pinged_unit then
			self.remove_ping(self, pinger_unit)

			return 
		end
	end

	return 
end
PingSystem.remove_ping = function (self, pinger_unit)
	fassert(self.is_server, "only the server should remove pings")

	local data = self._pinged_units[pinger_unit]
	local pinged_unit = data.pinged_unit
	self._pinged_units[pinger_unit] = nil

	if Unit.alive(pinged_unit) then
		local network_manager = Managers.state.network
		local pinged_unit_id = network_manager.unit_game_object_id(network_manager, pinged_unit)

		self.network_transmit:send_rpc_clients("rpc_remove_unit_ping", pinged_unit_id)

		local ping_extension = ScriptUnit.extension(pinged_unit, "ping_system")

		if ping_extension.set_pinged then
			ping_extension.set_pinged(ping_extension, false)
		end
	end

	return 
end
PingSystem.play_ping_vo = function (self, pinger_unit, pinged_unit)
	local event_data = FrameTable.alloc_table()
	local dialogue_input = ScriptUnit.extension_input(pinger_unit, "dialogue_system")

	if Unit.get_data(pinged_unit, "breed") then
		local breed_data = Unit.get_data(pinged_unit, "breed")
		local name = breed_data.name
		event_data.enemy_tag = name
		event_data.enemy_unit = pinged_unit
		event_data.is_ping = true

		dialogue_input.trigger_networked_dialogue_event(dialogue_input, "seen_enemy", event_data)
	elseif ScriptUnit.has_extension(pinged_unit, "status_system") then
		local status_extension = ScriptUnit.extension(pinged_unit, "status_system")
		local event = status_extension.disabled_vo_reason(status_extension)

		if event then
			event_data.source_name = ScriptUnit.extension(pinger_unit, "dialogue_system").context.player_profile
			event_data.target_name = ScriptUnit.extension(pinged_unit, "dialogue_system").context.player_profile
			event_data.is_ping = true

			dialogue_input.trigger_networked_dialogue_event(dialogue_input, event, event_data)
		end
	elseif Unit.get_data(pinged_unit, "lookat_tag") then
		event_data.item_tag = Unit.get_data(pinged_unit, "lookat_tag") or Unit.debug_name(pinged_unit)
		event_data.is_ping = true

		dialogue_input.trigger_networked_dialogue_event(dialogue_input, "seen_item", event_data)
	elseif ScriptUnit.has_extension(pinged_unit, "interactable_system") then
	end

	return 
end
PingSystem.hot_join_sync = function (self, sender)
	local pinged_units = self._pinged_units
	local network_manager = Managers.state.network

	for pinger_unit, data in pairs(pinged_units) do
		local pinger_unit_id = network_manager.unit_game_object_id(network_manager, pinger_unit)
		local pinged_unit_id = network_manager.unit_game_object_id(network_manager, data.pinged_unit)

		if pinger_unit_id and pinged_unit_id then
			RPC.rpc_ping_unit(sender, pinger_unit_id, pinged_unit_id)
		end
	end

	return 
end

return 
