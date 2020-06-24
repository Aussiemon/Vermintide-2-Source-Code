local Snippets = require("scripts/tests/snippets")
TestCases = {
	smoke = function ()
		Testify:run_case(function (dt, t)
			Snippets.load_level("inn_level")
		end)
	end,
	load_level = function (level_key)
		Testify:run_case(function (dt, t)
			Snippets.load_level(level_key)
			Snippets.wait_for_cutscene_to_finish()
		end)
	end,
	equip_weapons = function ()
		Testify:run_case(function (dt, t)
			Snippets.load_level("military")
			Snippets.wait_for_cutscene_to_finish()
			Snippets.set_script_data({
				ai_bots_disabled = true,
				allow_same_bots = true
			})

			local weapons_wielded = {}
			local profiles = Snippets.request_profiles("heroes")

			for _, profile in ipairs(profiles) do
				for _, career_name in ipairs(profile.careers) do
					Snippets.set_player_profile(profile.name, career_name)
					Snippets.set_bot_profile(profile.name, career_name)
					Snippets.add_all_weapon_skins()

					for _, weapon in pairs(Snippets.request_weapons_for_career(career_name)) do
						local weapon_id = weapon.backend_id

						if not weapons_wielded[weapon_id] then
							printf("[Testify] Wielding weapon %s (%s)", weapon.data.display_name, weapon_id)

							weapons_wielded[weapon_id] = true

							Snippets.player_wield_weapon(weapon)
							Snippets.bot_wield_weapon(weapon)
							Snippets.sleep(1)
						end
					end
				end
			end
		end)
	end,
	load_all_weaves = function ()
		Testify:run_case(function ()
			Snippets.set_game_mode_to_weave()

			for weave_number = 1, 160, 1 do
				local weave_name = "weave_" .. weave_number

				Snippets.load_weave(weave_name)
			end
		end)
	end,
	run_through_level = function (level_key)
		Testify:run_case(function (dt, t)
			local result = ""

			Snippets.set_script_data({
				ai_bots_disabled = false
			})
			Snippets.set_telemetry_settings({
				send = true
			})
			Snippets.load_level(level_key)
			Snippets.wait_for_cutscene_to_finish()

			local last_player_teleportation_time = os.clock()
			local bots_stuck_data = {
				{
					Vector3Box(Vector3(-999, -999, -999)),
					os.time
				},
				{
					Vector3Box(Vector3(-999, -999, -999)),
					os.time
				},
				{
					Vector3Box(Vector3(-999, -999, -999)),
					os.time
				}
			}

			while not Snippets.level_finished() do
				Snippets.set_player_unit_not_visible()
				Snippets.set_camera_to_observe_first_bot()
				Snippets.teleport_blocked_bots_forward_on_main_path({
					bots_blocked_time_before_teleportation = 6,
					bots_teleportation_range = 21,
					bots_stuck_data = bots_stuck_data
				})
				Snippets.teleport_player_forward_on_main_path((os.clock() - last_player_teleportation_time) * 0.5)

				last_player_teleportation_time = os.clock()
				local timer = 0

				while timer < 0.1 do
					Snippets.make_player_and_one_bot_invicible()
					Snippets.update_camera_to_follow_first_bot_rotation()

					timer = timer + dt
				end
			end

			if Snippets.end_of_the_level_reached() then
				result = result .. "End of level reached"
			elseif Snippets.level_end_screen_displayed() then
				if Snippets.has_lost() then
					result = result .. "Defeated"
				else
					result = result .. "Victorious"
				end

				Snippets.close_level_end_screen()
			end

			Snippets.sleep(5)
			print("[Testify] Level finished!")

			return result
		end)
	end,
	run_through_weave = function (weave_number)
		Testify:run_case(function (dt, t)
			local result = ""

			Snippets.set_script_data({
				power_level_override = 1600,
				ai_bots_disabled = false
			})

			local weave_name = "weave_" .. weave_number
			local end_zone_name = Snippets.get_weave_end_zone(weave_number)

			Snippets.set_game_mode_to_weave()
			Snippets.load_weave(weave_name)

			local end_screen_displayed = false
			local bots_stuck_data = {
				{
					Vector3Box(Vector3(-999, -999, -999)),
					os.time
				},
				{
					Vector3Box(Vector3(-999, -999, -999)),
					os.time
				},
				{
					Vector3Box(Vector3(-999, -999, -999)),
					os.time
				}
			}

			while not Snippets.end_of_the_level_reached() do
				end_screen_displayed = Snippets.level_end_screen_displayed()

				if end_screen_displayed then
					if Snippets.weave_remaining_time() == 0 then
						result = result .. "Out of time, Phase 1"

						break
					end

					result = result .. "Defeated Phase 1"

					break
				end

				Snippets.set_player_unit_not_visible()
				Snippets.set_camera_to_observe_first_bot()
				Snippets.teleport_blocked_bots_forward_on_main_path({
					bots_blocked_time_before_teleportation = 6,
					bots_teleportation_range = 21,
					bots_stuck_data = bots_stuck_data
				})
				Snippets.teleport_player_forward_on_main_path(0)

				local timer = 0

				while timer < 0.3 do
					Snippets.make_players_invicible()
					Snippets.update_camera_to_follow_first_bot_rotation()

					timer = timer + dt
				end
			end

			if not Snippets.end_zone_activated(end_zone_name) then
				result = result .. "Cheat to complete objectives\n"
			end

			while not Snippets.end_zone_activated(end_zone_name) do
				end_screen_displayed = Snippets.level_end_screen_displayed()

				if end_screen_displayed then
					if Snippets.weave_remaining_time() == 0 then
						result = result .. "Out of time, Phase 1"

						break
					end

					result = result .. "Defeated Phase 1"

					break
				end

				Snippets.set_player_unit_not_visible()
				Snippets.set_camera_to_observe_first_bot()
				Snippets.spawn_essence_on_first_bot_position()

				local timer = 0

				while timer < 0.1 do
					Snippets.make_players_invicible()
					Snippets.update_camera_to_follow_first_bot_rotation()

					timer = timer + dt
				end
			end

			Snippets.teleport_player_to_end_zone_position(end_zone_name)

			local bots_stuck_data = {
				{
					Vector3Box(Vector3(-999, -999, -999)),
					os.time
				},
				{
					Vector3Box(Vector3(-999, -999, -999)),
					os.time
				},
				{
					Vector3Box(Vector3(-999, -999, -999)),
					os.time
				}
			}

			while not end_screen_displayed do
				Snippets.set_player_unit_not_visible()
				Snippets.set_camera_to_observe_first_bot()

				if Snippets.are_bots_blocked(bots_stuck_data) and Snippets.get_active_weave_phase() == 2 then
					Snippets.teleport_player_randomly_on_main_path()
				end

				local timer = 0

				while timer < 0.1 do
					Snippets.make_players_invicible()
					Snippets.update_camera_to_follow_first_bot_rotation()

					timer = timer + dt
				end

				if Snippets.level_end_screen_displayed() then
					if Snippets.weave_remaining_time() == 0 then
						result = result .. "Out of time, Phase 2"
					elseif Snippets.has_lost() then
						result = result .. "Defeated Phase 2"
					else
						result = result .. "Victorious"
					end

					end_screen_displayed = true
				end
			end

			Snippets.make_game_ready_for_next_weave()

			return result
		end)
	end,
	load_level_environment_variations = function (level_key)
		Testify:run_case(function ()
			local output = "Variations loaded:\n"
			local weather_variations = Snippets.get_level_weather_variations(level_key)

			if type(weather_variations) ~= "table" or next(weather_variations) == nil then
				output = output .. "None"

				print(output)

				return output
			end

			for variation_id, variation_name in ipairs(weather_variations) do
				Snippets.load_level_with_variation({
					level = level_key,
					variation_id = variation_id
				})
				Snippets.wait_for_cutscene_to_finish()

				output = output .. variation_name .. " "
			end

			print(output)

			return output
		end)
	end
}

return
