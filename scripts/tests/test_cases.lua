local Snippets = require("scripts/tests/snippets")
TestCases = {
	smoke = function ()
		Testify:run_case(function (dt, t)
			Snippets.load_level("inn_level")
		end)
	end,
	load_level = function (level_key, skip_cinematic)
		Testify:run_case(function (dt, t)
			Snippets.load_level(level_key)

			if not skip_cinematic then
				Snippets.wait_for_cutscene_to_finish()
			end
		end)
	end,
	dedicated_server_smoke = function ()
		Testify:run_case(function (dt, t)
			Snippets.wait_for_state_ingame_reached()
		end)
	end,
	load_pvp_level = function (level_key)
		Testify:run_case(function (dt, t)
			Snippets.load_level(level_key)
			Snippets.wait_for_player_to_spawn()
			Snippets.wait(5)
		end)
	end,
	equip_weapons = function (is_magic)
		Testify:run_case(function (dt, t)
			if is_magic then
				Snippets.set_game_mode_to_weave()
				Snippets.load_weave("weave_1")
			else
				Snippets.load_level("military")
				Snippets.wait_for_cutscene_to_finish()
			end

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
					Snippets.wait_for_players_inventory_ready()

					local weapons = nil

					if is_magic then
						weapons = Snippets.request_magic_weapons_for_career(career_name)
					else
						weapons = Snippets.request_non_magic_weapons_for_career(career_name)
					end

					for _, weapon in pairs(weapons) do
						local weapon_id = weapon.backend_id

						if not weapons_wielded[weapon_id] then
							printf("[Testify] Wielding weapon %s (%s)", weapon.data.display_name, weapon_id)

							weapons_wielded[weapon_id] = true

							Snippets.player_wield_weapon(weapon)
							Snippets.bot_wield_weapon(weapon)
						end
					end
				end
			end
		end)
	end
}

TestCases.equip_magic_weapons = function ()
	TestCases.equip_weapons(true)
end

TestCases.load_all_weaves = function ()
	Testify:run_case(function ()
		Snippets.set_game_mode_to_weave()

		for weave_number = 1, 160, 1 do
			local weave_name = "weave_" .. weave_number

			Snippets.load_weave(weave_name)
			Snippets.wait(4)
		end
	end)
end

TestCases.load_weave = function (weave_number)
	Testify:run_case(function ()
		Snippets.set_game_mode_to_weave()

		local weave_name = "weave_" .. weave_number

		Snippets.load_weave(weave_name)
		Snippets.wait(4)
	end)
end

