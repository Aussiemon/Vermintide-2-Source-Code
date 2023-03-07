require("scripts/settings/dlcs/morris/deus_power_up_testify")

local function is_unit_in_incapacitated_state(unit)
	local player_state = ScriptUnit.extension(unit, "character_state_machine_system").state_machine.state_current.name

	return player_state == "knocked_down" or player_state == "pounced_down" or player_state == "grabbed_by_pack_master" or player_state == "grabbed_by_tentacle"
end

local function teleport_unit_to_position(unit, position)
	if not unit then
		return false
	end

	if not Unit.alive(unit) then
		Testify:_print("Unit %s not alive, teleportation cancelled", Unit.debug_name(unit))

		return false
	end

	if is_unit_in_incapacitated_state(unit) then
		Testify:_print("Unit %s in blocking state, teleportation cancelled", Unit.debug_name(unit))

		return false
	end

	Testify:_print("Teleporting player to %s", tostring(position))
	Mover.set_position(Unit.mover(unit), position)

	return true
end

local function make_invincible(unit)
	if unit == nil then
		return false
	end

	local health = ScriptUnit.extension(unit, "health_system")
	health.is_invincible = true

	return true
end

local function timer()
	return os.time()
end

local StateInGameTestify = {
	load_level = function (level_settings)
		local level_key = level_settings.level_key
		local environment_variation_id = level_settings.environment_variation_id or 0

		Managers.mechanism:debug_load_level(level_key, environment_variation_id)
	end,
	wait_for_state_ingame_reached = function ()
		return
	end,
	get_level_weather_variations = function (level_key)
		return LevelSettings[level_key].environment_variations
	end,
	wait_for_player_to_spawn = function ()
		local player = Managers.player:local_player()

		if not Unit.alive(player.player_unit) then
			return Testify.RETRY
		end
	end
}

StateInGameTestify.wait_for_bots_to_spawn = function ()
	for _, bot in pairs(Managers.player:bots()) do
		if not Unit.alive(bot.player_unit) then
			return Testify.RETRY
		end
	end
end

StateInGameTestify.request_profiles = function (affiliation)
	local profiles = {}

	for _, profile in pairs(SPProfiles) do
		if profile.affiliation == affiliation then
			local careers = {}

			for i, career in ipairs(profile.careers) do
				careers[i] = career.display_name
			end

			profiles[#profiles + 1] = {
				name = profile.display_name,
				careers = careers
			}
		end
	end

	return profiles
end

StateInGameTestify.set_player_profile = function (profile)
	Managers.state.network:request_profile(1, profile.profile_name, profile.career_name, true)

	return Testify.RETRY
end

StateInGameTestify.set_bot_profile = function (profile)
	script_data.allow_same_bots = true
	script_data.wanted_bot_profile = profile.profile_name
	local profile_index = FindProfileIndex(profile.profile_name)
	local career_index = career_index_from_name(profile_index, profile.career_name)
	script_data.wanted_bot_career_index = career_index
end

StateInGameTestify.enable_bots = function ()
	script_data.ai_bots_disabled = false
end

StateInGameTestify.disable_bots = function ()
	script_data.ai_bots_disabled = true
end

StateInGameTestify.add_all_hats = function ()
	for _, entry in ipairs(DebugScreen.console_settings) do
		if entry.title == "Add All Hat Items" then
			entry.func()

			return
		end
	end
end

StateInGameTestify.add_all_weapon_skins = function ()
	for _, entry in ipairs(DebugScreen.console_settings) do
		if entry.title == "Add All Weapon Skins" then
			entry.func()

			return
		end
	end
end

StateInGameTestify.get_available_deus_talent_power_up_tests = function ()
	local power_up_tests = {}

	for rarity, power_ups_for_rarity in pairs(DeusPowerUps) do
		for power_up_name, power_up in pairs(power_ups_for_rarity) do
			local test = DeusPowerUpTests[power_up_name] or DeusPowerUpTests.default

			if power_up.talent then
				power_up_tests[rarity] = power_up_tests[rarity] or {}
				power_up_tests[rarity][power_up_name] = test
			end
		end
	end

	return power_up_tests
end

