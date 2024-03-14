-- chunkname: @scripts/unit_extensions/default_player_unit/ghost_mode/player_unit_ghost_mode_extension.lua

require("scripts/entity_system/systems/ghost_mode/ghost_mode_utils")

PlayerUnitGhostModeExtension = class(PlayerUnitGhostModeExtension)

PlayerUnitGhostModeExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._world = extension_init_context.world
	self._network_transmit = extension_init_context.network_transmit
	self._is_server = self._network_transmit.is_server
	self._unit_storage = extension_init_context.unit_storage
	self._teleport_unit_index = 1

	local side_id = extension_init_data.side_id

	self._side = Managers.state.side:get_side(side_id)

	fassert(self._side, "no side assigned.")

	self._allowed_to_leave = false
	self._ghost_mode_active = false
	self._allowed_to_enter = false
	self._reason_not_allowed_to_leave = nil
	self._reason_allowed_to_enter = nil

	self:_set_teleport_target_type("disabled")

	self._has_teleported = false
	self._has_left_once = false
	self._enter_ghost_mode_allowance_check_time = 0
	self._leave_ghost_mode_allowance_check_time = 0
	self._is_husk = false
	self._latest_range_update = math.huge
	self._range = math.huge
	self._minimum_spawn_distance = GameModeSettings.versus.dark_pact_minimum_spawn_distance
	self._prev_round_started = Managers.state.game_mode:is_round_started()
end

PlayerUnitGhostModeExtension.extensions_ready = function (self)
	self._locomotion_extension = ScriptUnit.extension(self._unit, "locomotion_system")
	self._inventory_extension = ScriptUnit.extension(self._unit, "inventory_system")
	self._breed = Unit.get_data(self._unit, "breed")
end

PlayerUnitGhostModeExtension.game_object_initialized = function (self, unit, go_id)
	local start_in_ghost_mode = true

	if start_in_ghost_mode then
		local ignore_send = true
		local teleport_player = false

		self:_enter_ghost_mode(ignore_send, teleport_player)
	end
end

PlayerUnitGhostModeExtension.destroy = function (self)
	return
end

PlayerUnitGhostModeExtension.update = function (self, unit, input, dt, context, t)
	if self:is_in_ghost_mode() then
		self:_update_allowed_to_leave(t)
	else
		self:_update_allowed_to_enter(t)
	end
end

PlayerUnitGhostModeExtension._update_allowed_to_leave = function (self, t, force_update)
	local unit = self._unit

	self._range = math.ceil(self:get_distance_from_players(unit))

	if self._range and self._range ~= self._latest_range_update then
		Managers.state.event:trigger("update_range_to_spawn", self._range)

		self._latest_range_update = self._range
	end

	if not force_update and t < self._enter_ghost_mode_allowance_check_time then
		return
	end

	self._enter_ghost_mode_allowance_check_time = t + 0.33

	local world = self._world
	local always_allow_leave_ghost_mode = script_data.always_allow_leave_ghost_mode or Development.parameter("disable_ghost_mode")
	local side_manager = Managers.state.side
	local side = side_manager.side_by_unit[unit]
	local enemy_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local physics_world = World.get_data(world, "physics_world")
	local in_los = GhostModeUtils.in_line_of_sight_of_enemies(unit, enemy_positions, physics_world)
	local in_range = GhostModeUtils.in_range_of_enemies(unit)
	local round_started = Managers.state.game_mode:is_round_started()
	local enemies_using_transport = GhostModeUtils.enemy_players_using_transport(unit)
	local in_safe_zone = GhostModeUtils.in_safe_zone(unit)
	local teleport_target_type = "player"

	if not always_allow_leave_ghost_mode and (enemies_using_transport or not round_started) then
		teleport_target_type = "disabled"
	end

	if teleport_target_type ~= self._teleport_target_type then
		self:_set_teleport_target_type(teleport_target_type)
	end

	local _, reason_prev = self:allowed_to_leave()
	local owner = Managers.player:owner(unit)
	local status = Managers.party:get_player_status(owner.peer_id, owner:local_player_id())
	local spawn_timer = status and status.game_mode_data.spawn_timer or 0
	local reason = "allowed"

	if enemies_using_transport then
		reason = "transport"
	elseif in_los then
		reason = "los"
	elseif in_range then
		reason = "range"
	elseif spawn_timer - t > 0 then
		reason = "w8_to_spawn"
	elseif not round_started then
		reason = "start_zone"
	elseif in_safe_zone then
		reason = "in_safe_zone"
	end

	if reason ~= reason_prev then
		local allowed_to_leave = reason == "allowed"

		self:_set_allowed_to_leave(allowed_to_leave, reason)
	end