TestCases.run_through_level = function (case_settings, skip_cinematic)
	Testify:run_case(function (dt, t)
		local result = ""

		Snippets.set_script_data({
			power_level_override = 1600,
			ai_bots_disabled = false
		})

		local settings = cjson.decode(case_settings or "{}")
		local level_key = settings.level_key
		local memory_usage = settings.memory_usage

		Snippets.set_telemetry_settings({
			send = true
		})
		Snippets.load_level(level_key)

		if not skip_cinematic then
			Snippets.wait_for_cutscene_to_finish()
		end

		local main_path_point = 0
		local total_main_path_distance = Snippets.total_main_path_distance()
		local last_player_teleportation_time = os.clock()
		local player_teleportation_speed_factor = 2 * GLOBAL_TIME_SCALE
		local measurement_count = 0
		local number_of_measurements = 3
		local main_path_increments = (total_main_path_distance - 10) / (number_of_measurements - 1)
		local next_memory_measure_point = 0
		local bots_stuck_data = {}

		for i = 1, 3, 1 do
			bots_stuck_data[i] = {
				Vector3Box(Vector3(-999, -999, -999)),
				os.time()
			}
		end

		local bot_teleportation_data = {
			main_path_point = 0,
			bots_blocked_time_before_teleportation = 15,
			bots_blocked_distance = 2,
			bots_stuck_data = bots_stuck_data
		}

		while not Snippets.level_end_screen_displayed() and main_path_point < total_main_path_distance - 10 do
			Snippets.set_player_unit_not_visible()
			Snippets.set_camera_to_observe_first_bot()

			local delta_time = os.clock() - last_player_teleportation_time
			last_player_teleportation_time = os.clock()
			local player_point = Snippets.closest_travel_distance_to_player()

			if main_path_point < player_point then
				main_path_point = player_point or main_path_point
			end

			main_path_point = main_path_point + player_teleportation_speed_factor * delta_time

			Snippets.teleport_player_to_main_path_point(main_path_point)
			Snippets.teleport_bots_forward_on_main_path_if_blocked(bot_teleportation_data)

			bot_teleportation_data.main_path_point = main_path_point

			if memory_usage and next_memory_measure_point < main_path_point and measurement_count < number_of_measurements then
				measurement_count = measurement_count + 1
				next_memory_measure_point = next_memory_measure_point + main_path_increments

				Snippets.memory_usage(measurement_count)
			end

			Snippets.make_player_and_two_bots_invicible()

			local timer = 0

			while timer < 0.1 do
				Snippets.update_camera_to_follow_first_bot_rotation()

				timer = timer + dt
			end
		end

		if Snippets.level_end_screen_displayed() then
			if Snippets.has_lost() then
				result = result .. "Defeated"
			else
				result = result .. "Victorious"
			end

			Snippets.close_level_end_screen()
		else
			result = result .. "End of level reached"
		end

		Snippets.wait(5)
		print("[Testify] Level finished!")

		return result
	end)
end

