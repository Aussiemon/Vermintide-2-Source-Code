require("scripts/settings/game_mode_settings")
require("scripts/managers/game_mode/game_modes/game_mode_adventure")
require("scripts/managers/game_mode/game_modes/game_mode_survival")
require("scripts/managers/game_mode/game_modes/game_mode_tutorial")
require("scripts/managers/game_mode/game_modes/game_mode_inn")
require("scripts/managers/game_mode/game_modes/game_mode_demo")
require("scripts/managers/game_mode/mutator_handler")

local RPCS = {
	"rpc_to_client_spawn_player",
	"rpc_is_ready_for_transition"
}
GameModeManager = class(GameModeManager)
GameModeManager.init = function (self, world, lobby_host, lobby_client, level_transition_handler, network_event_delegate, statistics_db, game_mode_key, network_server, network_transmit)
	local level_key = level_transition_handler.get_current_level_keys(level_transition_handler)
	self.level_transition_handler = level_transition_handler
	self._lobby_host = lobby_host
	self._lobby_client = lobby_client
	self.is_server = not not lobby_host
	self._world = world
	self._game_mode_key = game_mode_key
	self._level_key = level_key
	self._end_conditions_met = false
	self._gm_event_end_conditions_met = false
	self._round_started = false
	self._end_reason = nil
	self._ready_for_transition = nil
	self.statistics_db = statistics_db
	self.network_server = network_server
	self._network_transmit = network_transmit

	self._init_game_mode(self, game_mode_key)

	local event_manager = Managers.state.event

	event_manager.register(event_manager, self, "reload_application_settings", "event_reload_application_settings")
	event_manager.register(event_manager, self, "gm_event_end_conditions_met", "gm_event_end_conditions_met")
	event_manager.register(event_manager, self, "gm_event_round_started", "gm_event_round_started")
	event_manager.register(event_manager, self, "camera_teleported", "event_camera_teleported")

	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self._object_sets = nil
	self._object_set_names = nil
	self._end_level_areas = {}
	self._debug_end_level_areas = {}
	local max_size = 8192
	self._flow_set_data = {
		units_per_frame = 150,
		write_index = 1,
		read_index = 1,
		size = 0,
		ring_buffer = Script.new_array(max_size),
		max_size = max_size
	}
	local mutators = Managers.deed:mutators()
	local has_local_client = not DEDICATED_SERVER
	self._mutator_handler = MutatorHandler:new(mutators, self.is_server, has_local_client)

	return 
end
GameModeManager.destroy = function (self)
	self._mutator_handler:destroy()

	self._lobby_host = nil
	self._lobby_client = nil
	self.level_transition_handler = nil

	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil

	return 
end
GameModeManager.settings = function (self)
	return GameModeSettings[self._game_mode_key]
end
GameModeManager.object_sets = function (self)
	return self._game_mode:object_sets()
end
GameModeManager.gm_event_end_conditions_met = function (self, reason)
	self._gm_event_end_conditions_met = true

	if reason == "lost" then
		local level = LevelHelper:current_level(self._world)
		local round_lost_string = self._game_mode_key .. "_round_lost"

		Level.trigger_event(level, round_lost_string)
	end

	return 
end
GameModeManager.is_game_mode_ended = function (self)
	return self._gm_event_end_conditions_met
end
GameModeManager.setup_done = function (self)
	self._mutator_handler:setup_done()

	return 
end
GameModeManager.has_mutator = function (self, name)
	return self._mutator_handler:has_mutator(name)
end
GameModeManager._set_flow_object_set_enabled = function (self, set, enable, set_name)
	if set.flow_set_enabled == enable then
		return 
	end

	local level = LevelHelper:current_level(self._world)
	set.flow_set_enabled = enable
	local data = self._flow_set_data
	local buffer = data.ring_buffer
	local write_index = data.write_index
	local read_index = data.read_index
	local size = data.size
	local max_size = data.max_size
	local set_units = set.units
	local new_units_size = #set_units
	local new_size = size + new_units_size
	local overflow = new_size - max_size

	if 0 < overflow then
		local amount_to_remove = math.min(overflow, size)

		for i = 1, amount_to_remove, 1 do
			local unit_index = buffer[read_index]

			self._set_flow_object_set_unit_enabled(self, level, unit_index)

			read_index = read_index%max_size + 1
			size = size - 1
		end

		data.read_index = read_index
	end

	local object_set_size_overflow = new_units_size - max_size

	for i, unit_index in ipairs(set_units) do
		local unit = Level.unit_by_index(level, unit_index)
		local refs = Unit.get_data(unit, "flow_object_set_references") or 1

		if enable then
			refs = refs + 1
		else
			refs = math.max(refs - 1, 0)
		end

		Unit.set_data(unit, "flow_object_set_references", refs)

		if i <= object_set_size_overflow then
			self._set_flow_object_set_unit_enabled(self, level, unit_index)
		else
			buffer[write_index] = unit_index
			write_index = write_index%max_size + 1
			size = size + 1
		end
	end

	data.write_index = write_index
	data.size = size

	return 
