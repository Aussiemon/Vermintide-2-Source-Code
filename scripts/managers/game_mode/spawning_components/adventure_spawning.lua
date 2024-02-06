-- chunkname: @scripts/managers/game_mode/spawning_components/adventure_spawning.lua

require("scripts/managers/spawn/respawn_handler")
require("scripts/managers/game_mode/spawning_components/spawning_helper")

local REAL_PLAYER_LOCAL_ID = 1

AdventureSpawning = class(AdventureSpawning)

AdventureSpawning.init = function (self, profile_synchronizer, side, is_server, network_server, saved_game_mode_data)
	self._profile_synchronizer = profile_synchronizer
	self._side = side
	self._is_server = is_server
	self._network_server = network_server
	self._respawns_enabled = true
	self._spawning = true
	self._respawn_handler = RespawnHandler:new(profile_synchronizer, is_server)
	self._spawn_points = {}
	self._num_spawn_points_used = 0
	self._delayed_clients = {}
	self._saved_game_mode_data = saved_game_mode_data or {}

	self:_setup_game_mode_data(side, self._saved_game_mode_data)
end

AdventureSpawning._setup_game_mode_data = function (self, side, saved_game_mode_data)
	local party = side.party
	local num_slots = party.num_slots

	for i = 1, num_slots do
		saved_game_mode_data[i] = saved_game_mode_data[i] or {}
	end
end

AdventureSpawning.get_saved_game_mode_data = function (self)
	return self._saved_game_mode_data
end

AdventureSpawning.register_rpcs = function (self, network_event_delegate, network_transmit)
	self._respawn_handler:register_rpcs(network_event_delegate, network_transmit)
end

AdventureSpawning.unregister_rpcs = function (self)
	self._respawn_handler:unregister_rpcs()
end

AdventureSpawning._assign_data_to_slot = function (self, slot, data)
	if table.is_empty(data) then
		local box_pos, box_rot

		if self._spawn_groups then
			local spawn_group = Managers.mechanism:game_mechanism():get_current_spawn_group()

			box_pos, box_rot = self:get_spawn_point_from_spawn_group(spawn_group)
		else
			box_pos, box_rot = self:get_spawn_point()
		end

		data.health_state = "alive"
		data.health_percentage = 1
		data.temporary_health_percentage = 0
		data.position = box_pos
		data.rotation = box_rot
		data.respawn_timer = nil
		data.ability_cooldown_percentage = 1
		data.last_update = -math.huge
		data.ammo = {
			slot_melee = 1,
			slot_ranged = 1,
		}

		local settings = Managers.state.difficulty:get_difficulty_settings()
		local game_mode_settings = Managers.state.game_mode:settings()
		local consumables = {}

		SpawningHelper.default_spawn_items(consumables, settings, game_mode_settings)

		data.consumables = consumables
	end

	if not data.position or not data.rotation then
		local box_pos, box_rot = self:get_spawn_point()

		data.position = box_pos
		data.rotation = box_rot
	end

	if not data.ammo then
		data.ammo = {
			slot_melee = 1,
			slot_ranged = 1,
		}
	end

	if not data.consumables then
		local settings = Managers.state.difficulty:get_difficulty_settings()
		local game_mode_settings = Managers.state.game_mode:settings()
		local consumables = {}

		SpawningHelper.default_spawn_items(consumables, settings, game_mode_settings)

		data.consumables = consumables
	end

	if not data.additional_items then
		data.additional_items = {}
	end

	local health_state = data.health_state
	local instant_spawn = health_state ~= "dead"
	local spawn_state = data.spawn_state

	if spawn_state == nil or instant_spawn then
		local ingame_time = Managers.time:time("client_ingame")
		local is_initial_spawn = ingame_time == nil or ingame_time < 10

		data.spawn_state = is_initial_spawn and "is_initial_spawn" or "spawn"
	end

	local peer_id = slot.peer_id
	local self_peer_id = Network.peer_id()

	if not instant_spawn and peer_id ~= self_peer_id then
		local local_player_id = slot.local_player_id
		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		RPC.rpc_set_observer_camera(channel_id, local_player_id)
	end

	slot.game_mode_data = data
end

AdventureSpawning._unassign_data_from_slot = function (self, slot, data)
	local health_state = data.health_state

	if health_state == "respawning" or health_state == "respawn" then
		data.health_state = "dead"
		data.ready_for_respawn = true
	end

	local spawn_state = data.spawn_state

	if spawn_state == "spawned" or spawn_state == "spawning" or spawn_state == "spawn" then
		data.spawn_state = "despawned"
	else
		data.spawn_state = "not_spawned"
	end

	slot.game_mode_data = {}