end

PlayerUnitGhostModeExtension._update_allowed_to_enter = function (self, t, force_update)
	if not force_update and t < self._enter_ghost_mode_allowance_check_time then
		return
	end

	self._enter_ghost_mode_allowance_check_time = t + 0.33

	local unit = self._unit
	local enemies_using_transport = GhostModeUtils.enemy_players_using_transport(unit)
	local far_away_enough = GhostModeUtils.far_enough_to_enter_ghost_mode(unit)
	local status_extension = ScriptUnit.extension(unit, "status_system")
	local unit_alive = not not HEALTH_ALIVE[unit] and not status_extension:is_dead()
	local blocking_action = false
	local _, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(self._inventory_extension)
	local current_action_settings = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)

	if current_action_settings and current_action_settings.disallow_ghost_mode then
		blocking_action = true
	end

	local allowed_to_enter = unit_alive and (far_away_enough or enemies_using_transport) and not blocking_action and self:allowed_to_leave()
	local allowed_to_enter_prev, reason_allowed_to_enter_prev = self:allowed_to_enter()
	local reason = far_away_enough and "distance" or enemies_using_transport and "transport" or blocking_action and "blocking_action"

	if allowed_to_enter ~= allowed_to_enter_prev or not allowed_to_enter and reason ~= reason_allowed_to_enter_prev then
		self:_set_allowed_to_enter(allowed_to_enter, reason)
	end
end

PlayerUnitGhostModeExtension._set_allowed_to_leave = function (self, allowed_to_leave, reason)
	local side = self._side
	local enemy_units = side.ENEMY_PLAYER_AND_BOT_UNITS
	local num_enemy_units = #enemy_units

	if not self._has_teleported then
		self._teleport_unit_index = self._teleport_unit_index + 1

		if num_enemy_units < self._teleport_unit_index then
			self._teleport_unit_index = 1
		end

		local target_unit = enemy_units[self._teleport_unit_index]

		Managers.state.event:trigger("add_gameplay_info_event", "ghost_catchup", true, nil, target_unit)
	end

	if self._allowed_to_leave ~= allowed_to_leave or not allowed_to_leave and self._reason_not_allowed_to_leave ~= reason then
		if allowed_to_leave then
			Managers.state.event:trigger("add_gameplay_info_event", "ghost_spawn", true)
			self:_play_sound("versus_ghost_mode_spawn_indicator")
		else
			if reason == "start_zone" then
				Managers.state.event:trigger("add_gameplay_info_event", "hide_teleport", true, reason)
			end

			Managers.state.event:trigger("add_gameplay_info_event", "ghost_cantspawn", true, reason)
		end
	end

	self._allowed_to_leave = allowed_to_leave
	self._reason_not_allowed_to_leave = reason
end

PlayerUnitGhostModeExtension.get_distance_from_players = function (self, unit)
	local side_manager = Managers.state.side
	local side = side_manager.side_by_unit[unit]
	local enemy_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local unit_position = POSITION_LOOKUP[unit]
	local distance_to_spawn = math.huge

	for i = 1, #enemy_positions do
		local enemy_position = enemy_positions[i]
		local distance = Vector3.distance(enemy_position, unit_position)

		if distance < self._minimum_spawn_distance and distance < distance_to_spawn then
			distance_to_spawn = self._minimum_spawn_distance - distance
		end
	end

	if distance_to_spawn < 0 or distance_to_spawn > self._minimum_spawn_distance then
		return 0
	else
		return distance_to_spawn
	end
end

PlayerUnitGhostModeExtension.allowed_to_leave = function (self)
	if Development.parameter("disable_ghost_mode") then
		return true
	else
		return self._allowed_to_leave, self._reason_not_allowed_to_leave
	end
