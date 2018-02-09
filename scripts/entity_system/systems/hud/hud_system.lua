require("scripts/unit_extensions/default_player_unit/player_hud")

HUDSystem = class(HUDSystem, ExtensionSystemBase)
local extensions = {
	"PlayerHud"
}
local RPCS = {
	"rpc_set_current_location"
}
HUDSystem.init = function (self, entity_system_creation_context, system_name)
	HUDSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self.network_transmit = Managers.state.network.network_transmit

	return 
end
HUDSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
	self.network_transmit = nil

	return 
end
HUDSystem.set_ingame_ui = function (self, ingame_ui)
	self.ingame_ui = ingame_ui

	return 
end
HUDSystem.rpc_set_current_location = function (self, sender, unit_id, location_id)
	local unit = self.unit_storage:unit(unit_id)

	if not Unit.alive(unit) then
		return 
	end

	local location = NetworkLookup.locations[location_id]
	local hud_extension = ScriptUnit.extension(unit, "hud_system")

	hud_extension.set_current_location(hud_extension, location)

	return 
end
HUDSystem.add_subtitle = function (self, speaker, subtitle)
	self.ingame_ui.ingame_hud.subtitle_gui:start_subtitle(speaker, subtitle)

	return 
end
HUDSystem.remove_subtitle = function (self, speaker)
	self.ingame_ui.ingame_hud.subtitle_gui:stop_subtitle(speaker)

	return 
end

return 