end
GameModeManager.event_camera_teleported = function (self)
	self._flush_object_set_enable = 3

	return 
end
GameModeManager.update_flow_object_set_enable = function (self, dt)
	local data = self._flow_set_data
	local size = data.size
	local flush = self._flush_object_set_enable

	if 0 < size then
		local units_per_frame = (flush and math.huge) or data.units_per_frame
		local num_units = math.min(units_per_frame, size)
		local read_index = data.read_index
		local max_size = data.max_size
		local buffer = data.ring_buffer
		local level = LevelHelper:current_level(self._world)

		for i = 1, num_units, 1 do
			local unit_index = buffer[read_index]

			self._set_flow_object_set_unit_enabled(self, level, unit_index)

			read_index = read_index%max_size + 1
			size = size - 1
		end

		data.size = size
		data.read_index = read_index
	end

	if flush and flush == 1 then
		self._flush_object_set_enable = false
	elseif flush then
		self._flush_object_set_enable = flush - 1
	end

	return 
end
local Unit_get_data = Unit.get_data
local Unit_flow_event = Unit.flow_event
GameModeManager._set_flow_object_set_unit_enabled = function (self, level, index)
	local unit = Level.unit_by_index(level, index)
	local refs = Unit_get_data(unit, "flow_object_set_references")
	local enabled = Unit_get_data(unit, "flow_object_set_enabled")

	if enabled == nil then
		enabled = true
	end

	local enable = not enabled and 0 < refs
	local disable = enabled and refs == 0
	local new_state = nil

	if enable then
		new_state = true
	elseif disable then
		new_state = false
	end

	if new_state ~= nil then
		Unit.set_data(unit, "flow_object_set_enabled", new_state)
		Unit.set_unit_visibility(unit, new_state)

		local ignore_physics = Unit_get_data(unit, "physics_ignores_object_set")

		if ignore_physics then
			if new_state then
				Unit_flow_event(unit, "hide_helper_mesh")
				Unit_flow_event(unit, "unit_object_set_enabled")
			else
				Unit_flow_event(unit, "unit_object_set_disabled")
			end
		else
			local actor_list = nil

			if new_state then
				actor_list = Unit_get_data(unit, "flow_object_set_actor_list")
			else
				actor_list = {}
			end

			for i = 0, Unit.num_actors(unit) - 1, 1 do
				if new_state and actor_list[i] then
					Unit.create_actor(unit, i)
				elseif not new_state and Unit.actor(unit, i) then
					Unit.destroy_actor(unit, i)

					actor_list[i] = true
				end
			end

			if new_state then
				Unit.set_data(unit, "flow_object_set_actor_list", nil)
				Unit_flow_event(unit, "hide_helper_mesh")
				Unit_flow_event(unit, "unit_object_set_enabled")
			else
				Unit.set_data(unit, "flow_object_set_actor_list", actor_list)
				Unit_flow_event(unit, "unit_object_set_disabled")
			end
		end
	end

	return 
end
GameModeManager.flow_cb_set_flow_object_set_enabled = function (self, set_name, enabled)
	local set = self._object_sets["flow_" .. set_name]

	fassert(set, "[GameModeManager:flow_cb_set_flow_object_set_enabled()] Object set %s does not exist.", set_name)
	self._set_flow_object_set_enabled(self, set, enabled, set_name)

	return 
end
GameModeManager.register_object_sets = function (self, object_sets)
	Profiler.start("register_object_sets")

	self._object_sets = {}
	self._object_set_names = {}

	for set_name, set in pairs(object_sets) do
		self._object_sets[set_name] = set
		self._object_set_names[set.key] = set_name

		if set.type == "flow" then
			self._set_flow_object_set_enabled(self, set, false, set_name)
		end
	end

	Profiler.stop("register_object_sets")

	return 
end
GameModeManager.event_reload_application_settings = function (self)
	local shadow_lights = self._object_sets.shadow_lights

	if shadow_lights then
		Managers.state.camera:set_shadow_lights(T(Application.user_setting("light_casts_shadows"), false), 1)
	end

	return 
end
GameModeManager._init_game_mode = function (self, game_mode_key)
	fassert(GameModeSettings[game_mode_key], "[GameModeManager] Tried to set unknown game mode %q", tostring(game_mode_key))

	local settings = GameModeSettings[game_mode_key]
	local class = rawget(_G, settings.class_name)
	self._game_mode = class.new(class, settings, self._world, self.network_server, self.level_transition_handler)

	return 
