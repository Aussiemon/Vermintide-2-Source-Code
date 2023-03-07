local function zone_name(end_zone_extension)
	return end_zone_extension._activation_name
end

local function has_end_zone_extension_name(end_zone_name, end_zone_extension)
	local current_end_zone_name = zone_name(end_zone_extension)

	return end_zone_name and end_zone_name == current_end_zone_name
end

local EndZoneExtensionTestify = {
	is_end_zone_activated = function (end_zone_name, end_zone_extension)
		if not has_end_zone_extension_name(end_zone_name, end_zone_extension) then
			return Testify.RETRY
		end

		return end_zone_extension._activated == true
	end
}

EndZoneExtensionTestify.teleport_player_to_end_zone_position = function (end_zone_name, end_zone_extension)
	if not has_end_zone_extension_name(end_zone_name, end_zone_extension) then
		return Testify.RETRY
	end

	local end_zone_position = Unit.local_position(end_zone_extension._unit, 0)
	local player_unit = Managers.player:local_player().player_unit
	local player_mover = Unit.mover(player_unit)
	end_zone_position.z = end_zone_position.z + 1

	Mover.set_position(player_mover, end_zone_position)
end

return EndZoneExtensionTestify
