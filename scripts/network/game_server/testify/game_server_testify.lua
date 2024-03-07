-- chunkname: @scripts/network/game_server/testify/game_server_testify.lua

local GameServerTestify = {
	wait_for_lobby_data_value = function (game_server, params)
		local key = params.key
		local value = params.value
		local lobby_value = game_server:lobby_data(key)

		if lobby_value ~= value then
			return Testify.RETRY
		end
	end,
}

return GameServerTestify