end
GameModeManager.rpc_to_client_spawn_player = function (self, sender, local_player_id, profile_index, position, rotation, is_initial_spawn)
	if sender == Network.peer_id() then
		Managers.state.entity:system("round_started_system"):player_spawned()
	end

	return 
end
GameModeManager.round_started = function (self)
	self.trigger_event(self, "round_started")

	return 
end
GameModeManager.gm_event_round_started = function (self)
	self._round_started = true
	local level = LevelHelper:current_level(self._world)
	local round_started_string = self._game_mode_key .. "_round_started"

	Level.trigger_event(level, round_started_string)
	Managers.telemetry.events:round_started()

	if TelemetrySettings.collect_memory then
		local memory_tree = Profiler.memory_tree()
		local memory_resources = Profiler.memory_resources("all")

		Managers.telemetry.events:memory_statistics(memory_tree, memory_resources, "round_started")
	end

	Level.trigger_event(level, "coop_round_started")

	return 
end
GameModeManager.is_round_started = function (self)
	return self._round_started
end
GameModeManager.disable_lose_condition = function (self)
	self._game_mode:disable_lose_condition()

	return 
end
GameModeManager.complete_level = function (self)
	self._game_mode:complete_level(self._level_key)

	for unit, data in pairs(self._end_level_areas) do
		Unit.flow_event(unit, "lua_level_completed_triggered")
	end

	return 
end
GameModeManager.wanted_transition = function (self)
	return self._game_mode:wanted_transition()
end
GameModeManager.fail_level = function (self)
	self._game_mode:fail_level()

	return 
end
GameModeManager.retry_level = function (self)
	self.level_transition_handler:reload_level()

	return 
end
GameModeManager.start_specific_level = function (self, level_key, time_until_start)
	if time_until_start then
		self.specific_level_to_start = level_key
		self.specific_level_start_timer = time_until_start
	else
		self.specific_level_to_start = nil
		self.specific_level_start_timer = nil
		local level_transition_handler = self.level_transition_handler

		if level_transition_handler.transition_in_progress(level_transition_handler) then
			return 
		end

		level_transition_handler.set_next_level(level_transition_handler, level_key)
		level_transition_handler.level_completed(level_transition_handler)
	end

	return 
end
GameModeManager.update_timebased_level_start = function (self, dt)
	local time = self.specific_level_start_timer

	if time then
		time = time - dt

		if time <= 0 then
			self.start_specific_level(self, self.specific_level_to_start)
		else
			self.specific_level_start_timer = time
		end
	end

	return 
end
GameModeManager.update = function (self, dt, t)
	self._mutator_handler:update(dt, t)

	return 
end
GameModeManager.server_update = function (self, dt, t)
	if not self._end_conditions_met and not LEVEL_EDITOR_TEST then
		if not self._game_mode:level_completed() then
			local level_completed = self._update_end_level_areas(self)

			if level_completed then
				self.complete_level(self)
			end
		end

		local round_started = self._round_started
		local ended, reason = self._game_mode:evaluate_end_conditions(round_started, dt, t)

		if ended then
			local all_peers_ingame = self.network_server:are_all_peers_ingame()

			if reason ~= "start_game" and not all_peers_ingame then
				return 
			end

			self.network_server:enter_post_game()

			self._end_conditions_met = true
			self._end_reason = reason
			local checkpoint_available = (reason == "lost" and Managers.state.spawn:checkpoint_data() and true) or false
			local mission_system = Managers.state.entity:system("mission_system")
			local percentage_completed = mission_system.percentage_completed(mission_system)

			self.trigger_event(self, "end_conditions_met", reason, checkpoint_available, percentage_completed)

			self._gm_event_end_conditions_met = true

			self._save_last_level_completed(self, reason)

			self._ready_for_transition = {}
			local human_players = Managers.player:human_players()

			for _, player in pairs(human_players) do
				local peer_id = player.peer_id
				self._ready_for_transition[peer_id] = false
			end

			if reason == "start_game" then
				self.level_transition_handler:level_completed()
			elseif reason == "won" then
				local default_level_key = self.level_transition_handler:default_level_key()

				self.level_transition_handler:set_next_level(default_level_key)
			elseif reason == "lost" then
				local default_level_key = self.level_transition_handler:default_level_key()

				self.level_transition_handler:set_next_level(default_level_key)
			elseif reason == "reload" then
				self.retry_level(self)
			else
				fassert(false, "Invalid end reason %q.", tostring(reason))
			end
		end
	end

	if not LEVEL_EDITOR_TEST and self._end_conditions_met then
		local everyone_ready = true
		local human_players = Managers.player:human_players()

		for _, player in pairs(human_players) do
			local peer_id = player.peer_id

			if self._ready_for_transition[peer_id] == false then
				everyone_ready = false

				break
			end
		end

		if everyone_ready then
			self.level_transition_handler:level_completed()
		else
			self.update_timebased_level_start(self, dt)
		end
	end

	return 
