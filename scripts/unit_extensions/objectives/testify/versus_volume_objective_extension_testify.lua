-- chunkname: @scripts/unit_extensions/objectives/testify/versus_volume_objective_extension_testify.lua

local VersusVolumeObjectiveExtensionTestify = {
	versus_volume_objective_get_num_players_inside = function (extension)
		if extension._volume_type == "all_alive_human_players_inside" then
			return extension:_get_num_players_inside()
		end

		local side = Managers.state.side:get_side_from_name("heroes")
		local num_players = table.size(side.PLAYER_AND_BOT_UNITS)
		local num_human_players = table.size(side.PLAYER_UNITS)
		local player_manager = Managers.player
		local num_bots = num_players - num_human_players

		return extension:_get_num_players_inside() - num_bots
	end,
}

return VersusVolumeObjectiveExtensionTestify
