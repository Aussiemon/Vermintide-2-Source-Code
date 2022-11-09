require("scripts/managers/spawn/respawn_handler")
require("scripts/managers/game_mode/spawning_components/spawning_helper")

local MINIMUM_HEALTH = 0.5
local REAL_PLAYER_LOCAL_ID = 1
DeusSpawning = class(DeusSpawning)

DeusSpawning.init = function (self, profile_synchronizer, side, is_server, network_server, deus_run_controller)
	self._profile_synchronizer = profile_synchronizer
	self._side = side
	self._is_server = is_server
	self._network_server = network_server
	self._respawns_enabled = true
	self._spawning = true
	self._respawn_handler = RespawnHandler:new(profile_synchronizer, is_server)
	self._spawn_points = {}
	self._num_spawn_points_used = 0
	self._status_updates_active = true
	self._delayed_clients = {}
	self._deus_run_controller = deus_run_controller
end

DeusSpawning.register_rpcs = function (self, network_event_delegate, network_transmit)
	self._respawn_handler:register_rpcs(network_event_delegate, network_transmit)
end

DeusSpawning.unregister_rpcs = function (self)
	self._respawn_handler:unregister_rpcs()
end

DeusSpawning._restore_player_game_mode_data = function (self, peer_id, local_player_id, profile_index, career_index)
	local game_mode_data = self._deus_run_controller:restore_game_mode_data(peer_id, local_player_id, profile_index, career_index)
	game_mode_data.temporary_health_percentage = 0
	game_mode_data.ability_cooldown_percentage = 1
	game_mode_data.last_update = -math.huge
	local ingame_time = Managers.time:time("client_ingame")
	local is_initial_spawn = ingame_time == nil or ingame_time < 10
	local box_pos, box_rot = nil

	if is_initial_spawn then
		box_pos, box_rot = self:get_spawn_point()
	else
		local conflict_director = Managers.state.conflict
		local main_paths = conflict_director.level_analysis:get_main_paths()
		local main_path_info = conflict_director.main_path_info
		local main_path_player_info = conflict_director.main_path_player_info
		box_pos, box_rot = MainPathUtils.get_main_path_point_between_players(main_paths, main_path_info, main_path_player_info)
	end

	game_mode_data.position = box_pos
	game_mode_data.rotation = box_rot

	if game_mode_data.health_state ~= "alive" then
		game_mode_data.health_state = "dead"
		game_mode_data.ready_for_respawn = true
	end

	if game_mode_data.health_state == "dead" then
		game_mode_data.spawn_state = "not_spawned"
	elseif is_initial_spawn then
		game_mode_data.spawn_state = "is_initial_spawn"
	else
		game_mode_data.spawn_state = "spawn"
	end

	if game_mode_data.health_state == "alive" then
		local minimum_health_at_start = MINIMUM_HEALTH
		game_mode_data.health_percentage = math.max(game_mode_data.health_percentage, minimum_health_at_start)
	end

	game_mode_data.needs_initial_buffs = true

	return game_mode_data
end

DeusSpawning._check_observer_camera = function (self, peer_id, local_player_id)
	local self_peer_id = self._deus_run_controller:get_own_peer_id()
	local dead = self._deus_run_controller:get_player_health_state(peer_id, local_player_id) == "dead"

	if dead and peer_id ~= self_peer_id then
		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		RPC.rpc_set_observer_camera(channel_id, local_player_id)
	end
end

DeusSpawning._unassign_data_from_slot = function (self, slot, data)
	slot.game_mode_data = {}
end

DeusSpawning.player_entered_game_session = function (self, peer_id, local_player_id)
	local status = Managers.party:get_player_status(peer_id, local_player_id)

	if status.career_index then
		status.game_mode_data = self:_restore_player_game_mode_data(peer_id, local_player_id, status.profile_index, status.career_index)
	end
end

DeusSpawning.player_joined_party = function (self, peer_id, local_player_id, party_id, slot_id)
	return
end

DeusSpawning.player_left_party = function (self, peer_id, local_player_id, party_id, slot_id)
	return
end

DeusSpawning.update = function (self, t, dt)
	if Managers.state.network:game() then
		self._respawn_handler:update(dt, t)
	end