end

PlayerUnitGhostModeExtension._set_allowed_to_enter = function (self, allowed_to_enter, reason)
	if allowed_to_enter then
		local side = self._side
		local enemy_units = side.ENEMY_PLAYER_AND_BOT_UNITS
		local num_enemy_units = #enemy_units

		self._teleport_unit_index = self._teleport_unit_index + 1

		if num_enemy_units < self._teleport_unit_index then
			self._teleport_unit_index = 1
		end

		local target_unit = enemy_units[self._teleport_unit_index]

		Managers.state.event:trigger("add_gameplay_info_event", "ghost_catchup", true, nil, target_unit)
		Managers.state.event:trigger("add_gameplay_info_event", "hide_text", true, nil, target_unit)
	else
		Managers.state.event:trigger("add_gameplay_info_event", "ghost_catchup", false, nil)
	end

	self._allowed_to_enter = allowed_to_enter
	self._reason_allowed_to_enter = reason
end

PlayerUnitGhostModeExtension.allowed_to_enter = function (self)
	return self._allowed_to_enter, self._reason_allowed_to_enter
end

PlayerUnitGhostModeExtension.is_in_ghost_mode = function (self)
	return self._ghost_mode_active, self._has_left_once
end

PlayerUnitGhostModeExtension.is_husk = function (self)
	return self._is_husk
end

PlayerUnitGhostModeExtension.teleport_player = function (self)
	if self._teleport_target_type == "player" then
		self:_teleport_to_next_enemy()
	elseif self._teleport_target_type == "safe_spot" then
		self:_teleport_to_safe_spot()
	end

	if false then
		-- Nothing
	end
end

PlayerUnitGhostModeExtension._teleport_to_next_enemy = function (self)
	local side = self._side
	local enemy_units = side.ENEMY_PLAYER_AND_BOT_UNITS
	local num_enemy_units = #enemy_units

	if num_enemy_units == 0 then
		return
	end

	self._teleport_unit_index = math.min(self._teleport_unit_index, num_enemy_units)

	self:_set_allowed_to_leave(false, "los")

	local target_unit = enemy_units[self._teleport_unit_index]
	local target_pos = POSITION_LOOKUP[target_unit] + Vector3(0, 0, 0.2)
	local target_breed = Unit.get_data(target_unit, "breed")

	self._locomotion_extension:teleport_to(target_pos)

	self._has_teleported = true
	self._teleport_unit_index = math.index_wrapper(self._teleport_unit_index + 1, num_enemy_units)
	target_unit = enemy_units[self._teleport_unit_index]

	Managers.state.event:trigger("add_gameplay_info_event", "ghost_catchup", true, nil, target_unit)
	Managers.state.event:trigger("add_gameplay_info_event", "ghost_cantspawn", true, {
		"los",
		"start_zone",
		"transport",
	})
end

PlayerUnitGhostModeExtension._teleport_to_safe_spot = function (self)
	self._locomotion_extension:teleport_to(self._safe_spot:unbox() + Vector3(0, 0, 0.2))
end

PlayerUnitGhostModeExtension._enter_ghost_mode = function (self, ignore_send, teleport_player)
	self._ghost_mode_active = true

	if not DEDICATED_SERVER then
		local skin_unit = CosmeticsUtils.get_third_person_mesh_unit(self._unit)

		Unit.flow_event(skin_unit, "lua_entered_ghost_mode")
	end

	local equipment = self._inventory_extension:equipment()
	local weapon_unit = equipment.right_hand_wielded_unit or equipment.left_hand_wielded_unit

	if not DEDICATED_SERVER and weapon_unit then
		Unit.flow_event(weapon_unit, "lua_entered_ghost_mode")
	end

	MOOD_BLACKBOARD.ghost_mode = true

	if teleport_player then
		self:teleport_player()
	end

	local status_extension = ScriptUnit.extension(self._unit, "status_system")

	status_extension:set_ghost_mode(true)
	status_extension:set_invisible(true, nil, "ghost_mode")
	GhostModeSystem.set_sweep_actors(self._unit, self._breed, false)
	self._locomotion_extension:set_mover_filter_property("dark_pact_noclip", true)

	if not ignore_send then
		local unit_go_id = self._unit_storage:go_id(self._unit)

		if self._is_server then
			self._network_transmit:send_rpc_clients("rpc_entered_ghost_mode", unit_go_id)
		else
			self._network_transmit:send_rpc_server("rpc_entered_ghost_mode", unit_go_id)
		end
	end

	Managers.state.event:trigger("enter_ghostmode", true, self._unit)
	Managers.state.event:trigger("set_new_enemy_role")
	self:_play_sound("versus_enter_ghost_mode")
