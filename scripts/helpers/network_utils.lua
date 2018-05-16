function mm_printf_force(format_text, ...)
	format_text = "[Matchmaking] " .. format_text

	printf(format_text, ...)
end

function mm_printf(format_text, ...)
	if script_data.matchmaking_debug then
		format_text = "[Matchmaking] " .. format_text

		printf(format_text, ...)
	end
end

script_data.matchmaking_debug = true
NetworkUtils = {
	network_safe_position = function (pos)
		local pos_min = NetworkConstants.position.min
		local pos_max = NetworkConstants.position.max
		local pos_x = pos.x
		local pos_y = pos.y
		local pos_z = pos.z
		local in_range_x = pos_min <= pos_x and pos_x <= pos_max
		local in_range_y = pos_min <= pos_y and pos_y <= pos_max
		local in_range_z = pos_min <= pos_z and pos_z <= pos_max
		local in_range = in_range_x and in_range_y and in_range_z

		return in_range
	end,
	get_network_safe_damage_hotjoin_sync = function (damage)
		local damage_min = NetworkConstants.damage_hotjoin_sync.min
		local damage_max = NetworkConstants.damage_hotjoin_sync.max
		damage = math.clamp(damage, damage_min, damage_max)

		return damage
	end,
	network_clamp_position = function (pos)
		local pos_constant = NetworkConstants.position
		local pos_min = pos_constant.min
		local pos_max = pos_constant.max

		return Vector3.clamp(pos, pos_min, pos_max)
	end
}

return
