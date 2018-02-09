NetworkUnit = NetworkUnit or {}
NetworkUnitData = NetworkUnitData or {}
local unit_network_data = NetworkUnitData
NetworkUnit.reset_unit_data = function ()
	NetworkUnitData = {}
	unit_network_data = NetworkUnitData

	return 
end
NetworkUnit.add_unit = function (unit)
	assert(unit_network_data[unit] == nil)

	unit_network_data[unit] = {}

	return 
end
NetworkUnit.remove_unit = function (unit)
	assert(unit_network_data[unit] ~= nil)

	unit_network_data[unit] = nil

	return 
end
NetworkUnit.reset_unit = function (unit)
	assert(unit_network_data[unit] ~= nil)

	local unit_data = unit_network_data[unit]
	unit_data.go_type = nil
	unit_data.go_id = nil
	unit_data.owner = nil
	unit_data.is_husk = nil

	return 
end
NetworkUnit.set_game_object_type = function (unit, go_type)
	unit_network_data[unit].go_type = go_type

	return 
end
NetworkUnit.game_object_type = function (unit)
	return unit_network_data[unit].go_type
end
NetworkUnit.game_object_type_level = function (unit)
	return unit_network_data[unit].go_type .. "_level"
end
NetworkUnit.set_game_object_id = function (unit, go_id)
	unit_network_data[unit].go_id = go_id

	return 
end
NetworkUnit.game_object_id = function (unit)
	return unit_network_data[unit].go_id
end
NetworkUnit.set_owner_peer_id = function (unit, peer_id)
	unit_network_data[unit].owner = peer_id

	return 
end
NetworkUnit.owner_peer_id = function (unit)
	return unit_network_data[unit].peer_id
end
NetworkUnit.set_is_husk_unit = function (unit, is_husk)
	unit_network_data[unit].is_husk = is_husk

	return 
end
NetworkUnit.is_husk_unit = function (unit)
	return not not unit_network_data[unit].is_husk
end
NetworkUnit.is_network_unit = function (unit)
	return unit_network_data[unit] ~= nil
end
NetworkUnit.on_extensions_registered = function (unit)
	Unit.set_flow_variable(unit, "is_husk_unit", NetworkUnit.is_husk_unit(unit))
	Unit.flow_event(unit, "on_extensions_registered")

	return 
end
NetworkUnit.on_game_object_sync_done = function (unit)
	Unit.set_flow_variable(unit, "is_husk_unit", NetworkUnit.is_husk_unit(unit))
	Unit.flow_event(unit, "on_game_object_sync_done")

	return 
end

return 