end

AdventureSpawning.player_entered_game_session = function (self, peer_id, local_player_id, wanted_party_index)
	local party = Managers.party:get_party_from_player_id(peer_id, local_player_id)
	local side_party = self._side.party

	if party ~= side_party then
		return
	end

	local status = Managers.party:get_player_status(peer_id, local_player_id)
	local slot_id = status.slot_id
	local slot = side_party.slots[slot_id]
	local saved_game_mode_data = self._saved_game_mode_data[slot_id]

	self:_assign_data_to_slot(slot, saved_game_mode_data)
end

AdventureSpawning.player_joined_party = function (self, peer_id, local_player_id, party_id, slot_id)
	local party = self._side.party
	local side_party_id = party.party_id

	if side_party_id ~= party_id then
		return
	end

	local slot = party.slots[slot_id]
	local saved_game_mode_data = self._saved_game_mode_data[slot_id]

	self:_assign_data_to_slot(slot, saved_game_mode_data)
end

AdventureSpawning.player_left_party = function (self, peer_id, local_player_id, party_id, slot_id)
	local party = self._side.party
	local side_party_id = party.party_id

	if side_party_id ~= party_id then
		return
	end

	local slot = party.slots[slot_id]
	local saved_game_mode_data = self._saved_game_mode_data[slot_id]

	self:_unassign_data_from_slot(slot, saved_game_mode_data)
end

AdventureSpawning.update = function (self, t, dt)
	if Managers.state.network:game() then
		self._respawn_handler:update(dt, t)
	end
end

AdventureSpawning.server_update = function (self, t, dt)
	if Managers.state.network:game() then
		local party = self._side.party
		local occupied_slots = party.occupied_slots

		self:_update_player_status(t, dt, occupied_slots)

		local allow_respawns = Managers.state.difficulty:get_difficulty_settings().allow_respawns

		if self._respawns_enabled and allow_respawns then
			self._respawn_handler:server_update(dt, t, occupied_slots)
		end

		self:_update_spawning(dt, t, occupied_slots, party.party_id)
		self:_update_joining_clients(dt, t)
	end
end

AdventureSpawning._update_player_status = function (self, t, dt, occupied_slots)
	local player_manager = Managers.player
	local ScriptUnit_extension = ScriptUnit.extension

	for i = 1, #occupied_slots do
		local status = occupied_slots[i]
		local data = status.game_mode_data
		local peer_id = status.peer_id
		local local_player_id = status.local_player_id

		if peer_id and local_player_id then
			local player = Managers.player:player(peer_id, local_player_id)

			if player then
				local spawn_state = data.spawn_state

				if spawn_state == "force_respawn" then
					if not ALIVE[player.player_unit] and self._profile_synchronizer:all_synced() then
						data.spawn_state = "spawn"
					end
				elseif spawn_state == "spawned" then
					local player_unit = player.player_unit

					if player_unit then
						local safe_position = ScriptUnit_extension(player_unit, "locomotion_system"):last_position_on_navmesh()

						data.position:store(safe_position)
						data.rotation:store(Unit.local_rotation(player_unit, 0))

						local status_extension = ScriptUnit_extension(player_unit, "status_system")
						local old_state = data.health_state
						local is_dead = status_extension:is_dead()

						if is_dead then
							if data.health_state ~= "respawning" then
								data.health_state = "dead"
							end
						elseif status_extension:is_ready_for_assisted_respawn() then
							data.health_state = "respawn"
						elseif status_extension:is_knocked_down() then
							data.health_state = "knocked_down"
						elseif status_extension:is_disabled() and not status_extension:is_in_vortex() and not status_extension:is_grabbed_by_corruptor() and not status_extension:is_grabbed_by_chaos_spawn() and not status_extension:is_overpowered() then
							data.health_state = "disabled"
						else
							data.health_state = "alive"

							local respawn_unit = data.respawn_unit

							if respawn_unit then
								self._respawn_handler:set_respawn_unit_available(respawn_unit)

								data.respawn_unit = nil
							end
						end

						local health_ext = ScriptUnit_extension(player_unit, "health_system")
						local career_ext = ScriptUnit_extension(player_unit, "career_system")

						if not is_dead or data.health_state ~= "respawning" then
							data.health_percentage = health_ext:current_permanent_health_percent()
							data.temporary_health_percentage = health_ext:current_temporary_health_percent()
							data.ability_cooldown_percentage = career_ext:current_ability_cooldown_percentage()
						end

						if not DamageUtils.is_in_inn then
							local inventory = ScriptUnit_extension(player_unit, "inventory_system")

							SpawningHelper.fill_consumable_table(data.consumables, inventory)
							SpawningHelper.fill_ammo_percentage(data.ammo, inventory, player_unit)

							data.additional_items = inventory:get_additional_items_table()
						end
					end
				elseif spawn_state == "spawning" or spawn_state == "initial_spawning" then
					if player.player_unit then
						data.spawn_state = "spawned"
					end
				elseif (spawn_state == "despawned" or spawn_state == "not_spawned") and player.player_unit then
					data.spawn_state = "spawned"
				end
			end
		end
	end
