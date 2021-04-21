require("scripts/settings/dlcs/morris/deus_power_up_settings")

local Snippets = require("scripts/tests/snippets")

local function deus_power_up_terror_event_test(nav_world, terror_event_name, main_path_point, bot_teleportation_data)
	Snippets.start_terror_event(terror_event_name)

	while not Snippets.terror_event_finished(terror_event_name) do
		Snippets.make_players_invicible()
		Snippets.set_player_unit_not_visible()
		Snippets.set_camera_to_observe_first_bot()

		local position = MainPathUtils.point_on_mainpath(nil, main_path_point)
		local teleport_pos = ConflictUtils.get_spawn_pos_on_circle(nav_world, position, 7, 7, 15)

		if teleport_pos then
			Snippets.teleport_player_to_position(teleport_pos)
		end

		Snippets.teleport_bots_forward_on_main_path_if_blocked(bot_teleportation_data)

		if Snippets.level_end_screen_displayed() then
			if Snippets.has_lost() then
				Snippets.fail_test("Test failed due to players/bot dying to the AI")
			else
				Snippets.fail_test("Test failed due to level ending before terror event finished")
			end
		end

		local start_time = os.clock()

		while os.clock() < start_time + 2 do
			Snippets.update_camera_to_follow_first_bot_rotation()
		end
	end

	Snippets.reset_terror_event_mixer()
end

DeusPowerUpTests = {
	default = deus_power_up_terror_event_test
}

return