end

DeusSpawning.server_update = function (self, t, dt)
	if Managers.state.network:game() then
		local party = self._side.party
		local occupied_slots = party.occupied_slots

		if self._status_updates_active then
			self:_update_player_status(t, dt, occupied_slots)
		end

		local allow_respawns = Managers.state.difficulty:get_difficulty_settings().allow_respawns

		if self._respawns_enabled and allow_respawns then
			self._respawn_handler:server_update(dt, t, occupied_slots)
		end

		self:_update_spawning(dt, t, occupied_slots)
		self:_update_joining_clients(dt, t)
	end
end

DeusSpawning.profile_changed = function (self, peer_id, local_player_id, profile_index, career_index)
	local status = Managers.party:get_player_status(peer_id, local_player_id)
	status.game_mode_data = self:_restore_player_game_mode_data(peer_id, local_player_id, status.profile_index, status.career_index)
end

local working_persistent_buff_array = {}

DeusSpawning._update_player_status = function (self, t, dt, occupied_slots)
	local player_manager = Managers.player
	local ScriptUnit_extension = ScriptUnit.extension

	for i = 1, #occupied_slots, 1 do
		local status = occupied_slots[i]
		local data = status.game_mode_data
		local peer_id = status.peer_id
		local local_player_id = status.local_player_id

		if peer_id and local_player_id then
			local player = player_manager:player(peer_id, local_player_id)

			if player then
				local spawn_state = data.spawn_state

				if spawn_state == "force_respawn" then
					if not Unit.alive(player.player_unit) and self._profile_synchronizer:all_synced() then
						data.spawn_state = "spawn"
					end
				elseif spawn_state == "spawned" then
					local player_unit = player.player_unit

					if not player_unit then
						data.needs_initial_buffs = true
					else
						if data.needs_initial_buffs then
							self:_apply_initial_buffs(player)

							data.needs_initial_buffs = false
						end

						local safe_position = ScriptUnit_extension(player_unit, "locomotion_system"):last_position_on_navmesh()

						data.position:store(safe_position)
						data.rotation:store(Unit.local_rotation(player_unit, 0))

						local status_extension = ScriptUnit_extension(player_unit, "status_system")
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

						local buff_ext = ScriptUnit_extension(player_unit, "buff_system")
						local buffs = buff_ext:active_buffs()

						table.clear(working_persistent_buff_array)

						local index = 1

						for _, buff_data in pairs(buffs) do
							local template = buff_data.template

							if not buff_data.removed and template.is_persistent then
								working_persistent_buff_array[index] = template.name
								index = index + 1
							end
						end

						self._deus_run_controller:save_game_mode_data(peer_id, local_player_id, status.profile_index, status.career_index, data)
						self._deus_run_controller:save_persistent_buffs(peer_id, local_player_id, status.profile_index, status.career_index, working_persistent_buff_array)
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

DeusSpawning._apply_initial_buffs = function (self, player)
	local player_unit = player.player_unit
	local peer_id = player:network_id()
	local local_player_id = player:local_player_id()
	local buff_system = Managers.state.entity:system("buff_system")
	local persistent_buffs = self._deus_run_controller:get_player_persistent_buffs(peer_id, local_player_id)

	for _, persistent_buff in ipairs(persistent_buffs) do
		buff_system:add_buff(player_unit, persistent_buff, player_unit)
	end

	local power_ups = self._deus_run_controller:get_player_power_ups(player.peer_id, local_player_id)

	for _, power_up_instance in ipairs(power_ups) do
		local power_up = DeusPowerUps[power_up_instance.rarity][power_up_instance.name]

		if not power_up.talent then
			buff_system:add_buff(player_unit, power_up.buff_name, player_unit)
		end
	end

	local party_power_ups = self._deus_run_controller:get_party_power_ups()

	for _, power_up_instance in ipairs(party_power_ups) do
		local power_up = DeusPowerUps[power_up_instance.rarity][power_up_instance.name]

		buff_system:add_buff(player_unit, power_up.buff_name, player_unit)
	end
end