StateInGameTestify.get_available_deus_generic_power_up_tests = function ()
	local power_up_tests = {}

	for rarity, power_ups_for_rarity in pairs(DeusPowerUps) do
		for power_up_name, power_up in pairs(power_ups_for_rarity) do
			local test = DeusPowerUpTests[power_up_name] or DeusPowerUpTests.default

			if not power_up.talent then
				power_up_tests[rarity] = power_up_tests[rarity] or {}
				power_up_tests[rarity][power_up_name] = test
			end
		end
	end

	return power_up_tests
end

StateInGameTestify.activate_bots_deus_power_up = function (request_parameter)
	local power_up_name = request_parameter.power_up_name
	local rarity = request_parameter.rarity
	local power_up = DeusPowerUpUtils.generate_specific_power_up(power_up_name, rarity)
	local mechanism = Managers.mechanism:game_mechanism()
	local deus_run_controller = mechanism:get_deus_run_controller()
	local buff_system = Managers.state.entity:system("buff_system")
	local talent_interface = Managers.backend:get_talents_interface()
	local deus_backend = Managers.backend:get_interface("deus")

	for _, bot in pairs(Managers.player:bots()) do
		local local_player_id = bot:local_player_id()

		deus_run_controller:add_power_ups({
			power_up
		}, local_player_id)

		local bot_unit = bot.player_unit
		local profile_index = bot:profile_index()
		local career_index = bot:career_index()

		DeusPowerUpUtils.activate_deus_power_up(power_up, buff_system, talent_interface, deus_backend, deus_run_controller, bot_unit, profile_index, career_index)
	end
end

StateInGameTestify.activate_player_deus_power_up = function (request_parameter)
	local power_up_name = request_parameter.power_up_name
	local rarity = request_parameter.rarity
	local power_up = DeusPowerUpUtils.generate_specific_power_up(power_up_name, rarity)
	local mechanism = Managers.mechanism:game_mechanism()
	local deus_run_controller = mechanism:get_deus_run_controller()
	local local_player = Managers.player:local_player()
	local local_player_id = local_player:local_player_id()

	deus_run_controller:add_power_ups({
		power_up
	}, local_player_id)

	local buff_system = Managers.state.entity:system("buff_system")
	local talent_interface = Managers.backend:get_talents_interface()
	local deus_backend = Managers.backend:get_interface("deus")
	local local_player_unit = local_player.player_unit
	local profile_index = local_player:profile_index()
	local career_index = local_player:career_index()

	DeusPowerUpUtils.activate_deus_power_up(power_up, buff_system, talent_interface, deus_backend, deus_run_controller, local_player_unit, profile_index, career_index)
end

StateInGameTestify.reset_deus_power_ups = function ()
	local mechanism = Managers.mechanism:game_mechanism()
	local deus_run_controller = mechanism:get_deus_run_controller()
	local own_peer_id = deus_run_controller:get_own_peer_id()
	local players = Managers.player:human_and_bot_players()

	for _, player in pairs(players) do
		local local_player_id = player:local_player_id()
		local profile_index = player:profile_index()
		local career_index = player:career_index()

		deus_run_controller:reset_power_ups(own_peer_id, local_player_id, profile_index, career_index)
	end
end

StateInGameTestify.set_script_data = function (options)
	table.merge(script_data, options)
end

StateInGameTestify.wait_for_inventory_to_be_loaded = function ()
	local player = Managers.player:local_player()
	local inventory_extension = ScriptUnit.extension(player.player_unit, "inventory_system")

	if inventory_extension:resyncing_loadout() then
		return Testify.RETRY
	end
end

StateInGameTestify.wait_for_players_inventory_ready = function ()
	for _, player in pairs(Managers.player:players()) do
		local inventory = ScriptUnit.extension(player.player_unit, "inventory_system")

		if not inventory or not inventory:can_wield() then
			return Testify.RETRY
		end
	end
end

StateInGameTestify.player_wield_weapon = function (weapon)
	local player = Managers.player:local_player()
	local inventory = ScriptUnit.extension(player.player_unit, "inventory_system")

	inventory:testify_wield_weapon(weapon)
end