end

PlayerUnitGhostModeExtension._leave_ghost_mode = function (self)
	self._ghost_mode_active = false
	self._has_teleported = false
	self._has_left_once = true

	local player_unit = self._unit
	local equipment = self._inventory_extension:equipment()
	local weapon_unit = equipment.right_hand_wielded_unit or equipment.left_hand_wielded_unit
	local status_extension = ScriptUnit.extension(self._unit, "status_system")

	status_extension:set_ghost_mode(false)
	status_extension:set_invisible(false, nil, "ghost_mode")
	GhostModeSystem.set_sweep_actors(self._unit, self._breed, true)
	Managers.telemetry_events:left_ghost_mode(self._breed.name, POSITION_LOOKUP[self._unit])

	if not DEDICATED_SERVER then
		if weapon_unit then
			Unit.flow_event(weapon_unit, "lua_left_ghost_mode")
		end

		local skin_unit = CosmeticsUtils.get_third_person_mesh_unit(self._unit)

		Unit.flow_event(skin_unit, "lua_left_ghost_mode")
	end

	MOOD_BLACKBOARD.ghost_mode = false

	self._locomotion_extension:set_mover_filter_property("dark_pact_noclip", false)
	Managers.state.event:trigger("enter_ghostmode", false, player_unit)
	Managers.state.event:trigger("add_gameplay_info_event", "hide_text", true, {
		"los",
		"start_zone",
		"transport",
	})

	if not self._display_equipment then
		self._display_equipment = true
	end

	self:_play_sound("menu_versus_pactsworn_spawn")

	if self._is_server then
		local dialogue_input = ScriptUnit.extension_input(player_unit, "dialogue_system")

		dialogue_input:trigger_dialogue_event("spawning")
	end

	local unit_go_id = self._unit_storage:go_id(self._unit)

	if self._is_server then
		self._network_transmit:send_rpc_clients("rpc_left_ghost_mode", unit_go_id)
	else
		self._network_transmit:send_rpc_server("rpc_left_ghost_mode", unit_go_id)
	end
end

PlayerUnitGhostModeExtension.try_enter_ghost_mode = function (self)
	fassert(not self:is_in_ghost_mode(), "In ghost mode already.")

	local t = Managers.time:time("game")

	self:_update_allowed_to_enter(t, true)

	if self:allowed_to_enter() then
		local ignore_send = false
		local teleport_player = true

		self:_enter_ghost_mode(ignore_send, teleport_player)
	end
end

PlayerUnitGhostModeExtension.try_leave_ghost_mode = function (self, force_leave)
	fassert(self:is_in_ghost_mode(), "In ghost mode already.")

	local t = Managers.time:time("game")

	self:_update_allowed_to_leave(t, true)

	if force_leave or self:allowed_to_leave() then
		self:_leave_ghost_mode()
	end
end

PlayerUnitGhostModeExtension.set_safe_spot = function (self, safe_spot)
	self._safe_spot = safe_spot
end

PlayerUnitGhostModeExtension._set_teleport_target_type = function (self, teleport_target_type)
	if self:allowed_to_enter() and teleport_target_type ~= "player" then
		print(self:allowed_to_enter(), teleport_target_type)
		Crashify.print_exception("GhostModeSystem", "Allowed to enter ghost mode while not allowed to teleport.")
	end

	self._teleport_target_type = teleport_target_type
end

PlayerUnitGhostModeExtension._play_sound = function (self, name)
	local world = Managers.world:world("level_world")
	local wwise_world = Managers.world:wwise_world(world)

	WwiseWorld.trigger_event(wwise_world, name)
end