DeusSpawning._update_spawning = function (self, dt, t, occupied_slots)
	if self._spawning then
		local own_peer_id = self._deus_run_controller:get_own_peer_id()
		local local_player_is_ready = false

		for i = 1, #occupied_slots, 1 do
			local status = occupied_slots[i]
			local other_peer_id = status.peer_id
			local other_local_player_id = status.local_player_id

			if not self._profile_synchronizer:all_synced_for_peer(other_peer_id, other_local_player_id) then
				return
			end

			if other_peer_id == own_peer_id and other_local_player_id == REAL_PLAYER_LOCAL_ID then
				local_player_is_ready = true
			end
		end

		if not local_player_is_ready then
			return
		end

		local network_server = self._network_server

		for i = 1, #occupied_slots, 1 do
			local status = occupied_slots[i]
			local data = status.game_mode_data
			local spawn_state = data.spawn_state
			local ready_to_spawn = nil

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

DeusSpawning.add_delayed_client = function (self, peer_id, local_player_id)
	self._delayed_clients[#self._delayed_clients + 1] = {
		peer_id = peer_id,
		local_player_id = local_player_id
	}
end

DeusSpawning.remove_delayed_client = function (self, peer_id, local_player_id)
	for i = #self._delayed_clients, 1, -1 do
		local peer_data = self._delayed_clients[i]

		if peer_data.peer_id == peer_id and peer_data.local_player_id == local_player_id then
			table.remove(self._delayed_clients, i)

			return
		end
	end
end

DeusSpawning._update_joining_clients = function (self, dt, t)
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

DeusSpawning._add_client_to_party = function (self, peer_id, local_player_id)
	local update_safe = true
	local party_id = 1
	local removed_bot_player = Managers.state.game_mode:remove_bot(peer_id, local_player_id, update_safe)
	local status = Managers.party:get_player_status(peer_id, local_player_id)

	if status.party_id ~= 1 then
		Managers.party:request_join_party(peer_id, local_player_id, party_id, nil, removed_bot_player)
	end
end

DeusSpawning._spawn_player = function (self, status)
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
		local ammo = data.ammo
		local ammo_melee_percent_int = math.floor(ammo.slot_melee * 100)
		local ammo_ranged_percent_int = math.floor(ammo.slot_ranged * 100)
		local ability_cooldown_perentage = data.ability_cooldown_percentage or 1
		local ability_cooldown_percent_int = math.floor(ability_cooldown_perentage * 100)

		printf("rpc_to_client_spawn_player %s %d", tostring(peer_id), local_player_id)
		Managers.state.network.network_transmit:send_rpc("rpc_to_client_spawn_player", peer_id, local_player_id, profile_index, career_index, position, rotation, is_initial_spawn, ammo_melee_percent_int, ammo_ranged_percent_int, ability_cooldown_percent_int, healthkit_id, potion_id, grenade_id, network_additional_items, network_buff_ids)
	end

	data.spawn_state = (is_initial_spawn and "initial_spawning") or "spawning"
end

DeusSpawning._spawn_bot = function (self, status)
	local data = status.game_mode_data
	local peer_id = status.peer_id
	local local_player_id = status.local_player_id
	local position = data.position:unbox()
	local rotation = data.rotation:unbox()
	local is_initial_spawn = false
	local consumables = data.consumables
	local ammo = data.ammo
	local bot_player = Managers.player:player(peer_id, local_player_id)

	fassert(bot_player.bot_player, "Trying to spawn a player as a bot, status info isn't correct")

	local ability_cooldown_perentage = data.ability_cooldown_percentage or 1
	local ability_cooldown_percent_int = math.floor(ability_cooldown_perentage * 100)

	bot_player:spawn(position, rotation, is_initial_spawn, ammo.slot_melee, ammo.slot_ranged, consumables.slot_healthkit, consumables.slot_potion, consumables.slot_grenade, ability_cooldown_percent_int)

	data.spawn_state = "spawned"
end

DeusSpawning._find_spawn_point = function (self, status)
	local position, rotation = nil
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

