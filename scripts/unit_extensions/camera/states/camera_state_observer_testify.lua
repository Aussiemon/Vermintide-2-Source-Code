-- chunkname: @scripts/unit_extensions/camera/states/camera_state_observer_testify.lua

local CameraStateObserverTestify = {
	set_camera_to_observe_first_bot = function (camera_state_observer)
		local first_bot = Managers.player:bots()[1]
		local party = Managers.party:get_party_from_unique_id(first_bot:unique_id())
		local side = Managers.state.side.side_by_party[party] or Managers.state.side:get_side_from_name("heroes")

		if side then
			local observe_unit = CameraStateHelper.get_valid_unit_to_observe(true, side, first_bot.player_unit)

			camera_state_observer:refresh_follow_unit(observe_unit)
		end
	end,
}

return CameraStateObserverTestify
