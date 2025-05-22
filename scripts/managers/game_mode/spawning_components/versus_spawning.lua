-- chunkname: @scripts/managers/game_mode/spawning_components/versus_spawning.lua

require("scripts/managers/game_mode/spawning_components/spawning_helper")

VersusSpawning = class(VersusSpawning)

local RPCS = {
	"rpc_from_server_send_spawn_state",
	"rpc_to_server_spawn_failed",
}

VersusSpawning.init = function (self, side_name, profile_synchronizer, available_profiles, is_server, game_mode_settings, career_delegator)
	self._side_name = side_name
	self._profile_synchronizer = profile_synchronizer
	self._available_profiles = available_profiles
	self._available_special_profiles = available_profiles
	self._settings = game_mode_settings
	self._respawn_timer_margin = game_mode_settings.dark_pact_respawn_timer_margin
	self._is_server = is_server
	self._server_peer_id = Managers.mechanism:server_peer_id()
	self._mechanism = Managers.mechanism:game_mechanism()
	self._win_conditions = self._mechanism:win_conditions()
	self._career_delegator = career_delegator
	self._spawn_points = {}
	self._spawn_groups = {}
	self._used_spawn_group_positions = {}
	self._num_spawn_points_used = 0

	local mechanism_ok, custom_setting_override, custom_settings_enabled = Managers.mechanism:mechanism_try_call("get_custom_game_setting", "pactsworn_respawn_timer")

	if mechanism_ok and custom_settings_enabled and custom_setting_override ~= "default" then
		self._respawn_time_override = custom_setting_override
	end
end