DeusSpawning.force_update_spawn_positions = function (self, safe_position, safe_rotation)
	local party = self._side.party
	local occupied_slots = party.occupied_slots

	for i = 1, #occupied_slots, 1 do
		local status = occupied_slots[i]
		local data = status.game_mode_data

		if data and data.position and data.rotation then
			data.position:store(safe_position)
			data.rotation:store(safe_rotation)
		end
	end
end

DeusSpawning.set_respawning_enabled = function (self, enabled)
	fassert(self._respawns_enabled ~= enabled, "Respawns already enabled=%s", tostring(enabled))

	self._respawns_enabled = enabled
end

DeusSpawning.set_spawning_disabled = function (self, disabled)
	self._spawning = not disabled
end

DeusSpawning.add_spawn_point = function (self, unit)
	local pos = Unit.local_position(unit, 0)
	local rot = Unit.local_rotation(unit, 0)
	local spawn_point = {
		pos = Vector3Box(pos),
		rot = QuaternionBox(rot)
	}
	local prior_state = Unit.get_data(unit, "from_game_mode")
	prior_state = (prior_state ~= "" and prior_state) or "default"
	self._spawn_points[prior_state] = self._spawn_points[prior_state] or {}
	self._spawn_points[prior_state][#self._spawn_points[prior_state] + 1] = spawn_point
end

DeusSpawning.get_spawn_point = function (self)
	local default_state = "default"
	local prior_state = Managers.mechanism:get_prior_state()
	local spawn_points = self._spawn_points[prior_state] or self._spawn_points[default_state]
	self._num_spawn_points_used = self._num_spawn_points_used + 1

	if self._num_spawn_points_used > #spawn_points then
		self._num_spawn_points_used = 1
	end

	local spawn_point = spawn_points[self._num_spawn_points_used]

	return spawn_point.pos, spawn_point.rot
end

DeusSpawning.respawn_unit_spawned = function (self, unit)
	self._respawn_handler:respawn_unit_spawned(unit)
end

DeusSpawning.respawn_gate_unit_spawned = function (self, unit)
	self._respawn_handler:respawn_gate_unit_spawned(unit)
end

DeusSpawning.remove_respawn_units_due_to_crossroads = function (self, removed_path_distances, total_main_path_length)
	self._respawn_handler:remove_respawn_units_due_to_crossroads(removed_path_distances, total_main_path_length)
end

DeusSpawning.recalc_respawner_dist_due_to_crossroads = function (self)
	self._respawn_handler:recalc_respawner_dist_due_to_crossroads()
end

DeusSpawning.disable_status_updates = function (self)
	self._status_updates_active = false
end

DeusSpawning.teleport_despawned_players = function (self, position)
	local party = self._side.party
	local occupied_slots = party.occupied_slots
	local player_manager = Managers.player

	for i = 1, #occupied_slots, 1 do
		local status = occupied_slots[i]
		local peer_id = status.peer_id
		local local_player_id = status.local_player_id
		local player = peer_id and local_player_id and player_manager:player(peer_id, local_player_id)

		if not player or not player.player_unit then
			status.game_mode_data.position:store(position)
		end
	end
end

DeusSpawning.force_respawn = function (self, peer_id, local_player_id)
	local status = Managers.party:get_player_status(peer_id, local_player_id)
	local data = status.game_mode_data
	data.spawn_state = "force_respawn"
end

DeusSpawning.force_respawn_dead_players = function (self)
	local party = self._side.party

	self._respawn_handler:force_respawn_dead_players(party)
end

DeusSpawning.set_override_respawn_group = function (self, respawn_group_name, active)
	self._respawn_handler:set_override_respawn_group(respawn_group_name, active)
end

DeusSpawning.set_respawn_group_enabled = function (self, respawn_group_name, enabled)
	self._respawn_handler:set_respawn_group_enabled(respawn_group_name, enabled)
end

DeusSpawning.set_respawn_gate_enabled = function (self, respawn_gate_unit, enabled)
	self._respawn_handler:set_respawn_gate_enabled(respawn_gate_unit, enabled)
end

DeusSpawning.get_active_respawn_units = function (self)
	return self._respawn_handler:get_active_respawn_units()
end

DeusSpawning.get_respawn_handler = function (self)
	return self._respawn_handler
end

return