end
GameModeManager._save_last_level_completed = function (self, reason)
	local level_key = self.level_key(self)
	SaveData.last_played_level = level_key
	SaveData.last_played_level_result = reason

	Managers.save:auto_save(SaveFileName, SaveData, nil)

	return 
end
GameModeManager.rpc_is_ready_for_transition = function (self, sender)
	self._ready_for_transition[sender] = true

	return 
end
GameModeManager.game_won = function (self)
	return self._end_reason == "won"
end
GameModeManager.game_lost = function (self)
	return self._end_reason == "lost"
end
GameModeManager.set_end_reason = function (self, end_reason)
	self._end_reason = end_reason

	return 
end
GameModeManager.level_key = function (self)
	return self._level_key
end
GameModeManager.trigger_event = function (self, event, ...)
	local gm_event = "gm_event_" .. event

	Managers.state.event:trigger(gm_event, ...)

	if self._lobby_host then
		Managers.state.network[gm_event](Managers.state.network, ...)
	end

	return 
end
GameModeManager.game_mode = function (self)
	return self._game_mode
end
GameModeManager.game_mode_key = function (self)
	return self._game_mode_key
end
GameModeManager.hot_join_sync = function (self, sender)
	if self._round_started then
		self._network_transmit:send_rpc("rpc_gm_event_round_started", sender)
	end

	self._game_mode:hot_join_sync(sender)

	return 
end
GameModeManager.activate_end_level_area = function (self, unit, object, from, to)
	local extents = (to - from)*0.5
	local offset = (from + to)*0.5
	self._end_level_areas[unit] = {
		object = object,
		extents = Vector3Box(extents),
		offset = Vector3Box(offset)
	}

	return 
end
GameModeManager.debug_end_level_area = function (self, unit, object, from, to)
	local extents = (to - from)*0.5
	local offset = (from + to)*0.5
	self._debug_end_level_areas[unit] = {
		object = object,
		extents = Vector3Box(extents),
		offset = Vector3Box(offset)
	}

	return 
end
GameModeManager.disable_end_level_area = function (self, unit)
	self._end_level_areas[unit] = nil

	return 
end
GameModeManager._update_end_level_areas = function (self)
	for unit, data in pairs(self._debug_end_level_areas) do
		local node = Unit.node(unit, data.object)
		local rot = Unit.world_rotation(unit, node)
		local right = Quaternion.right(rot)
		local fwd = Quaternion.forward(rot)
		local up = Quaternion.up(rot)
		local object_pos = Unit.world_position(unit, node)
		local offset = data.offset:unbox()
		local pos = object_pos + right*offset.x + fwd*offset.y + up*offset.z
		local pose = Matrix4x4.from_quaternion_position(rot, pos)
		local extents = data.extents:unbox()

		QuickDrawer:quaternion(object_pos, rot)

		local enabled = self._end_level_areas[unit]

		QuickDrawer:box(pose, extents, (enabled and Color(0, 255, 0)) or Color(255, 0, 0))
	end

	if table.is_empty(self._end_level_areas) then
		return false
	else
		local dot = Vector3.dot
		local abs = math.abs
		local num_non_disabled_players = 0

		for _, player in pairs(Managers.player:human_players()) do
			local player_unit = player.player_unit
			local non_disabled = Unit.alive(player_unit) and not ScriptUnit.extension(player_unit, "status_system"):is_disabled()

			if non_disabled then
				num_non_disabled_players = num_non_disabled_players + 1
				local pos = POSITION_LOOKUP[player_unit]
				local in_end_area = false

				for unit, data in pairs(self._end_level_areas) do
					local node = Unit.node(unit, data.object)
					local object_pos = Unit.world_position(unit, node)
					local object_rot = Unit.world_rotation(unit, node)
					local right = Quaternion.right(object_rot)
					local forward = Quaternion.forward(object_rot)
					local up = Quaternion.up(object_rot)
					local offset = data.offset:unbox()
					local center_pos = object_pos + right*offset.x + forward*offset.y + up*offset.z
					local extents = data.extents:unbox()
					local player_offset = pos - center_pos

					if abs(dot(player_offset, right)) < abs(extents.x) and abs(dot(player_offset, forward)) < abs(extents.y) and abs(dot(player_offset, up)) < abs(extents.z) then
						in_end_area = true

						break
					end
				end

				if not in_end_area then
					return false
				end
			end
		end

		return 0 < num_non_disabled_players
	end

	return false
end

return 