TestCases.run_through_weave = function (case_settings)
	Testify:run_case(function (dt, t)
		local result = ""

		Snippets.set_script_data({
			power_level_override = 1600,
			ai_bots_disabled = false
		})

		local settings = cjson.decode(case_settings or "{}")
		local memory_usage = settings.memory_usage
		local weave_number = settings.weave_number

		Snippets.set_telemetry_settings({
			send = true
		})

		local weave_name = "weave_" .. weave_number
		local end_zone_name = Snippets.get_weave_end_zone(weave_number)

		Snippets.set_game_mode_to_weave()
		Snippets.load_weave(weave_name)

		local end_screen_displayed = false
		local main_path_point = 0
		local total_main_path_distance = Snippets.total_main_path_distance()
		local last_player_teleportation_time = os.clock()
		local player_teleportation_speed_factor = 1 * GLOBAL_TIME_SCALE
		local measurement_count = 0
		local number_of_measurements = 3
		local main_path_increments = (total_main_path_distance - 10) / (number_of_measurements - 1)
		local next_memory_measure_point = 0
		local bots_stuck_data = {}

		for i = 1, 3, 1 do
			bots_stuck_data[i] = {
				Vector3Box(Vector3(-999, -999, -999)),
				os.time()
			}
		end

		local bot_teleportation_data = {
			main_path_point = 0,
			bots_blocked_time_before_teleportation = 15,
			bots_blocked_distance = 2,
			bots_stuck_data = bots_stuck_data
		}

		while not Snippets.level_end_screen_displayed() and main_path_point < total_main_path_distance - 10 do
			Snippets.set_player_unit_not_visible()
			Snippets.set_camera_to_observe_first_bot()
			Snippets.teleport_player_to_main_path_point(main_path_point)
			Snippets.teleport_bots_forward_on_main_path_if_blocked(bot_teleportation_data)

			main_path_point = main_path_point + (os.clock() - last_player_teleportation_time) * player_teleportation_speed_factor
			last_player_teleportation_time = os.clock()
			bot_teleportation_data.main_path_point = main_path_point

			if memory_usage and next_memory_measure_point < main_path_point and measurement_count < number_of_measurements then
				measurement_count = measurement_count + 1
				next_memory_measure_point = next_memory_measure_point + main_path_increments

				Snippets.memory_usage(measurement_count)
			end

			Snippets.make_players_invicible()

			local timer = 0

			while timer < 0.1 do
				Snippets.update_camera_to_follow_first_bot_rotation()

				timer = timer + dt
			end
		end

		if Snippets.level_end_screen_displayed() then
			if Snippets.weave_remaining_time() == 0 then
				result = result .. "Out of time, Phase 1"
			else
				result = result .. "Defeated Phase 1"
			end
		end

		if not Snippets.is_end_zone_activated(end_zone_name) then
			result = result .. "Cheat to complete objectives\n"
		end

		while not Snippets.is_end_zone_activated(end_zone_name) do
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
			Snippets.weave_spawn_essence_on_first_bot_position()
			Snippets.make_players_invicible()

			local timer = 0

			while timer < 0.1 do
				Snippets.update_camera_to_follow_first_bot_rotation()

				timer = timer + dt
			end
		end

		Snippets.teleport_player_to_end_zone_position(end_zone_name)

		while not end_screen_displayed do
			Snippets.set_player_unit_not_visible()
			Snippets.set_camera_to_observe_first_bot()

			if Snippets.are_bots_blocked(bot_teleportation_data) and Snippets.get_active_weave_phase() == 2 then
				Snippets.teleport_player_randomly_on_main_path()
			end

			Snippets.make_players_invicible()

			local timer = 0

			while timer < 0.1 do
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
end

TestCases.load_level_environment_variations = function (level_key)
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

TestCases.measure_performance = function (level_key, skip_cinematic)
	Testify:run_case(function ()
		Snippets.disable_ai()
		Snippets.disable_level_intro_dialogue()
		Snippets.load_level(level_key)

		if not skip_cinematic then
			Snippets.wait_for_cutscene_to_finish()
		end

		Snippets.set_telemetry_settings({
			send = true
		})

		local NB_POINTS = 10
		local TIME_TO_WAIT = 2
		local ROTATIONS = {
			{
				z = -90,
				x = 0,
				y = 0
			},
			{
				z = 0,
				x = 0,
				y = 0
			},
			{
				z = 90,
				x = 0,
				y = 0
			},
			{
				z = 180,
				x = 0,
				y = 0
			}
		}
		local main_path_points = Snippets.get_main_path_points(NB_POINTS)

		Snippets.activate_free_flight()

		for i = 1, NB_POINTS, 1 do
			for j = 1, #ROTATIONS, 1 do
				Snippets.move_free_flight_camera({
					position = main_path_points[i],
					rotation = ROTATIONS[j]
				})
				Snippets.start_measure_fps()
				Snippets.wait(TIME_TO_WAIT)
				Snippets.stop_measure_fps(string.format("%d.%d", i, j))
			end
		end
	end)
end

TestCases.measure_deus_performance = function (level_key)
	TestCases.measure_performance(level_key, true)
end

TestCases.run_through_deus_level = function (case_settings)
	TestCases.run_through_level(case_settings, true)
end

TestCases.run_through_deus_level_terror_event = function (level_key, terror_event_name)
	Testify:run_case(function (dt, t)
		local terror_event_name = terror_event_name or "deus_TEST_ALL_BREED"
		local result = ""

		Snippets.load_level(level_key)
		Snippets.set_script_data({
			insta_death = true,
			disable_external_velocity = true,
			disable_vortex_attraction = true,
			disable_catapulting = true,
			ai_terror_events_disabled = true,
			debug_terror = true,
			ai_bots_disabled = false,
			infinite_ammo = true,
			power_level_override = 1600,
			only_allowed_terror_event = terror_event_name
		})

		local nav_world = Managers.state.entity:system("ai_system"):nav_world()
		local peaks = Snippets.peaks()
		local peak_travel_distance = peaks[#peaks]
		local main_path_point = peak_travel_distance
		local total_main_path_distance = Snippets.total_main_path_distance()
		main_path_point = math.clamp(main_path_point, 0, total_main_path_distance - 1)
		local bots_stuck_data = {}

		for i = 1, 3, 1 do
			bots_stuck_data[i] = {
				Vector3Box(Vector3(-999, -999, -999)),
				os.time()
			}
		end

		local bot_teleportation_data = {
			bots_blocked_time_before_teleportation = 15,
			bots_blocked_distance = 2,
			bots_stuck_data = bots_stuck_data,
			main_path_point = main_path_point
		}

		Snippets.make_players_invicible()
		Snippets.set_player_unit_not_visible()
		Snippets.set_camera_to_observe_first_bot()
		Snippets.teleport_player_to_main_path_point(main_path_point)

		local timer = 0

		while timer < 0.1 do
			Snippets.update_camera_to_follow_first_bot_rotation()

			timer = timer + dt
		end

		Snippets.add_buffs_to_heroes({
			"ledge_rescue",
			"bad_breath"
		})
		Snippets.start_terror_event(terror_event_name)

		local terror_event_triggered_time = os.clock()
		local player_position = vector_string(Snippets.get_player_current_position())

		printf("[Testify] Terror event triggered at position: %s", player_position)

		while true do
			if Snippets.terror_event_finished(terror_event_name) then
				break
			end

			local position = MainPathUtils.point_on_mainpath(nil, main_path_point)
			local teleport_pos = ConflictUtils.get_spawn_pos_on_circle(nav_world, position, 15, 7, 15)

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

			Snippets.wait(2)
		end

		local terror_event_duration = os.clock() - terror_event_triggered_time
		result = result .. string.format("Terror event finished after %ss", terror_event_duration)

		Snippets.wait(5)
		print("[Testify] Level finished!")

		return result
	end)
end

TestCases.run_through_pvp_level = function (case_settings)
	Testify:run_case(function (dt, t)
		local result = ""

		Snippets.set_script_data({
			power_level_override = 1600,
			ai_bots_disabled = false
		})

		local settings = cjson.decode(case_settings or "{}")
		local level_key = settings.level_key
		local memory_usage = settings.memory_usage

		if memory_usage then
			Snippets.set_telemetry_settings({
				send = true
			})
		end

		Snippets.load_level(level_key)

		local main_path_point = 0
		local total_main_path_distance = Snippets.total_main_path_distance()
		local last_player_teleportation_time = os.clock()
		local player_teleportation_speed_factor = 2 * GLOBAL_TIME_SCALE
		local measurement_count = 0
		local number_of_measurements = 3
		local main_path_increments = (total_main_path_distance - 10) / (number_of_measurements - 1)
		local next_memory_measure_point = 0
		local bots_stuck_data = {}

		for i = 1, 3, 1 do
			bots_stuck_data[i] = {
				Vector3Box(Vector3(-999, -999, -999)),
				os.time()
			}
		end

		local bot_teleportation_data = {
			main_path_point = 0,
			bots_blocked_time_before_teleportation = 15,
			bots_blocked_distance = 2,
			bots_stuck_data = bots_stuck_data
		}

		Snippets.versus_objective_add_time(3000)

		local has_lost = false

		while not has_lost and main_path_point < total_main_path_distance - 10 do
			Snippets.set_player_unit_not_visible()
			Snippets.set_camera_to_observe_first_bot()
			Snippets.teleport_player_to_main_path_point(main_path_point)
			Snippets.teleport_bots_forward_on_main_path_if_blocked(bot_teleportation_data)

			main_path_point = main_path_point + (os.clock() - last_player_teleportation_time) * player_teleportation_speed_factor
			last_player_teleportation_time = os.clock()
			bot_teleportation_data.main_path_point = main_path_point

			if memory_usage and next_memory_measure_point < main_path_point and measurement_count < number_of_measurements then
				measurement_count = measurement_count + 1
				next_memory_measure_point = next_memory_measure_point + main_path_increments

				Snippets.memory_usage(measurement_count)
			end

			Snippets.make_player_and_two_bots_invicible()

			local objective_type = Snippets.versus_objective_type()
			local objective_data = Snippets.versus_current_objective_position()

			if objective_type == "objective not handled by Testify" then
				Snippets.versus_complete_objectives()
			elseif objective_data.main_path_point < main_path_point then
				Snippets.teleport_player_to_position(objective_data.position)

				if objective_type == "capture point" then
					local objective_name = Snippets.versus_objective_name()

					while objective_name == Snippets.versus_objective_name() do
						Snippets.update_camera_to_follow_first_bot_rotation()

						if Snippets.versus_has_lost() then
							break
						end
					end
				elseif objective_type == "interact" then
					Snippets.versus_objective_simulate_interaction()
				end
			end

			local timer = 0

			while timer < 0.1 do
				Snippets.update_camera_to_follow_first_bot_rotation()

				timer = timer + dt
			end

			has_lost = Snippets.versus_has_lost() == true
		end

		if has_lost then
			result = result .. "Defeated"
		else
			result = result .. "End of level reached"
		end

		Snippets.wait(5)
		print("[Testify] Level finished!")

		return result
	end)
end

TestCases.spawn_all_enemies = function (case_settings)
	Testify:run_case(function (dt, t)
		local result = ""
		local minions_auto_killed = {}
		local spawned_minions = {}
		local settings = cjson.decode(case_settings or "{}")
		local kill_timer = settings.kill_timer or 30
		local spawn_simultaneously = settings.spawn_simultaneously or true
		local difficulty = settings.difficulty or "hard"

		Snippets.set_difficulty(difficulty)
		Snippets.load_level("plaza")
		Snippets.wait_for_cutscene_to_finish()
		Snippets.set_script_data({
			power_level_override = 1600,
			ai_bots_disabled = false
		})
		Snippets.make_players_invicible()

		local player_current_position = Snippets.get_player_current_position()
		local spawn_position_offset = {
			z = 1,
			x = 8,
			y = -1
		}
		local boxed_spawn_position = Vector3Box(player_current_position.x + spawn_position_offset.x, player_current_position.y + spawn_position_offset.y, player_current_position.z + spawn_position_offset.z)
		local breeds = Snippets.get_all_breeds()

		for breed_name, breed_data in pairs(breeds) do
			local minion = {
				breed_name = breed_name,
				breed_data = breed_data,
				boxed_spawn_position = boxed_spawn_position
			}

			printf("[Testify] " .. breed_name .. " spawned")
			Snippets.spawn_unit(minion)

			minion.unit = Snippets.get_unit_of_breed(breed_name)

			if spawn_simultaneously then
				table.insert(spawned_minions, minion)
			else
				local is_minion_alive = nil
				local minion_time_of_spawn = os.clock()

				while kill_timer > os.clock() - minion_time_of_spawn do
					is_minion_alive = Snippets.is_unit_alive(minion.unit)

					if not is_minion_alive then
						break
					end
				end

				if is_minion_alive then
					local minion_health_values = Snippets.get_unit_health_values(minion.unit)
					local output = breed_name .. " " .. minion_health_values.current_health .. "/" .. minion_health_values.max_health

					printf("[Testify] " .. breed_name .. " has been executed")
					Snippets.kill_unit(minion.unit)
					table.insert(minions_auto_killed, output)
				end
			end
		end

		local wait_duration = (spawn_simultaneously and kill_timer) or 5

		Snippets.wait(wait_duration)

		if spawn_simultaneously then
			for _, minion in pairs(spawned_minions) do
				local is_minion_alive = Snippets.is_unit_alive(minion.unit)

				if is_minion_alive then
					local breed_name = minion.breed_name
					local minion_health_values = Snippets.get_unit_health_values(minion.unit)
					local output = breed_name .. " " .. minion_health_values.current_health .. "/" .. minion_health_values.max_health

					printf("[Testify] " .. breed_name .. " has been executed")
					Snippets.kill_unit(minion.unit)
					table.insert(minions_auto_killed, output)
				end
			end

			Snippets.destroy_all_units()
		end

		if not spawn_simultaneously and not table.is_empty(minions_auto_killed) then
			result = "-Bots were unable to kill: " .. table.concat(minions_auto_killed, ", ")
		end

		if result == "" then
			result = "All minion units were spawned and killed"
		end

		return result
	end)
end

TestCases.equip_deus_power_ups = function (case_settings)
	Testify:run_case(function (dt, t)
		local settings = cjson.decode(case_settings or "{}")
		local power_up_type = settings.power_up_type
		local terror_event_name = settings.terror_event_name
		local level_key = settings.level_key
		local profile_name = settings.profile_name
		local career_name = settings.career_name

		Snippets.load_level(level_key)
		Snippets.set_script_data({
			disable_catapulting = true,
			disable_external_velocity = true,
			disable_vortex_attraction = true,
			ai_terror_events_disabled = true,
			debug_terror = true,
			ai_bots_disabled = false,
			infinite_ammo = true,
			power_level_override = 1600,
			only_allowed_terror_event = terror_event_name
		})

		local nav_world = Managers.state.entity:system("ai_system"):nav_world()
		local peaks = Snippets.peaks()
		local peak_travel_distance = peaks[#peaks]
		local main_path_point = peak_travel_distance
		local total_main_path_distance = Snippets.total_main_path_distance()
		main_path_point = math.clamp(main_path_point, 0, total_main_path_distance - 1)
		local bots_stuck_data = {}

		for i = 1, 3, 1 do
			bots_stuck_data[i] = {
				Vector3Box(Vector3(-999, -999, -999)),
				os.time()
			}
		end

		local bot_teleportation_data = {
			bots_blocked_time_before_teleportation = 15,
			bots_blocked_distance = 2,
			bots_stuck_data = bots_stuck_data,
			main_path_point = main_path_point
		}
		local power_up_tests = nil

		if power_up_type == "talent" then
			power_up_tests = Snippets.get_available_deus_talent_power_up_tests()
		elseif power_up_type == "generic" then
			power_up_tests = Snippets.get_available_deus_generic_power_up_tests()
		end

		for rarity, powerup_tests_for_rarity in pairs(power_up_tests) do
			for power_up_name, power_up_test_function in pairs(powerup_tests_for_rarity) do
				Snippets.set_player_profile(profile_name, career_name)
				Snippets.set_bot_profile(profile_name, career_name)
				Snippets.wait_for_players_inventory_ready()
				Snippets.add_buffs_to_heroes({
					"ledge_rescue",
					"bad_breath"
				})
				Snippets.activate_bots_deus_power_up(power_up_name, rarity)
				Snippets.activate_player_deus_power_up(power_up_name, rarity)
				printf("[Testify] Testing %s: for career %s", power_up_name, career_name)
				power_up_test_function(nav_world, terror_event_name, main_path_point, bot_teleportation_data)
				Snippets.reset_deus_power_ups()
			end
		end

		print("[Testify] All deus power ups were tested!")

		local result = string.format("All %s power-ups were test", power_up_type)

		return result
	end)
end

TestCases.equip_hats = function ()
	Testify:run_case(function (dt, t)
		Snippets.load_level("inn_level")
		Snippets.add_all_hats()

		local profiles = Snippets.request_profiles("heroes")

		for _, profile in ipairs(profiles) do
			for _, career_name in ipairs(profile.careers) do
				Snippets.set_player_profile(profile.name, career_name)
				Snippets.wait_for_players_inventory_ready()
				Snippets.open_hero_view()
				Snippets.open_cosmetics_inventory()
				Snippets.equip_hats()
				Snippets.close_hero_view()
			end
		end
	end)
end

return