VersusSpawning.register_rpcs = function (self, network_event_delegate, network_transmit)
	network_event_delegate:register(self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate
	self._network_transmit = network_transmit
end

VersusSpawning.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
	self._network_transmit = nil
end

function get_special_profiles(profiles)
	local t = {}

	for i = 1, #profiles do
		local profile_name = profiles[i]
		local profile = PROFILES_BY_NAME[profile_name]

		if profile.role == "special" then
			t[#t + 1] = profile_name
		end
	end

	return t
end

VersusSpawning.get_spawn_time = function (self, party)
	if self._respawn_time_override then
		return self._respawn_time_override
	end

	local pactsworn_party_id = party
	local hero_party_id = Managers.state.side:get_side_from_name("heroes").party.party_id
	local num_used_slots = party.num_used_slots
	local spawn_timers = self._settings.dark_pact_respawn_timers[num_used_slots]
	local minimum_spawn_time = self._settings.dark_pact_minimum_spawn_time
	local min_score = -200
	local max_score = 0
	local score_difference = (self._win_conditions:get_total_score(pactsworn_party_id) - self._win_conditions:get_total_score(hero_party_id) - min_score) / (max_score - min_score)

	score_difference = math.clamp(score_difference, 0, 1)

	local spawn_time = math.ceil(math.lerp(spawn_timers.min, spawn_timers.max, score_difference)) or 20
	local current_set = self._mechanism:get_current_set()

	if current_set == 1 then
		spawn_time = spawn_timers.max or 20
	end

	spawn_time = math.clamp(spawn_time, minimum_spawn_time, math.huge)

	return spawn_time
end

local function cb_spawned_darkpact_bot_func(unit, breed, optional_data)
	local bot_data = optional_data.bot_data

	bot_data.state = "alive"
	bot_data.unit = unit
end

VersusSpawning.update = function (self, t, dt)
	if Managers.state.network:game() then
		local side_name = self._side_name
		local undecided_profile_idx = FindProfileIndex("vs_undecided")
		local party = Managers.state.side:get_party_from_side_name(side_name)
		local occupied_slots = party.occupied_slots

		for i = 1, #occupied_slots do
			local status = occupied_slots[i]
			local player = Managers.player:player_from_unique_id(status.unique_id)

			if player then
				local data = status.game_mode_data
				local spawn_state = data.spawn_state

				if spawn_state == "w8_for_profile" then
					local peer_id = status.peer_id
					local local_player_id = status.local_player_id
					local current_profile_index = self._profile_synchronizer:profile_by_peer(peer_id, local_player_id)

					if current_profile_index and current_profile_index ~= undecided_profile_idx then
						self:set_spawn_state(peer_id, local_player_id, "w8_to_spawn", 0, 0, false)
					end
				elseif spawn_state == "w8_to_spawn" then
					if not player.player_unit or not Unit.alive(player.player_unit) then
						self:_spawn_enemy(status)
						self:set_spawn_state(status.peer_id, status.local_player_id, "spawning", 0, 0, false)
					end
				elseif spawn_state == "spawning" then
					if player.player_unit then
						self:set_spawn_state(status.peer_id, status.local_player_id, "spawned", 0, 0, false)
					end
				elseif spawn_state == "spawned" then
					local player_unit = player.player_unit

					if Unit.alive(player_unit) then
						if ScriptUnit.extension(player_unit, "status_system"):is_dead() then
							self:set_spawn_state(status.peer_id, status.local_player_id, "dead", 0, 0, false)
						end
					else
						local spawn_time = self:get_spawn_time(party)

						self:set_spawn_state(status.peer_id, status.local_player_id, "dead", 0, spawn_time, true)
					end
				elseif spawn_state == "dead" then
					local timer = data.delayed_death_timer

					if not timer then
						local side_settings = self._settings.side_settings

						data.delayed_death_timer = t + side_settings.dark_pact.spawn_times.delayed_death_time or 0
					elseif t - timer >= 0 then
						data.delayed_death_timer = nil

						local game_mode = Managers.state.game_mode:game_mode()

						game_mode:assign_temporary_dark_pact_profile(status)

						local spawn_time = self:get_spawn_time(party)

						self:set_spawn_state(status.peer_id, status.local_player_id, "w8_for_profile", 0, spawn_time, true)
					end
				end
			end
		end
	end
end

VersusSpawning.client_update = function (self, t, dt, party)
	return
end

VersusSpawning.add_spawn_point = function (self, unit)
	local pos = Unit.local_position(unit, 0)
	local rot = Unit.local_rotation(unit, 0)
	local spawn_point = {
		pos = Vector3Box(pos),
		rot = QuaternionBox(rot),
		unit = unit,
	}
	local spawn_group_id = Unit.get_data(unit, "spawn_group")

	fassert(spawn_group_id, "spawn group property missing from spawn point unit")

	if not self._spawn_groups[spawn_group_id] then
		self._spawn_groups[spawn_group_id] = {}
	end

	local num_points = #self._spawn_groups[spawn_group_id]

	self._spawn_groups[spawn_group_id][num_points + 1] = spawn_point
end

VersusSpawning.get_spawn_point = function (self, spawn_group_id, optional_slot_id)
	local spawn_points = self._spawn_groups[spawn_group_id]

	if not spawn_points then
		return nil, nil, nil
	end

	local spawn_point = spawn_points[optional_slot_id or 1]

	if spawn_point then
		return spawn_point.pos, spawn_point.rot, spawn_point.unit
	end
end

VersusSpawning._check_spawn_observer = function (self, player)
	local spawn_at_players_on_side = self._settings.side_settings.dark_pact.spawn_at_players_on_side
	local observed_unit = player:observed_unit()

	if Unit.alive(observed_unit) then
		local side_manager = Managers.state.side
		local observer_side = side_manager.side_by_unit[observed_unit]
		local observed_position = Unit.local_position(observed_unit, 0)
		local observed_rotation = Unit.local_rotation(observed_unit, 0)

		if observer_side then
			local observer_side_name = observer_side:name()
			local valid_func = spawn_at_players_on_side[observer_side_name]

			if valid_func and valid_func() then
				return observed_position, observed_rotation
			end
		else
			return observed_position, observed_rotation
		end
	end

	local valid_sides = table.keys(spawn_at_players_on_side)

	while #valid_sides > 0 do
		local index = math.random(1, #valid_sides)
		local side_name = table.remove(valid_sides, index)
		local is_allowed_func = spawn_at_players_on_side[side_name]

		if is_allowed_func() then
			local side = Managers.state.side:get_side_from_name(side_name)
			local units = side.PLAYER_AND_BOT_UNITS
			local num_units = #units
			local random_index = math.random(1, num_units)

			for i = 1, num_units do
				local idx = math.index_wrapper(i + random_index - 1, num_units)
				local unit = units[idx]
				local position = POSITION_LOOKUP[unit]

				if position then
					local rotation = Unit.local_rotation(unit, 0)

					position = position + Vector3(0, 0, 0.1)

					return position, rotation
				end
			end
		end
	end

	return nil, nil
end

VersusSpawning._get_fallback_spawn_position = function (self, player)
	local position
	local wanted_distance = Managers.state.conflict.main_path_info.ahead_travel_dist

	position = MainPathUtils.point_on_mainpath(nil, wanted_distance)

	if not position then
		local total_distance = MainPathUtils.total_path_dist()

		position = MainPathUtils.point_on_mainpath(nil, total_distance - 0.1)
	end

	return position
end

VersusSpawning._get_allowed_spawn_position = function (self, player)
	local position, rotation = self:_check_spawn_observer(player)

	if not position and not Managers.state.game_mode:is_round_started() then
		local mechanism = Managers.mechanism:game_mechanism()
		local spawn_group = mechanism:get_current_spawn_group()
		local has_spawn_points = table.size(self._spawn_points) > 0 or self._spawn_groups[spawn_group]

		if has_spawn_points then
			position, rotation = self:get_spawn_point(spawn_group)
			position = position:unbox()
			rotation = rotation:unbox()
		end
	end

	position = position or self:_get_fallback_spawn_position(player)
	rotation = rotation or Quaternion.identity()

	return position, rotation
end

VersusSpawning._spawn_enemy = function (self, status)
	local peer_id = status.peer_id
	local local_player_id = status.local_player_id
	local profile_index = status.profile_index
	local career_index = status.career_index
	local mechanism = Managers.mechanism:game_mechanism()
	local spawn_group = mechanism:get_current_spawn_group()
	local position, rotation = self:_get_allowed_spawn_position(status.player)
	local is_initial_spawn = not status.has_done_initial_spawn or not status.has_done_initial_spawn[spawn_group]

	status.has_done_initial_spawn = status.has_done_initial_spawn or {}
	status.has_done_initial_spawn[spawn_group] = true

	local data = status.game_mode_data
	local networked_consumables = SpawningHelper.netpack_consumables(data.consumables or {})
	local healthkit_id, potion_id, grenade_id = unpack(networked_consumables)
	local network_additional_items = SpawningHelper.netpack_additional_items(data.additional_items)
	local ammo_melee_percent_int = 0
	local ammo_ranged_percent_int = 0
	local ability_cooldown_percentage_int = 100
	local ammo = data.ammo

	if ammo then
		ammo_melee_percent_int = math.floor(ammo.slot_melee * 100)
		ammo_ranged_percent_int = math.floor(ammo.slot_ranged * 100)
	end

	local network_buff_ids = {}

	if data.persistent_buffs then
		for _, buff_name in pairs(data.persistent_buffs.buff_names) do
			local buff_id = NetworkLookup.buff_templates[buff_name]

			table.insert(network_buff_ids, buff_id)
		end
	end

	print("Spawning versus enemy player")

	local session = Managers.state.network:game()

	if session then
		local inventory_hash = self._profile_synchronizer:cached_inventory_hash(peer_id, local_player_id)

		Managers.state.network.network_transmit:send_rpc("rpc_to_client_spawn_player", peer_id, local_player_id, profile_index, career_index, position, rotation, is_initial_spawn, ammo_melee_percent_int, ammo_ranged_percent_int, ability_cooldown_percentage_int, healthkit_id, potion_id, grenade_id, network_additional_items, network_buff_ids, inventory_hash)
	end
end

VersusSpawning.setup_data = function (self, peer_id, local_player_id)
	local party_manager = Managers.party
	local status = party_manager:get_player_status(peer_id, local_player_id)

	status.game_mode_data = {
		health_percentage = 1,
		health_state = "alive",
		temporary_health_percentage = 0,
		last_update = -math.huge,
		ammo = {
			slot_melee = 1,
			slot_ranged = 1,
		},
		consumables = {},
		additional_items = {},
	}
end

VersusSpawning.handle_transporter = function (self, active, transporter_unit, party)
	return
end

VersusSpawning.force_respawn = function (self, peer_id, local_player_id)
	local data = Managers.party:get_player_status(peer_id, local_player_id).game_mode_data

	if not data.spawn_timer then
		data.spawn_timer = 0
	end

	self:set_spawn_state(peer_id, local_player_id, "w8_to_spawn", 0, 0, false)
end

VersusSpawning.rpc_from_server_send_spawn_state = function (self, channel_id, peer_id, local_player_id, spawn_state_id, int_data, float_data, bool_data)
	local spawn_state = NetworkLookup.spawn_states[spawn_state_id]

	self:set_spawn_state(peer_id, local_player_id, spawn_state, int_data, float_data, bool_data)
end

VersusSpawning.set_spawn_state = function (self, peer_id, local_player_id, spawn_state, int_data, float_data, bool_data)
	local Managers = Managers
	local status = Managers.party:get_player_status(peer_id, local_player_id)

	if not status then
		return
	end

	local data = status.game_mode_data

	if spawn_state == "w8_for_profile" then
		local player = Managers.player:player(peer_id, local_player_id)
		local spawn_timer = Managers.time:time("game") + float_data

		data.spawn_timer = spawn_timer

		local local_player_party = Managers.party:get_local_player_party()

		if Network.peer_id() == peer_id or local_player_party and status.party_id == local_player_party.party_id then
			local local_human = not player.remote and not player.bot_player
			local show_pactsworn_ui = bool_data

			Managers.state.event:trigger("add_respawn_counter_event", player, local_human, spawn_timer, show_pactsworn_ui)
		end
	end

	data.spawn_state = spawn_state

	if self._is_server then
		local spawn_state_id = NetworkLookup.spawn_states[spawn_state]

		Managers.state.network.network_transmit:send_rpc_clients("rpc_from_server_send_spawn_state", peer_id, local_player_id, spawn_state_id, int_data, float_data, bool_data)
	end
end

VersusSpawning._play_sound = function (self, name)
	local world = Managers.world:world("level_world")
	local wwise_world = Managers.world:wwise_world(world)

	WwiseWorld.trigger_event(wwise_world, name)
end

VersusSpawning.rpc_to_server_spawn_failed = function (self, channel_id, local_player_id)
	print("[VersusSpawning] Client detected spawning mismatch. Trying again.")

	local peer_id = CHANNEL_TO_PEER_ID[channel_id]
	local side_name = self._side_name
	local party = Managers.state.side:get_party_from_side_name(side_name)
	local occupied_slots = party.occupied_slots

	for i = 1, #occupied_slots do
		local status = occupied_slots[i]
		local other_peer_id = status.peer_id
		local other_local_player_id = status.local_player_id

		if peer_id == other_peer_id and local_player_id == other_local_player_id then
			local data = status.game_mode_data

			if data.spawn_state == "spawning" then
				data.spawn_state = "w8_to_spawn"

				break
			end

			print("[VersusSpawning] This shouldn't happen. How did we leave spawning?")

			break
		end
	end
end