end

AdventureSpawning._update_spawning = function (self, dt, t, occupied_slots, party_id)
	if self._spawning then
		local own_peer_id = Network.peer_id()
		local local_player_is_ready = false
		local ignore_local_player_for_party = false

		if not DEDICATED_SERVER then
			local local_player = Managers.player:local_player()
			local local_party = local_player:get_party()

			ignore_local_player_for_party = party_id ~= local_party
		end

		for i = 1, #occupied_slots do
			local status = occupied_slots[i]
			local other_peer_id = status.peer_id
			local other_local_player_id = status.local_player_id

			if not self._profile_synchronizer:all_synced_for_peer(other_peer_id, other_local_player_id) then
				return
			end

			if DEDICATED_SERVER or ignore_local_player_for_party or other_peer_id == own_peer_id and other_local_player_id == REAL_PLAYER_LOCAL_ID then
				local_player_is_ready = true
			end
		end

		if not local_player_is_ready then
			return
		end

		local network_server = self._network_server

		for i = 1, #occupied_slots do
			local status = occupied_slots[i]
			local data = status.game_mode_data
			local spawn_state = data.spawn_state
			local ready_to_spawn

			if DEDICATED_SERVER then
				local game_session = network_server.game_session ~= nil

				ready_to_spawn = game_session
			else
				ready_to_spawn = network_server:is_peer_ingame(status.peer_id)
			end

			local wants_to_spawn = spawn_state == "is_initial_spawn" or spawn_state == "spawn"

			if ready_to_spawn and wants_to_spawn then
				if status.is_bot then
					self:_spawn_bot(status)
				else
					self:_spawn_player(status)
				end
			end
		end
	end
end

AdventureSpawning.add_delayed_client = function (self, peer_id, local_player_id)
	self._delayed_clients[#self._delayed_clients + 1] = {
		peer_id = peer_id,
		local_player_id = local_player_id,
	}
end

AdventureSpawning.remove_delayed_client = function (self, peer_id, local_player_id)
	for i = #self._delayed_clients, 1, -1 do
		local peer_data = self._delayed_clients[i]

		if peer_data.peer_id == peer_id and peer_data.local_player_id == local_player_id then
			table.remove(self._delayed_clients, i)

			return
		end
	end
end

AdventureSpawning._update_joining_clients = function (self, dt, t)
	if self._spawning and self._profile_synchronizer:all_synced() then
		local network_server = self._network_server

		for i = #self._delayed_clients, 1, -1 do
			local peer_data = self._delayed_clients[i]
			local peer_id = peer_data.peer_id
			local local_player_id = peer_data.local_player_id

			if network_server:is_peer_ingame(peer_id) then
				self:_add_client_to_party(peer_id, local_player_id)
				table.remove(self._delayed_clients, i)
			end
		end
	end
end

AdventureSpawning._add_client_to_party = function (self, peer_id, local_player_id)
	if peer_id ~= Network.peer_id() then
		local update_safe = true
		local party_id = 1
		local removed_bot_player = Managers.state.game_mode:remove_bot(peer_id, local_player_id, update_safe)
		local status = Managers.party:get_player_status(peer_id, local_player_id)

		if status.party_id ~= 1 then
			Managers.party:request_join_party(peer_id, local_player_id, party_id, nil, removed_bot_player)
		end
	end
end

