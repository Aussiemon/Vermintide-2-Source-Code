local TestifyInput = require("scripts/tests/testify_input")
local TestifySnippets = require("scripts/tests/testify_snippets")
TestCases = {
	smoke = function ()
		Testify:run_case(function (dt, t)
			TestifySnippets.load_level({
				level_key = "inn_level"
			})
		end)
	end,
	load_level = function (level_key, skip_cinematic, wait_for_player_to_spawn)
		Testify:run_case(function (dt, t)
			TestifySnippets.load_level({
				level_key = level_key
			})

			if not skip_cinematic then
				Testify:make_request("wait_for_cutscene_to_finish")
			end

			if wait_for_player_to_spawn then
				Testify:make_request("wait_for_player_to_spawn")
			end
		end)
	end,
	wait_for_state_ingame_reached = function ()
		Testify:run_case(function (dt, t)
			Testify:make_request("wait_for_state_ingame_reached")
		end)
	end,
	equip_weapons = function (is_magic)
		Testify:run_case(function (dt, t)
			if is_magic then
				Testify:make_request("set_game_mode_to_weave")
				TestifySnippets.load_weave("weave_1")
			else
				TestifySnippets.load_level({
					level_key = "military"
				})
				Testify:make_request("wait_for_cutscene_to_finish")
			end

			Testify:make_request("clear_backend_inventory")
			Testify:make_request("wait_for_players_inventory_ready")
			TestifySnippets.set_script_data({
				ai_bots_disabled = true,
				allow_same_bots = true
			})

			local weapons_wielded = {}
			local profiles = Testify:make_request("request_profiles", "heroes")

			for _, profile in ipairs(profiles) do
				for _, career_name in ipairs(profile.careers) do
					TestifySnippets.set_player_profile(profile.name, career_name)
					TestifySnippets.set_bot_profile(profile.name, career_name)
					Testify:make_request("add_all_weapon_skins")
					Testify:make_request("wait_for_players_inventory_ready")

					local weapons = nil

					if is_magic then
						weapons = Testify:make_request("request_magic_weapons_for_career", career_name)
					else
						weapons = Testify:make_request("request_non_magic_weapons_for_career", career_name)
					end

					for _, weapon in pairs(weapons) do
						local weapon_id = weapon.backend_id

						if not weapons_wielded[weapon_id] then
							printf("[Testify] Wielding weapon %s (%s)", weapon.data.display_name, weapon_id)

							weapons_wielded[weapon_id] = true

							Testify:make_request("player_wield_weapon", weapon)
							Testify:make_request("wait_for_inventory_to_be_loaded")
							Testify:make_request("bot_wield_weapon", weapon)
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
		Testify:make_request("set_game_mode_to_weave")

		for weave_number = 1, 160 do
			local weave_name = "weave_" .. weave_number

			print("[Testify] Loading " .. weave_name)
			TestifySnippets.load_weave(weave_name)
			TestifySnippets.wait(4)
		end
	end)
end

TestCases.load_weave = function (weave_number)
	Testify:run_case(function ()
		Testify:make_request("set_game_mode_to_weave")

		local weave_name = "weave_" .. weave_number

		TestifySnippets.load_weave(weave_name)
		TestifySnippets.wait(4)
	end)
end

TestCases.run_through_level = function (case_settings, skip_cinematic)
	Testify:run_case(function (dt, t)
		local result = ""

		TestifySnippets.set_script_data({
			power_level_override = 1600,
			ai_bots_disabled = false
		})

		local settings = cjson.decode(case_settings or "{}")
		local level_key = settings.level_key
		local memory_usage = settings.memory_usage

		TestifySnippets.load_level({
			level_key = level_key
		})

		if not skip_cinematic then
			Testify:make_request("wait_for_cutscene_to_finish")
		end

		local main_path_point = 0
		local total_main_path_distance = Testify:make_request("total_main_path_distance")
		local last_player_teleportation_time = os.clock()
		local player_teleportation_speed_factor = 2 * GLOBAL_TIME_SCALE
		local measurement_count = 0
		local number_of_measurements = 3
		local main_path_increments = (total_main_path_distance - 10) / (number_of_measurements - 1)
		local next_memory_measure_point = 0
		local bots_stuck_data = {}

		for i = 1, 3 do
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

		while not Testify:make_request("level_end_screen_displayed") and main_path_point < total_main_path_distance - 10 do
			Testify:make_request("set_player_unit_not_visible")
			Testify:make_request("set_camera_to_observe_first_bot")

			local delta_time = os.clock() - last_player_teleportation_time
			last_player_teleportation_time = os.clock()
			local player_point = Testify:make_request("closest_travel_distance_to_player")

			if main_path_point < player_point then
				main_path_point = player_point or main_path_point
			end

			main_path_point = main_path_point + player_teleportation_speed_factor * delta_time

			Testify:make_request("teleport_player_to_main_path_point", main_path_point)
			Testify:make_request("teleport_bots_forward_on_main_path_if_blocked", bot_teleportation_data)

			bot_teleportation_data.main_path_point = main_path_point

			if memory_usage and next_memory_measure_point < main_path_point and measurement_count < number_of_measurements then
				measurement_count = measurement_count + 1
				next_memory_measure_point = next_memory_measure_point + main_path_increments

				Testify:make_request("memory_usage", measurement_count)
			end

			Testify:make_request("make_player_and_two_bots_invicible")

			local timer = 0

			while timer < 0.1 do
				Testify:make_request("update_camera_to_follow_first_bot_rotation")

				timer = timer + dt
			end
		end

		if Testify:make_request("level_end_screen_displayed") then
			if Testify:make_request("has_lost") then
				result = result .. "Defeated"
			else
				result = result .. "Victorious"
			end

			Testify:make_request("close_level_end_screen")
		else
			result = result .. "End of level reached"
		end

		Testify:make_request("post_telemetry_events")
		TestifySnippets.wait(5)
		print("[Testify] Level finished!")

		return result
	end)
end

TestCases.run_through_weave = function (case_settings)
	Testify:run_case(function (dt, t)
		local result = ""

		TestifySnippets.set_script_data({
			power_level_override = 1600,
			ai_bots_disabled = false
		})

		local settings = cjson.decode(case_settings or "{}")
		local memory_usage = settings.memory_usage
		local weave_number = settings.weave_number
		local weave_name = "weave_" .. weave_number
		local end_zone_name = Testify:make_request("get_weave_end_zone", weave_number)

		Testify:make_request("set_game_mode_to_weave")
		TestifySnippets.load_weave(weave_name)

		local end_screen_displayed = false
		local main_path_point = 0
		local total_main_path_distance = Testify:make_request("total_main_path_distance")
		local last_player_teleportation_time = os.clock()
		local player_teleportation_speed_factor = 1 * GLOBAL_TIME_SCALE
		local measurement_count = 0
		local number_of_measurements = 3
		local main_path_increments = (total_main_path_distance - 10) / (number_of_measurements - 1)
		local next_memory_measure_point = 0
		local bots_stuck_data = {}

		for i = 1, 3 do
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

		while not Testify:make_request("level_end_screen_displayed") and main_path_point < total_main_path_distance - 10 do
			Testify:make_request("set_player_unit_not_visible")
			Testify:make_request("set_camera_to_observe_first_bot")
			Testify:make_request("teleport_player_to_main_path_point", main_path_point)
			Testify:make_request("teleport_bots_forward_on_main_path_if_blocked", bot_teleportation_data)

			main_path_point = main_path_point + (os.clock() - last_player_teleportation_time) * player_teleportation_speed_factor
			last_player_teleportation_time = os.clock()
			bot_teleportation_data.main_path_point = main_path_point

			if memory_usage and next_memory_measure_point < main_path_point and measurement_count < number_of_measurements then
				measurement_count = measurement_count + 1
				next_memory_measure_point = next_memory_measure_point + main_path_increments

				Testify:make_request("memory_usage", measurement_count)
			end

			Testify:make_request("make_players_invicible")

			local timer = 0

			while timer < 0.1 do
				Testify:make_request("update_camera_to_follow_first_bot_rotation")

				timer = timer + dt
			end
		end

		if Testify:make_request("level_end_screen_displayed") then
			if Testify:make_request("weave_remaining_time") == 0 then
				result = result .. "Out of time, Phase 1"
			else
				result = result .. "Defeated Phase 1"
			end
		end

		if not Testify:make_request("is_end_zone_activated", end_zone_name) then
			result = result .. "Cheat to complete objectives\n"
		end

		while not Testify:make_request("is_end_zone_activated", end_zone_name) do
			end_screen_displayed = Testify:make_request("level_end_screen_displayed")

			if end_screen_displayed then
				if Testify:make_request("weave_remaining_time") == 0 then
					result = result .. "Out of time, Phase 1"

					break
				end

				result = result .. "Defeated Phase 1"

				break
			end

			Testify:make_request("set_player_unit_not_visible")
			Testify:make_request("set_camera_to_observe_first_bot")
			Testify:make_request("weave_spawn_essence_on_first_bot_position")
			Testify:make_request("make_players_invicible")

			local timer = 0

			while timer < 0.1 do
				Testify:make_request("update_camera_to_follow_first_bot_rotation")

				timer = timer + dt
			end
		end

		Testify:make_request("teleport_player_to_end_zone_position", end_zone_name)

		while not end_screen_displayed do
			Testify:make_request("set_player_unit_not_visible")
			Testify:make_request("set_camera_to_observe_first_bot")

			if Testify:make_request("are_bots_blocked", bot_teleportation_data) and Testify:make_request("get_active_weave_phase") == 2 then
				Testify:make_request("teleport_player_randomly_on_main_path")
			end

			Testify:make_request("make_players_invicible")

			local timer = 0

			while timer < 0.1 do
				Testify:make_request("update_camera_to_follow_first_bot_rotation")

				timer = timer + dt
			end

			if Testify:make_request("level_end_screen_displayed") then
				if Testify:make_request("weave_remaining_time") == 0 then
					result = result .. "Out of time, Phase 2"
				elseif Testify:make_request("has_lost") then
					result = result .. "Defeated Phase 2"
				else
					result = result .. "Victorious"
				end

				end_screen_displayed = true
			end
		end

		Testify:make_request("post_telemetry_events")
		Testify:make_request("make_game_ready_for_next_weave")

		return result
	end)
end

TestCases.load_level_environment_variations = function (level_key)
	Testify:run_case(function ()
		local output = "Variations loaded:\n"
		local weather_variations = Testify:make_request("get_level_weather_variations", level_key)

		if type(weather_variations) ~= "table" or next(weather_variations) == nil then
			output = output .. "None"

			print(output)

			return output
		end

		for variation_id, variation_name in ipairs(weather_variations) do
			local level_settings = {
				level_key = level_key,
				environment_variation_id = variation_id
			}

			TestifySnippets.load_level(level_settings)
			Testify:make_request("wait_for_cutscene_to_finish")

			output = output .. variation_name .. " "
		end

		print(output)

		return output
	end)
end

TestCases.measure_performance = function (level_key, skip_cinematic)
	Testify:run_case(function ()
		TestifySnippets.disable_ai()
		TestifySnippets.disable_level_intro_dialogue()
		TestifySnippets.load_level({
			level_key = level_key
		})

		if not skip_cinematic then
			Testify:make_request("wait_for_cutscene_to_finish")
		end

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
		local main_path_points = Testify:make_request("get_main_path_points", NB_POINTS)

		Testify:make_request("activate_free_flight")

		for i = 1, NB_POINTS do
			for j = 1, #ROTATIONS do
				Testify:make_request("move_free_flight_camera", {
					position = main_path_points[i],
					rotation = ROTATIONS[j]
				})
				Testify:make_request("start_measure_fps")
				TestifySnippets.wait(TIME_TO_WAIT)

				local point_id = string.format("%d.%d", i, j)

				Testify:make_request("stop_measure_fps", point_id)
			end
		end

		Testify:make_request("post_telemetry_events")
	end)
end

TestCases.measure_deus_performance = function (level_key)
	TestCases.measure_performance(level_key, true)
end

TestCases.run_through_deus_level = function (case_settings)
	TestCases.run_through_level(case_settings, true)
end

TestCases.run_through_deus_level_terror_event = function (level_key, terror_event_name, peak_offset)
	Testify:run_case(function (dt, t)
		terror_event_name = terror_event_name or "deus_TEST_ALL_BREED"
		peak_offset = peak_offset or 10
		local result = ""

		TestifySnippets.load_level({
			level_key = level_key
		})
		TestifySnippets.set_script_data({
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
		local peaks = Testify:make_request("peaks")
		local peak_travel_distance = peaks[#peaks]
		peak_travel_distance = peak_travel_distance + peak_offset
		local main_path_point = peak_travel_distance
		local total_main_path_distance = Testify:make_request("total_main_path_distance")
		main_path_point = math.clamp(main_path_point, 0, total_main_path_distance - 1)
		local bots_stuck_data = {}

		for i = 1, 3 do
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

		Testify:make_request("make_players_invicible")
		Testify:make_request("set_player_unit_not_visible")
		Testify:make_request("set_camera_to_observe_first_bot")
		Testify:make_request("teleport_player_to_main_path_point", main_path_point)

		local timer = 0

		while timer < 0.1 do
			Testify:make_request("update_camera_to_follow_first_bot_rotation")

			timer = timer + dt
		end

		Testify:make_request("add_buffs_to_heroes", {
			"ledge_rescue",
			"disable_rescue"
		})
		Testify:make_request("start_terror_event", terror_event_name)

		local terror_event_triggered_time = os.clock()
		local player_position = vector_string(Testify:make_request("get_player_current_position"))

		printf("[Testify] Terror event triggered at position: %s", player_position)

		while true do
			if Testify:make_request("terror_event_finished", terror_event_name) then
				break
			end

			local position = MainPathUtils.point_on_mainpath(nil, main_path_point)
			local teleport_pos = ConflictUtils.get_spawn_pos_on_circle(nav_world, position, 15, 7, 15)

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

			TestifySnippets.wait(2)
		end

		local terror_event_duration = os.clock() - terror_event_triggered_time
		result = result .. string.format("Terror event finished after %ss", terror_event_duration)

		TestifySnippets.wait(5)
		print("[Testify] Level finished!")

		return result
	end)
end

TestCases.run_through_pvp_level = function (case_settings)
	Testify:run_case(function (dt, t)
		local result = ""

		TestifySnippets.set_script_data({
			power_level_override = 1600,
			ai_bots_disabled = false
		})

		local settings = cjson.decode(case_settings or "{}")
		local level_key = settings.level_key
		local memory_usage = settings.memory_usage

		TestifySnippets.load_level({
			level_key = level_key
		})

		local main_path_point = 0
		local total_main_path_distance = Testify:make_request("total_main_path_distance")
		local last_player_teleportation_time = os.clock()
		local player_teleportation_speed_factor = 2 * GLOBAL_TIME_SCALE
		local measurement_count = 0
		local number_of_measurements = 3
		local main_path_increments = (total_main_path_distance - 10) / (number_of_measurements - 1)
		local next_memory_measure_point = 0
		local bots_stuck_data = {}

		for i = 1, 3 do
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

		Testify:make_request("versus_objective_add_time", 3000)

		local has_lost = false

		while not has_lost and main_path_point < total_main_path_distance - 10 do
			Testify:make_request("set_player_unit_not_visible")
			Testify:make_request("set_camera_to_observe_first_bot")
			Testify:make_request("teleport_player_to_main_path_point", main_path_point)
			Testify:make_request("teleport_bots_forward_on_main_path_if_blocked", bot_teleportation_data)

			main_path_point = main_path_point + (os.clock() - last_player_teleportation_time) * player_teleportation_speed_factor
			last_player_teleportation_time = os.clock()
			bot_teleportation_data.main_path_point = main_path_point

			if memory_usage and next_memory_measure_point < main_path_point and measurement_count < number_of_measurements then
				measurement_count = measurement_count + 1
				next_memory_measure_point = next_memory_measure_point + main_path_increments

				Testify:make_request("memory_usage", measurement_count)
			end

			Testify:make_request("make_player_and_two_bots_invicible")

			local objective_type = Testify:make_request("versus_objective_type")
			local objective_data = Testify:make_request("versus_current_objective_position")

			if objective_type == "objective not handled by Testify" then
				TestifySnippets.wait(1)
				Testify:make_request("versus_complete_objectives")
				TestifySnippets.wait(1)
			elseif objective_data.main_path_point < main_path_point then
				local boxed_position = Vector3Box(objective_data.position)

				Testify:make_request("teleport_player_to_position", boxed_position)

				if objective_type == "capture point" then
					local objective_name = Testify:make_request("versus_objective_name")

					while objective_name == Testify:make_request("versus_objective_name") do
						Testify:make_request("update_camera_to_follow_first_bot_rotation")

						if Testify:make_request("versus_has_lost") then
							break
						end
					end
				elseif objective_type == "interact" then
					Testify:make_request("versus_objective_simulate_interaction")
				end
			end

			local timer = 0

			while timer < 0.1 do
				Testify:make_request("update_camera_to_follow_first_bot_rotation")

				timer = timer + dt
			end

			has_lost = Testify:make_request("versus_has_lost") == true
		end

		if has_lost then
			result = result .. "Defeated"
		else
			result = result .. "End of level reached"
		end

		if memory_usage then
			Testify:make_request("post_telemetry_events")
		end

		TestifySnippets.wait(5)
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

		Testify:make_request("set_difficulty", difficulty)
		TestifySnippets.load_level({
			level_key = "plaza"
		})
		Testify:make_request("wait_for_cutscene_to_finish")
		TestifySnippets.set_script_data({
			power_level_override = 1600,
			ai_bots_disabled = false
		})
		Testify:make_request("make_players_invicible")

		local player_current_position = Testify:make_request("get_player_current_position")
		local spawn_position_offset = {
			z = 1,
			x = 8,
			y = -1
		}
		local boxed_spawn_position = Vector3Box(player_current_position.x + spawn_position_offset.x, player_current_position.y + spawn_position_offset.y, player_current_position.z + spawn_position_offset.z)
		local breeds = Testify:make_request("get_all_breeds")

		for breed_name, breed_data in pairs(breeds) do
			local minion = {
				breed_name = breed_name,
				breed_data = breed_data,
				boxed_spawn_position = boxed_spawn_position
			}

			printf("[Testify] " .. breed_name .. " spawned")
			Testify:make_request("spawn_unit", minion)

			minion.unit = Testify:make_request("get_unit_of_breed", breed_name)

			if spawn_simultaneously then
				table.insert(spawned_minions, minion)
			else
				local is_minion_alive = nil
				local minion_time_of_spawn = os.clock()

				while kill_timer > os.clock() - minion_time_of_spawn do
					is_minion_alive = Testify:make_request("is_unit_alive", minion.unit)

					if not is_minion_alive then
						break
					end
				end

				if is_minion_alive then
					local minion_health_values = Testify:make_request("get_unit_health_values", minion.unit)
					local output = breed_name .. " " .. minion_health_values.current_health .. "/" .. minion_health_values.max_health

					printf("[Testify] " .. breed_name .. " has been executed")
					Testify:make_request("kill_unit", minion.unit)
					table.insert(minions_auto_killed, output)
				end
			end
		end

		local wait_duration = spawn_simultaneously and kill_timer or 5

		TestifySnippets.wait(wait_duration)

		if spawn_simultaneously then
			for _, minion in pairs(spawned_minions) do
				local is_minion_alive = Testify:make_request("is_unit_alive", minion.unit)

				if is_minion_alive then
					local breed_name = minion.breed_name
					local minion_health_values = Testify:make_request("get_unit_health_values", minion.unit)
					local output = breed_name .. " " .. minion_health_values.current_health .. "/" .. minion_health_values.max_health

					printf("[Testify] " .. breed_name .. " has been executed")
					Testify:make_request("kill_unit", minion.unit)
					table.insert(minions_auto_killed, output)
				end
			end

			Testify:make_request("destroy_all_units")
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

		Testify:make_request("wait_for_state_ingame_reached")
		TestifySnippets.load_level({
			level_key = level_key
		})
		TestifySnippets.set_script_data({
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
		local peaks = Testify:make_request("peaks")
		local peak_travel_distance = peaks[#peaks]
		local main_path_point = peak_travel_distance
		local total_main_path_distance = Testify:make_request("total_main_path_distance")
		main_path_point = math.clamp(main_path_point, 0, total_main_path_distance - 1)
		local bots_stuck_data = {}

		for i = 1, 3 do
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
			power_up_tests = Testify:make_request("get_available_deus_talent_power_up_tests")
		elseif power_up_type == "generic" then
			power_up_tests = Testify:make_request("get_available_deus_generic_power_up_tests")
		end

		for rarity, powerup_tests_for_rarity in pairs(power_up_tests) do
			for power_up_name, power_up_test_function in pairs(powerup_tests_for_rarity) do
				TestifySnippets.set_player_profile(profile_name, career_name)
				TestifySnippets.set_bot_profile(profile_name, career_name)
				Testify:make_request("wait_for_players_inventory_ready")
				Testify:make_request("add_buffs_to_heroes", {
					"ledge_rescue",
					"disable_rescue",
					"blessing_of_isha_invincibility"
				})

				local request_parameter = {
					power_up_name = power_up_name,
					rarity = rarity
				}

				Testify:make_request("activate_bots_deus_power_up", request_parameter)
				Testify:make_request("activate_player_deus_power_up", request_parameter)
				printf("[Testify] Testing %s: for career %s", power_up_name, career_name)
				power_up_test_function(nav_world, terror_event_name, main_path_point, bot_teleportation_data)
				Testify:make_request("reset_deus_power_ups")
			end
		end

		print("[Testify] All deus power ups were tested!")

		local result = string.format("All %s power-ups were test", power_up_type)

		return result
	end)
end

local LevelSettingsMorris = require("levels/honduras_dlcs/morris/level_settings_morris")

TestCases.write_morris_levels_to_file = function ()
	Testify:run_case(function (dt, t)
		local filename = "load_all_deus_levels.yaml"
		local file = io.open(filename, "w")
		local suite_definition = {
			"suites_definition:",
			"  - suite_id: load_all_deus_levels",
			"    name: Load All Deus Levels",
			"    abort_if_n_first_cases_failed: 3",
			"    sessions:",
			"      - project_config_type: game_host",
			"        extra_session_args: -skip-splash -disable-intro-trailer -debug-testify -use-local-backend -mechanism deus"
		}

		for i = 1, 7 do
			file:write(suite_definition[i], "\n")
		end

		file:write("\n", "    cases:", "\n")

		local case_definition = {
			"      - case_definition_id: load_level",
			nil,
			nil,
			"        script_args:",
			nil,
			"          - true"
		}

		for level_name, level_settings in pairs(LevelSettingsMorris) do
			local level_key = level_settings.level_key

			if level_key then
				local is_deus_level = level_name == level_key

				if is_deus_level then
					case_definition[2] = "        case_id: load_deus_level_" .. level_key
					case_definition[3] = "        name: Load Deus Level - " .. level_key
					case_definition[5] = "          - " .. level_key

					for i = 1, 6 do
						file:write(case_definition[i], "\n")
					end

					file:write("\n")
				end
			end
		end

		file:flush()
		file:close()
	end)
end

TestCases.equip_hats = function ()
	Testify:run_case(function (dt, t)
		TestifySnippets.load_level({
			level_key = "inn_level"
		})
		Testify:make_request("add_all_hats")
		Testify:make_request("wait_for_playfab_response", "devGrantItems")

		local profiles = Testify:make_request("request_profiles", "heroes")

		for _, profile in ipairs(profiles) do
			for _, career_name in ipairs(profile.careers) do
				TestifySnippets.set_player_profile(profile.name, career_name)
				Testify:make_request("wait_for_players_inventory_ready")
				TestifySnippets.open_hero_view()
				TestifySnippets.open_cosmetics_inventory()
				TestifySnippets.equip_hats()
				Testify:make_request("close_hero_view")
			end
		end
	end)
end