StateInGameTestify.bot_wield_weapon = function (weapon)
	for _, bot in pairs(Managers.player:bots()) do
		local inventory = ScriptUnit.extension(bot.player_unit, "inventory_system")

		inventory:testify_wield_weapon(weapon)
	end
end

StateInGameTestify.set_game_mode_to_weave = function (_, state_ingame)
	local game_mode_key = Managers.state.game_mode:game_mode_key()

	if game_mode_key ~= "weave" then
		Managers.mechanism:choose_next_state("weave")
		Managers.mechanism:progress_state()
	end
end

StateInGameTestify.load_weave = function (weave_name, state_ingame)
	local weave_template = WeaveSettings.templates[weave_name]
	local objective = weave_template.objectives[1]
	local level_key = objective.level_id
	local level_transition_handler = Managers.level_transition_handler

	level_transition_handler:set_next_level(level_key)
	level_transition_handler:promote_next_level_data()
end

StateInGameTestify.make_game_ready_for_next_weave = function (_, state_ingame)
	if not state_ingame.is_in_inn then
		return Testify.RETRY
	end
end

StateInGameTestify.set_camera_to_observe_first_bot = function ()
	local bots = Managers.player:bots()

	if Unit.alive(bots[1].player_unit) then
		local player = Managers.player:local_player()

		CharacterStateHelper.change_camera_state(player, "observer")
	end

	return Testify.RETRY
end

StateInGameTestify.update_camera_to_follow_first_bot_rotation = function ()
	local camera_unit = Managers.player:local_player().camera_follow_unit
	local bots = Managers.player:bots()
	local first_bot_unit = bots[1].player_unit

	if first_bot_unit then
		local rotation = Unit.local_rotation(first_bot_unit, 0)

		Unit.set_local_rotation(camera_unit, 0, rotation)
	end
end

StateInGameTestify.teleport_player_to_main_path_point = function (main_path_point)
	local player_unit = Managers.player:local_player().player_unit
	local position = MainPathUtils.point_on_mainpath(nil, main_path_point)

	teleport_unit_to_position(player_unit, position + Vector3(0, 0, 1))
end

StateInGameTestify.closest_travel_distance_to_player = function ()
	local player_unit = Managers.player:local_player().player_unit
	local _, travel_distance = MainPathUtils.closest_pos_at_main_path(nil, POSITION_LOOKUP[player_unit])

	return travel_distance
end

StateInGameTestify.teleport_player_to_position = function (position)
	local player_unit = Managers.player:local_player().player_unit

	teleport_unit_to_position(player_unit, position:unbox() + Vector3(0, 0, 1))
end

StateInGameTestify.teleport_player_randomly_on_main_path = function ()
	local player_unit = Managers.player:local_player().player_unit
	local random_point = math.random(1, EngineOptimized.main_path_total_length())
	local position = MainPathUtils.point_on_mainpath(nil, random_point)

	teleport_unit_to_position(player_unit, position + Vector3(0, 0, 1))
end

StateInGameTestify.set_player_unit_not_visible = function ()
	local player = Managers.player:local_player()

	if Unit.alive(player.player_unit) then
		return Testify.RETRY
	end
end

StateInGameTestify.teleport_bots_forward_on_main_path_if_blocked = function (bots_data)
	local bots_stuck_data = bots_data.bots_stuck_data
	local main_path_point = bots_data.main_path_point
	local bots_blocked_time_before_teleportation = bots_data.bots_blocked_time_before_teleportation or 6

	for bot_id, bot in pairs(Managers.player:bots()) do
		local bot_unit = bot.player_unit

		if not Unit.alive(bot_unit) or is_unit_in_incapacitated_state(bot_unit) then
			Testify:_print("Bot unit has been removed or is in a blocking state. Cannot teleport it.")
		else
			local bot_stuck_data = bots_stuck_data[bot_id]
			local bot_pos = POSITION_LOOKUP[bot_unit]
			local stored_bot_position = bot_stuck_data[1]:unbox()
			local bot_distance_from_stored_position = Vector3.distance_squared(stored_bot_position, bot_pos)
			local bots_blocked_distance = bots_data.bots_blocked_distance or 2

			if bot_distance_from_stored_position < bots_blocked_distance then
				local stored_time = bot_stuck_data[2]
				local delta_time = timer() - stored_time

				if bots_blocked_time_before_teleportation < delta_time then
					local tp_pos = MainPathUtils.point_on_mainpath(nil, main_path_point)

					if tp_pos then
						tp_pos.z = tp_pos.z + 1

						Testify:_print("The bot %s has almost not moved since %ss. Teleporting bot to x:%s, y:%s, z:%s", bot_id, bots_blocked_time_before_teleportation, tp_pos.x, tp_pos.y, tp_pos.z)
						teleport_unit_to_position(bot_unit, tp_pos)
						Mover.set_position(Unit.mover(bot_unit), tp_pos)
					end
				end
			else
				bot_stuck_data[1]:store(bot_pos)

				bot_stuck_data[2] = timer()
			end
		end
	end