AdventureSpawning._spawn_player = function (self, status)
	local data = status.game_mode_data
	local position, rotation = self:_find_spawn_point(status)
	local is_initial_spawn = data.spawn_state == "is_initial_spawn"
	local session = Managers.state.network:game()

	if session then
		local peer_id = status.peer_id
		local local_player_id = status.local_player_id
		local profile_index = status.profile_index
		local career_index = status.career_index
		local network_consumables = SpawningHelper.netpack_consumables(data.consumables)
		local healthkit_id, potion_id, grenade_id = unpack(network_consumables)
		local network_additional_items = SpawningHelper.netpack_additional_items(data.additional_items)
		local network_buff_ids = {}

		if data.persistent_buffs then
			for _, buff_name in pairs(data.persistent_buffs.buff_names) do
				local buff_id = NetworkLookup.buff_templates[buff_name]

				table.insert(network_buff_ids, buff_id)
			end
		end

		local ammo = data.ammo
		local ammo_melee_percent_int = math.floor(ammo.slot_melee * 100)
		local ammo_ranged_percent_int = math.floor(ammo.slot_ranged * 100)
		local ability_cooldown_perentage = data.ability_cooldown_percentage or 1
		local ability_cooldown_percent_int = math.floor(ability_cooldown_perentage * 100)

		Managers.state.network.network_transmit:send_rpc("rpc_to_client_spawn_player", peer_id, local_player_id, profile_index, career_index, position, rotation, is_initial_spawn, ammo_melee_percent_int, ammo_ranged_percent_int, ability_cooldown_percent_int, healthkit_id, potion_id, grenade_id, network_additional_items, network_buff_ids)
	end

	data.spawn_state = is_initial_spawn and "initial_spawning" or "spawning"
end

AdventureSpawning._spawn_bot = function (self, status)
	local data = status.game_mode_data
	local position = data.position:unbox()
	local rotation = data.rotation:unbox()
	local is_initial_spawn = data.spawn_state == "is_initial_spawn"
	local consumables = data.consumables
	local ammo = data.ammo
	local peer_id = status.peer_id
	local local_player_id = status.local_player_id
	local bot_player = Managers.player:player(peer_id, local_player_id)

	fassert(bot_player.bot_player, "Trying to spawn a player as a bot, status info isn't correct")

	local ability_cooldown_perentage = data.ability_cooldown_percentage or 1
	local ability_cooldown_percent_int = math.floor(ability_cooldown_perentage * 100)

	bot_player:spawn(position, rotation, is_initial_spawn, ammo.slot_melee, ammo.slot_ranged, consumables.slot_healthkit, consumables.slot_potion, consumables.slot_grenade, ability_cooldown_percent_int)

	data.spawn_state = "spawned"
end

AdventureSpawning._find_spawn_point = function (self, status)
	local position, rotation
	local room_manager = Managers.state.room

	if room_manager then
		position, rotation = self:_spawn_pos_rot_from_index(room_manager:get_spawn_point_by_peer(status.peer_id))
	else
		local data = status.game_mode_data

		fassert(data.position, "This level is missing spawn-points for the players.")

		position = data.position:unbox()
		rotation = data.rotation:unbox()
	end

	return position, rotation
end

AdventureSpawning.force_update_spawn_positions = function (self, safe_position, safe_rotation)
	local saved_game_mode_data = self._saved_game_mode_data

	for i = 1, #saved_game_mode_data do
		local data = saved_game_mode_data[i]

		if data.position and data.rotation then
			data.position:store(safe_position)
			data.rotation:store(safe_rotation)
		end
	end
end

AdventureSpawning.set_respawning_enabled = function (self, enabled)
	fassert(self._respawns_enabled ~= enabled, "Respawns already enabled=%s", tostring(enabled))

	self._respawns_enabled = enabled
end

AdventureSpawning.set_spawning_disabled = function (self, disabled)
	self._spawning = not disabled
end

