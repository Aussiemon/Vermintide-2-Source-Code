require("scripts/settings/dlcs/morris/deus_power_up_settings")

local function deus_power_up_terror_event_test(nav_world, terror_event_name, main_path_point, bot_teleportation_data)
	Testify:make_request("start_terror_event", terror_event_name)

	while not Testify:make_request("terror_event_finished", terror_event_name) do
		Testify:make_request("make_players_invicible")
		Testify:make_request("set_player_unit_not_visible")
		Testify:make_request("set_camera_to_observe_first_bot")

		local position = MainPathUtils.point_on_mainpath(nil, main_path_point)
		local teleport_pos = ConflictUtils.get_spawn_pos_on_circle(nav_world, position, 7, 7, 15)

		if teleport_pos then
			local boxed_position = Vector3Box(teleport_pos)

			Testify:make_request("teleport_player_to_position", boxed_position)
		end

		Testify:make_request("teleport_bots_forward_on_main_path_if_blocked", bot_teleportation_data)

		if Testify:make_request("level_end_screen_displayed") then
			if Testify:make_request("has_lost") then
				Testify:make_request("fail_test", "Test failed due to players/bot dying to the AI")
			else
				Testify:make_request("fail_test", "Test failed due to level ending before terror event finished")
			end
		end

		local start_time = os.clock()

		while os.clock() < start_time + 2 do
			Testify:make_request("update_camera_to_follow_first_bot_rotation")
		end
	end

	Testify:make_request("reset_terror_event_mixer")
end

DeusPowerUpTests = {
	default = deus_power_up_terror_event_test
}