end

StateInGameTestify.are_bots_blocked = function (bots_data)
	local bots_stuck_data = bots_data.bots_stuck_data
	local bots_blocked_time_before_teleportation = bots_data.bots_blocked_time_before_teleportation or 6

	for i, bot in pairs(Managers.player:bots()) do
		local unit = bot.player_unit

		if unit then
			local bot_stuck_data = bots_stuck_data[i]
			local bot_pos = Mover.position(Unit.mover(unit))

			if Vector3.distance_squared(bot_stuck_data[1]:unbox(), bot_pos) < 2 then
				if bots_blocked_time_before_teleportation < timer() - bot_stuck_data[2] then
					bot_stuck_data[1]:store(Vector3(-999, -999, -999))

					bot_stuck_data[2] = timer()

					return true
				end
			else
				bot_stuck_data[1]:store(bot_pos)

				bot_stuck_data[2] = timer()
			end
		end
	end

	return false
end

StateInGameTestify.make_players_invicible = function ()
	for _, player in pairs(Managers.player:players()) do
		make_invincible(player.player_unit)
	end
end

StateInGameTestify.make_player_and_two_bots_invicible = function ()
	local bots = Managers.player:bots()

	make_invincible(bots[1].player_unit)
	make_invincible(bots[2].player_unit)
	make_invincible(Managers.player:local_player().player_unit)
end

StateInGameTestify.set_telemetry_settings = function (settings)
	table.merge(TelemetrySettings, settings)
	Managers.telemetry:reload_settings()
end

StateInGameTestify.get_main_path_points = function (nb_points)
	local main_path_total_length = EngineOptimized.main_path_total_length()
	local main_path_points = {}

	for i = 1, nb_points do
		main_path_points[i] = math.floor(main_path_total_length * i / nb_points)
	end

	return main_path_points
end

StateInGameTestify.set_difficulty = function (difficulty)
	local difficulty_tweak = 0

	Managers.state.difficulty:set_difficulty(difficulty, difficulty_tweak)
end

StateInGameTestify.get_player_current_position = function ()
	local _, player = next(Managers.player._human_players)
	local player_current_position = POSITION_LOOKUP[player.player_unit]

	return player_current_position
end

StateInGameTestify.is_unit_alive = function (unit)
	local health_extension = ScriptUnit.has_extension(unit, "health_system")
	local is_alive = health_extension and health_extension:is_alive() or false

	return is_alive
end

StateInGameTestify.get_unit_health_values = function (unit)
	local health_values = nil
	local health_extension = ScriptUnit.has_extension(unit, "health_system")

	if health_extension then
		health_values = {
			current_health = health_extension:current_health(),
			max_health = health_extension:get_max_health()
		}
	end

	return health_values
end

StateInGameTestify.kill_unit = function (unit)
	local damage_type = "forced"
	local damage_direction = Vector3(0, 0, -1)

	AiUtils.kill_unit(unit, nil, nil, damage_type, damage_direction)
end

StateInGameTestify.add_buffs_to_heroes = function (buffs)
	local side = Managers.state.side:get_side_from_name("heroes")

	for _, unit in pairs(side.PLAYER_AND_BOT_UNITS) do
		for _, buff_name in ipairs(buffs) do
			local buff_extension = ScriptUnit.extension(unit, "buff_system")

			buff_extension:add_buff(buff_name)
		end
	end
end

StateInGameTestify.fail_test = function (message)
	assert(false, message)
end

return StateInGameTestify