AdventureSpawning.add_spawn_point = function (self, unit)
	local pos = Unit.local_position(unit, 0)
	local rot = Unit.local_rotation(unit, 0)
	local spawn_point = {
		pos = Vector3Box(pos),
		rot = QuaternionBox(rot),
	}
	local prior_state = Unit.get_data(unit, "from_game_mode")
	local prior_state = prior_state ~= "" and prior_state or "default"

	self._spawn_points[prior_state] = self._spawn_points[prior_state] or {}
	self._spawn_points[prior_state][#self._spawn_points[prior_state] + 1] = spawn_point
end

AdventureSpawning.get_spawn_point = function (self)
	local default_state = "default"
	local came_from_mechanism = Managers.mechanism:get_last_mechanism_switch()
	local prior_state = Managers.mechanism:get_prior_state() or default_state
	local spawn_points = self._spawn_points[prior_state] or self._spawn_points[came_from_mechanism] or self._spawn_points[default_state]

	self._num_spawn_points_used = self._num_spawn_points_used + 1

	if self._num_spawn_points_used > #spawn_points then
		self._num_spawn_points_used = 1
	end

	local spawn_point = spawn_points[self._num_spawn_points_used]

	return spawn_point.pos, spawn_point.rot
end

AdventureSpawning.respawn_unit_spawned = function (self, unit)
	self._respawn_handler:respawn_unit_spawned(unit)
end

AdventureSpawning.respawn_gate_unit_spawned = function (self, unit)
	self._respawn_handler:respawn_gate_unit_spawned(unit)
end

AdventureSpawning.remove_respawn_units_due_to_crossroads = function (self, removed_path_distances, total_main_path_length)
	self._respawn_handler:remove_respawn_units_due_to_crossroads(removed_path_distances, total_main_path_length)
end

AdventureSpawning.recalc_respawner_dist_due_to_crossroads = function (self)
	self._respawn_handler:recalc_respawner_dist_due_to_crossroads()
end

AdventureSpawning.teleport_despawned_players = function (self, position)
	local party = self._side.party
	local occupied_slots = party.occupied_slots
	local player_manager = Managers.player

	for i = 1, #occupied_slots do
		local status = occupied_slots[i]
		local peer_id = status.peer_id
		local local_player_id = status.local_player_id
		local player = peer_id and local_player_id and player_manager:player(peer_id, local_player_id)

		if not player or not player.player_unit then
			status.game_mode_data.position:store(position)
		end
	end
end

AdventureSpawning.force_respawn = function (self, peer_id, local_player_id)
	local status = Managers.party:get_player_status(peer_id, local_player_id)
	local data = status.game_mode_data

	data.spawn_state = "force_respawn"
end

AdventureSpawning.force_respawn_dead_players = function (self)
	local party = self._side.party

	self._respawn_handler:force_respawn_dead_players(party)
end

AdventureSpawning.set_override_respawn_group = function (self, respawn_group_name, active)
	self._respawn_handler:set_override_respawn_group(respawn_group_name, active)
end

AdventureSpawning.set_respawn_group_enabled = function (self, respawn_group_name, enabled)
	self._respawn_handler:set_respawn_group_enabled(respawn_group_name, enabled)
end

AdventureSpawning.set_respawn_gate_enabled = function (self, respawn_gate_unit, enabled)
	self._respawn_handler:set_respawn_gate_enabled(respawn_gate_unit, enabled)
end

AdventureSpawning.get_active_respawn_units = function (self)
	return self._respawn_handler:get_active_respawn_units()
end

AdventureSpawning.set_move_dead_players_to_next_respawn = function (self, value)
	self._respawn_handler:set_move_dead_players_to_next_respawn(value)
end

AdventureSpawning.get_respawn_handler = function (self)
	return self._respawn_handler
end

AdventureSpawning.add_spawn_point_to_spawn_group = function (self, unit)
	if not self._spawn_groups then
		self._spawn_groups = {}
	end

	local pos = Unit.local_position(unit, 0)
	local rot = Unit.local_rotation(unit, 0)
	local spawn_point = {
		pos = Vector3Box(pos),
		rot = QuaternionBox(rot),
	}
	local group_id = Unit.get_data(unit, "spawn_group")

	fassert(group_id, "spawn group property missing from spawn point unit")

	if not self._spawn_groups[group_id] then
		self._spawn_groups[group_id] = {}
	end

	local num_points = #self._spawn_groups[group_id]

	self._spawn_groups[group_id][num_points + 1] = spawn_point
end

AdventureSpawning.get_spawn_point_from_spawn_group = function (self, group_id)
	if not self._used_spawn_group_positions then
		self._used_spawn_group_positions = {}
	end

	local spawn_points = self._spawn_groups[group_id]
	local num_spawnpoints = spawn_points and #spawn_points

	fassert(num_spawnpoints, "no spawn points exists for indicated spawn group: ", group_id)

	if self._used_spawn_group_positions[group_id] then
		self._used_spawn_group_positions[group_id] = self._used_spawn_group_positions[group_id] + 1
	else
		self._used_spawn_group_positions[group_id] = 1
	end

	local spawn_point = spawn_points[self._used_spawn_group_positions[group_id]]

	return spawn_point.pos, spawn_point.rot
end
