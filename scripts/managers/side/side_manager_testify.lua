-- chunkname: @scripts/managers/side/side_manager_testify.lua

local SideManagerTestify = {
	num_human_players_on_side = function (side_manager, sideName)
		local side = side_manager:get_side_from_name("heroes")

		if not side then
			return Testify.RETRY
		end

		return table.size(side.PLAYER_UNITS)
	end,
}

return SideManagerTestify
