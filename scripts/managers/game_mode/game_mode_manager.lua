require("scripts/settings/game_mode_settings")
require("scripts/managers/game_mode/game_mode_helper")
require("scripts/managers/game_mode/game_modes/game_mode_adventure")
require("scripts/managers/game_mode/game_modes/game_mode_survival")
require("scripts/managers/game_mode/game_modes/game_mode_tutorial")
require("scripts/managers/game_mode/game_modes/game_mode_inn")
require("scripts/managers/game_mode/game_modes/game_mode_demo")
require("scripts/managers/game_mode/game_modes/game_mode_weave")
require("scripts/managers/game_mode/mutator_handler")
require("scripts/managers/game_mode/horde_surge_handler")
DLCUtils.require_list("game_mode_files")

local RPCS = {
	"rpc_to_client_spawn_player",
	"rpc_is_ready_for_transition",
	"rpc_apply_environment_variation",
	"rpc_change_game_mode_state",
	"rpc_trigger_round_over",
	"rpc_trigger_level_event"
}
local GAME_MODE_STATE_NETWORK_IDS = {}

for game_mode_key, settings in pairs(GameModeSettings) do
	local network_id_lookup = {}

	for i, state_name in ipairs(settings.game_mode_states) do
		network_id_lookup[i] = state_name
		network_id_lookup[state_name] = i
	end

	GAME_MODE_STATE_NETWORK_IDS[game_mode_key] = network_id_lookup
end

GameModeManager = class(GameModeManager)

GameModeManager.init = function (self, world, lobby_host, lobby_client, network_event_delegate, statistics_db, game_mode_key, network_server, network_transmit, profile_synchronizer, game_mode_settings)
	local level_key = Managers.level_transition_handler:get_current_level_keys()
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
	self._profile_synchronizer = profile_synchronizer
	self._have_signalled_ready_to_transition = false

	self:_init_game_mode(game_mode_key, game_mode_settings)

	local event_manager = Managers.state.event

	event_manager:register(self, "reload_application_settings", "event_reload_application_settings")
	event_manager:register(self, "gm_event_round_started", "gm_event_round_started")
	event_manager:register(self, "camera_teleported", "event_camera_teleported")

	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
	self._game_mode:register_rpcs(network_event_delegate, network_transmit)

	self._object_sets = nil
	self._object_set_names = nil
	local max_size = 8192
	self._flow_set_data = {
		units_per_frame = 150,
		write_index = 1,
		read_index = 1,
		size = 0,
		ring_buffer = Script.new_array(max_size),
		max_size = max_size
	}
	local mutators = self._game_mode:mutators()
	local level_settings = LevelSettings[self._level_key]
	local level_mutators = level_settings.mutators

	if level_mutators then
		mutators = mutators or {}

		for i = 1, #level_mutators do
			mutators[#mutators + 1] = level_mutators[i]
		end
	end

	local has_local_client = not DEDICATED_SERVER
	self._mutator_handler = MutatorHandler:new(mutators, self.is_server, has_local_client, world, network_event_delegate, network_transmit)
	self._looping_event_timers = {}
	self._disable_spawning_reasons = {}

	if self.is_server then
		self._initial_peers_ready = false
	end

	self._has_created_game_mode_data = false
end

GameModeManager.destroy = function (self)
	self._mutator_handler:destroy()

	self._lobby_host = nil
	self._lobby_client = nil

	self._game_mode:unregister_rpcs()
	self._game_mode:destroy()
	Managers.party:cleanup_game_mode_data()
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
end

GameModeManager.cleanup_game_mode_units = function (self)
	self._game_mode:cleanup_game_mode_units()
end

GameModeManager.deactivate_mutators = function (self, is_destroy)
	self._mutator_handler:deactivate_mutators(is_destroy)
end

GameModeManager.conflict_director_updated_settings = function (self)
	self._mutator_handler:conflict_director_updated_settings()
end

GameModeManager.settings = function (self)
	return GameModeSettings[self._game_mode_key]
end

GameModeManager.setting = function (self, setting_name)
	return GameModeSettings[self._game_mode_key][setting_name]
end

GameModeManager.gm_event_end_conditions_met = function (self, reason, checkpoint_available, percentages_completed)
	self._gm_event_end_conditions_met = true

	if reason == "lost" then
		local level = LevelHelper:current_level(self._world)
		local round_lost_string = self._game_mode_key .. "_round_lost"

		Level.trigger_event(level, round_lost_string)
	end

	self._game_mode:gm_event_end_conditions_met(reason, checkpoint_available, percentages_completed)
	self:_save_last_level_completed(reason)
end

GameModeManager.is_game_mode_ended = function (self)
	return self._gm_event_end_conditions_met
end

GameModeManager.setup_done = function (self)
	self._game_mode:setup_done()
	self._mutator_handler:activate_mutators()
end

GameModeManager.deactivate_mutator = function (self, mutator_name)
	self._mutator_handler:deactivate_mutator(mutator_name)
end

GameModeManager.player_entered_game_session = function (self, peer_id, local_player_id, wanted_party_index)
	self._game_mode:player_entered_game_session(peer_id, local_player_id, wanted_party_index)
end

GameModeManager.remove_bot = function (self, peer_id, local_player_id, update_safe)
	return self._game_mode:remove_bot(peer_id, local_player_id, update_safe)
end

GameModeManager.player_left_game_session = function (self, peer_id, local_player_id)
	self._game_mode:player_left_game_session(peer_id, local_player_id)
end

GameModeManager.player_joined_party = function (self, peer_id, local_player_id, new_party_id, slot_id)
	self._game_mode:player_joined_party(peer_id, local_player_id, new_party_id, slot_id)
end

GameModeManager.player_left_party = function (self, peer_id, local_player_id, party_id, slot_id)
	self._game_mode:player_left_party(peer_id, local_player_id, party_id, slot_id)
end

GameModeManager.ai_killed = function (self, killed_unit, killer_unit, death_data, killing_blow)
	self._mutator_handler:ai_killed(killed_unit, killer_unit, death_data, killing_blow)

	local game_mode = self._game_mode

	if game_mode.ai_killed then
		game_mode:ai_killed(killed_unit, killer_unit, death_data, killing_blow)
	end
end

GameModeManager.level_object_killed = function (self, killed_unit, killing_blow)
	self._mutator_handler:level_object_killed(killed_unit, killing_blow)
end

GameModeManager.ai_hit_by_player = function (self, hit_unit, attacking_unit, attack_data)
	self._mutator_handler:ai_hit_by_player(hit_unit, attacking_unit, attack_data)
end

GameModeManager.player_hit = function (self, hit_unit, attacking_unit, attack_data)
	self._mutator_handler:player_hit(hit_unit, attacking_unit, attack_data)
end

GameModeManager.modify_player_base_damage = function (self, damaged_unit, attacker_unit, damage, damage_type)
	return self._mutator_handler:modify_player_base_damage(damaged_unit, attacker_unit, damage, damage_type)
end

GameModeManager.player_respawned = function (self, spawned_unit)
	self._mutator_handler:player_respawned(spawned_unit)
end

GameModeManager.damage_taken = function (self, attacked_unit, attacker_unit, damage, damage_source, damage_type)
	self._mutator_handler:damage_taken(attacked_unit, attacker_unit, damage, damage_source, damage_type)
end

GameModeManager.ai_spawned = function (self, spawned_unit)
	self._mutator_handler:ai_spawned(spawned_unit)
end

GameModeManager.set_override_respawn_group = function (self, respawn_group_name, active)
	if self._game_mode.set_override_respawn_group then
		self._game_mode:set_override_respawn_group(respawn_group_name, active)
	end
end

GameModeManager.set_respawn_group_enabled = function (self, respawn_group_name, enabled)
	if self._game_mode.set_respawn_group_enabled then
		self._game_mode:set_respawn_group_enabled(respawn_group_name, enabled)
	end
end

GameModeManager.set_respawn_gate_enabled = function (self, respawn_gate_unit, enabled)
	if self._game_mode.set_respawn_gate_enabled then
		self._game_mode:set_respawn_gate_enabled(respawn_gate_unit, enabled)
	end
end

GameModeManager.players_left_safe_zone = function (self)
	self._mutator_handler:players_left_safe_zone()

	if self._game_mode.players_left_safe_zone then
		self._game_mode:players_left_safe_zone()
	end
end

GameModeManager.has_activated_mutator = function (self, name)
	return self._mutator_handler:has_activated_mutator(name)
end

GameModeManager.activated_mutators = function (self)
	return self._mutator_handler:activated_mutators()
end

GameModeManager.has_mutator = function (self, mutator_name)
	return self._mutator_handler:has_mutator(mutator_name)
end

GameModeManager.mutators = function (self)
	return self._mutator_handler:mutators()
end

GameModeManager.evaluate_end_zone_activation_conditions = function (self)
	return self._mutator_handler:evaluate_end_zone_activation_conditions()
end

GameModeManager.post_process_terror_event = function (self, elements)
	self._mutator_handler:post_process_terror_event(elements)
end

GameModeManager.bots_disabled = function (self)
	local settings = self:settings()
	local bots_disabled = settings.bots_disabled

	return bots_disabled
end

GameModeManager.get_saved_game_mode_data = function (self)
	if self._game_mode.get_saved_game_mode_data then
		return self._game_mode:get_saved_game_mode_data()
	end
end

GameModeManager.set_object_set_enabled = function (self, set_name, enable)
	local set = self._object_sets[set_name]

	if not set then
		return
	end

	self:_set_flow_object_set_enabled(set, enable, set_name)
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

	if overflow > 0 then
		local amount_to_remove = math.min(overflow, size)

		for i = 1, amount_to_remove do
			local unit_index = buffer[read_index]

			self:_set_flow_object_set_unit_enabled(level, unit_index)

			read_index = read_index % max_size + 1
			size = size - 1
		end

		data.read_index = read_index
	end

	local object_set_size_overflow = new_units_size - max_size

	for i, unit_index in ipairs(set_units) do
		local unit = Level.unit_by_index(level, unit_index)

		if unit then
			local refs = Unit.get_data(unit, "flow_object_set_references") or 1

			if enable then
				refs = refs + 1
			else
				refs = math.max(refs - 1, 0)
			end

			Unit.set_data(unit, "flow_object_set_references", refs)

			if i <= object_set_size_overflow then
				self:_set_flow_object_set_unit_enabled(level, unit_index)
			else
				buffer[write_index] = unit_index
				write_index = write_index % max_size + 1
				size = size + 1
			end
		end
	end

	data.write_index = write_index
	data.size = size
end

GameModeManager.event_camera_teleported = function (self)
	self._flush_object_set_enable = 3
end

GameModeManager.post_update = function (self, dt, t)
	if self._game_mode.post_update then
		self._game_mode:post_update(dt, t)
	end
end

GameModeManager.update_flow_object_set_enable = function (self, dt)
	local data = self._flow_set_data
	local size = data.size
	local flush = self._flush_object_set_enable

	if size > 0 then
		local units_per_frame = flush and math.huge or data.units_per_frame
		local num_units = math.min(units_per_frame, size)
		local read_index = data.read_index
		local max_size = data.max_size
		local buffer = data.ring_buffer
		local level = LevelHelper:current_level(self._world)

		for i = 1, num_units do
			local unit_index = buffer[read_index]

			self:_set_flow_object_set_unit_enabled(level, unit_index)

			read_index = read_index % max_size + 1
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

	local enable = not enabled and refs > 0
	local disable = enabled and refs == 0
	local new_state = nil

	if enable then
		new_state = true
	elseif disable then
		new_state = false
	end

	if new_state ~= nil then
		Unit.set_data(unit, "flow_object_set_enabled", new_state)

		if Unit.has_data(unit, "LevelEditor", "is_gizmo_unit") then
			local is_gizmo = Unit.get_data(unit, "LevelEditor", "is_gizmo_unit")
			local is_reflection_probe = Unit.is_a(unit, "core/stingray_renderer/helper_units/reflection_probe/reflection_probe")

			if is_gizmo and not is_reflection_probe then
				Unit.set_unit_visibility(unit, false)
			else
				Unit.set_unit_visibility(unit, new_state)
			end
		else
			Unit.set_unit_visibility(unit, new_state)
		end

		if self._game_mode_key == "versus" and Unit.is_a(unit, "core/volumetrics/units/fog_volume") then
			if new_state then
				local albedo_r = Unit.get_data(unit, "FogProperties", "albedo", 0)
				local albedo_g = Unit.get_data(unit, "FogProperties", "albedo", 1)
				local albedo_b = Unit.get_data(unit, "FogProperties", "albedo", 2)
				local falloff_1 = Unit.get_data(unit, "FogProperties", "falloff", 0)
				local falloff_2 = Unit.get_data(unit, "FogProperties", "falloff", 1)
				local falloff_3 = Unit.get_data(unit, "FogProperties", "falloff", 2)
				local extinction = Unit.get_data(unit, "FogProperties", "extinction")
				local phase = Unit.get_data(unit, "FogProperties", "phase")

				Volumetrics.register_volume(unit, Vector3(albedo_r, albedo_g, albedo_g), extinction, phase, Vector3(falloff_1, falloff_2, falloff_3))
			else
				Volumetrics.unregister_volume(unit)
			end
		end

		if Unit.has_visibility_group(unit, "gizmo") then
			Unit.set_visibility(unit, "gizmo", false)
		end

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

			for i = 0, Unit.num_actors(unit) - 1 do
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
end

GameModeManager.get_end_screen_config = function (self, game_won, game_lost, player)
	local screen_name, screen_config, screen_params = self._game_mode:get_end_screen_config(game_won, game_lost, player)

	fassert(screen_name ~= nil, "No screen name returned")
	fassert(screen_config ~= nil, "No screen config returned")

	return screen_name, screen_config, screen_params
end

GameModeManager.get_player_wounds = function (self, profile)
	return self._game_mode:get_player_wounds(profile)
end

GameModeManager.get_initial_inventory = function (self, healthkit, potion, grenade, additional_items, profile)
	return self._game_mode:get_initial_inventory(healthkit, potion, grenade, additional_items, profile)
end

GameModeManager.flow_cb_set_flow_object_set_enabled = function (self, set_name, enabled)
	local set = self._object_sets["flow_" .. set_name]

	fassert(set, "[GameModeManager:flow_cb_set_flow_object_set_enabled()] Object set %s does not exist.", set_name)
	self:_set_flow_object_set_enabled(set, enabled, set_name)
end

GameModeManager.register_object_sets = function (self, object_sets)
	self._object_sets = {}
	self._object_set_names = {}

	for set_name, set in pairs(object_sets) do
		self._object_sets[set_name] = set
		self._object_set_names[set.key] = set_name

		if set.type == "flow" then
			self:_set_flow_object_set_enabled(set, false, set_name)
		end
	end
end

GameModeManager.event_reload_application_settings = function (self)
	local shadow_lights = self._object_sets.shadow_lights

	if shadow_lights then
		Managers.state.camera:set_shadow_lights(T(Application.user_setting("light_casts_shadows"), false), 1)
	end
end

GameModeManager._init_game_mode = function (self, game_mode_key, game_mode_settings)
	fassert(GameModeSettings[game_mode_key], "[GameModeManager] Tried to set unknown game mode %q", tostring(game_mode_key))

	local settings = GameModeSettings[game_mode_key]
	local class = rawget(_G, settings.class_name)
	self._game_mode = class:new(settings, self._world, self.network_server, self.is_server, self._profile_synchronizer, self._level_key, self.statistics_db, game_mode_settings)
end

GameModeManager.rpc_to_client_spawn_player = function (self, channel_id, local_player_id, profile_index, career_index, position, rotation, is_initial_spawn)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if peer_id == Network.peer_id() then
		Managers.state.entity:system("round_started_system"):player_spawned()
	end
end

GameModeManager.round_started = function (self)
	self:trigger_event("round_started")
end

GameModeManager.gm_event_round_started = function (self)
	self._round_started = true
	local level = LevelHelper:current_level(self._world)
	local round_started_string = self._game_mode_key .. "_round_started"

	Level.trigger_event(level, round_started_string)
	Managers.telemetry_events:round_started()

	if TelemetrySettings.collect_memory then
		local memory_tree = Profiler.memory_tree()
		local memory_resources = Profiler.memory_resources("all")

		Managers.telemetry_events:memory_statistics(memory_tree, memory_resources, "round_started")
	end

	Level.trigger_event(level, "coop_round_started")
end

GameModeManager.is_round_started = function (self)
	return self._round_started
end

GameModeManager.disable_lose_condition = function (self)
	self._game_mode:disable_lose_condition()
end

GameModeManager.complete_level = function (self)
	print("Complete level triggered. Stacktrace: " .. Script.callstack())
	self._game_mode:complete_level(self._level_key)
	self._game_mode:trigger_end_level_area_events()
end

GameModeManager.wanted_transition = function (self)
	return self._game_mode:wanted_transition()
end

GameModeManager.fail_level = function (self)
	self._game_mode:fail_level()
end

GameModeManager.retry_level = function (self)
	local level_seed = Managers.mechanism:generate_level_seed()

	Managers.level_transition_handler:reload_level(nil, level_seed)
	Managers.level_transition_handler:promote_next_level_data()
end

GameModeManager.disable_player_spawning = function (self, disable, reason, safe_position, safe_rotation)
	local reasons = self._disable_spawning_reasons

	if disable then
		fassert(not reasons[reason], "Reason already disables player spawning")

		if table.is_empty(reasons) then
			self._game_mode:disable_player_spawning()
		end

		reasons[reason] = true
	else
		fassert(reasons[reason], "Trying to enable spawning without disabling spawning first with reason")

		reasons[reason] = nil

		if table.is_empty(reasons) then
			self._game_mode:enable_player_spawning(safe_position, safe_rotation)
		end
	end
end

GameModeManager.start_specific_level = function (self, level_key, time_until_start)
	if time_until_start then
		self.specific_level_to_start = level_key
		self.specific_level_start_timer = time_until_start
	else
		self.specific_level_to_start = nil
		self.specific_level_start_timer = nil
		local level_transition_handler = Managers.level_transition_handler
		local environment_variation_id = LevelHelper:get_environment_variation_id(level_key)

		level_transition_handler:set_next_level(level_key, environment_variation_id)
		level_transition_handler:promote_next_level_data()
	end
end

GameModeManager.update_timebased_level_start = function (self, dt)
	local time = self.specific_level_start_timer

	if time then
		time = time - dt

		if time <= 0 then
			self:start_specific_level(self.specific_level_to_start)
		else
			self.specific_level_start_timer = time
		end
	end
end

GameModeManager.pre_update = function (self, t, dt)
	self._mutator_handler:pre_update(dt, t)
	self._game_mode:pre_update(t, dt)
end

GameModeManager.register_looping_event_timer = function (self, timer_name, delay, event_name)
	local os_t = os.clock()
	self._looping_event_timers[timer_name] = {
		delay = delay,
		next_trigger_time = os_t + delay,
		event_name = event_name
	}
end

GameModeManager.unregister_looping_event_timer = function (self, timer_name)
	self._looping_event_timers[timer_name] = nil
end

GameModeManager.local_player_ready_to_start = function (self, player)
	if not Managers.state.network:in_game_session() then
		return false
	end

	return self._game_mode:local_player_ready_to_start(player)
end

GameModeManager.local_player_game_starts = function (self, player, loading_context)
	self._game_mode:local_player_game_starts(player, loading_context)
end

GameModeManager.update = function (self, dt, t)
	self._mutator_handler:update(dt, t)

	if self._game_mode.update then
		self._game_mode:update(t, dt)
	end

	local os_t = os.clock()
	local level = LevelHelper:current_level(self._world)

	for name, timer in pairs(self._looping_event_timers) do
		if timer.next_trigger_time < os_t then
			Level.trigger_event(level, timer.event_name)

			timer.next_trigger_time = timer.next_trigger_time + timer.delay
		end
	end
end

GameModeManager._update_initial_join = function (self, t, dt)
	if self.network_server:are_all_peers_ingame() then
		self._initial_peers_ready = true

		self._game_mode:all_peers_ready()
	end
end

GameModeManager.evaluate_end_condition_outcome = function (self, reason, player)
	if self._game_mode.evaluate_end_condition_outcome then
		return self._game_mode:evaluate_end_condition_outcome(reason, player)
	end

	local game_won = reason and reason == "won"
	local game_lost = reason and reason == "lost"

	return game_won, game_lost
end

GameModeManager.server_update = function (self, dt, t)
	if not self._initial_peers_ready then
		self:_update_initial_join(t, dt)
	end

	local game_mode = self._game_mode

	game_mode:server_update(t, dt)

	if not self._have_signalled_game_mode_about_end_conditions then
		if not self._end_conditions_met and not LEVEL_EDITOR_TEST then
			local mutator_handler = self._mutator_handler
			local round_started = self._round_started
			local ended, reason, reason_data = self._game_mode:evaluate_end_conditions(round_started, dt, t, mutator_handler)

			if ended then
				game_mode:ended(reason)
				Managers.mechanism:game_round_ended(t, dt, reason, reason_data)

				if reason ~= "reload" then
					Managers.mechanism:progress_state()
				end

				self.network_server:enter_post_game()

				self._end_conditions_met = true
				self._end_reason = reason
				local checkpoint_available = reason == "lost" and Managers.state.spawn:checkpoint_data() and true or false
				local mission_system = Managers.state.entity:system("mission_system")
				local percentages_completed = mission_system:percentages_completed()

				self:trigger_event("end_conditions_met", reason, checkpoint_available, percentages_completed)

				self._gm_event_end_conditions_met = true

				self:_save_last_level_completed(reason)

				self._ready_for_transition = {}
				local human_players = Managers.player:human_players()

				for _, player in pairs(human_players) do
					local peer_id = player.peer_id
					self._ready_for_transition[peer_id] = false
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

			if everyone_ready and not self._have_signalled_ready_to_transition then
				game_mode:ready_to_transition()

				self._have_signalled_ready_to_transition = true
			else
				self:update_timebased_level_start(dt)
			end
		end
	end
end

GameModeManager._save_last_level_completed = function (self, reason)
	local level_key = self:level_key()
	SaveData.last_played_level = level_key
	SaveData.last_played_level_result = reason

	Managers.save:auto_save(SaveFileName, SaveData, nil)
end

GameModeManager.rpc_is_ready_for_transition = function (self, channel_id)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]
	self._ready_for_transition[peer_id] = true
end

GameModeManager.game_won = function (self, player)
	local game_won, _ = self:evaluate_end_condition_outcome(self._end_reason, player)

	return game_won
end

GameModeManager.game_lost = function (self, player)
	local _, game_lost = self:evaluate_end_condition_outcome(self._end_reason, player)

	return game_lost
end

GameModeManager.set_end_reason = function (self, end_reason)
	self._end_reason = end_reason
end

GameModeManager.get_end_reason = function (self)
	return self._end_reason
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
end

GameModeManager.game_mode = function (self)
	return self._game_mode
end

GameModeManager.game_mode_key = function (self)
	return self._game_mode_key
end

GameModeManager.hot_join_sync = function (self, peer_id)
	self._mutator_handler:hot_join_sync(peer_id)

	local game_mode_state = self._game_mode:game_mode_state()

	if game_mode_state ~= "initial_state" then
		local network_lookup = GAME_MODE_STATE_NETWORK_IDS[self._game_mode_key]
		local game_mode_state_id = network_lookup[game_mode_state]

		self._network_transmit:send_rpc("rpc_change_game_mode_state", peer_id, game_mode_state_id)
	end

	if self._round_started then
		self._network_transmit:send_rpc("rpc_gm_event_round_started", peer_id)
	end

	self._game_mode:hot_join_sync(peer_id)

	local environment_variation_name = self:get_environment_variation_name()

	if environment_variation_name then
		self._network_transmit:send_rpc("rpc_apply_environment_variation", peer_id)
	end
end

GameModeManager.activate_end_level_area = function (self, unit, object, from, to)
	local game_mode = self._game_mode

	game_mode:activate_end_level_area(unit, object, from, to)
end

GameModeManager.debug_end_level_area = function (self, unit, object, from, to)
	local game_mode = self._game_mode

	game_mode:debug_end_level_area(unit, object, from, to)
end

GameModeManager.disable_end_level_area = function (self, unit)
	local game_mode = self._game_mode

	game_mode:disable_end_level_area(unit)
end

GameModeManager.teleport_despawned_players = function (self, position)
	self._game_mode:teleport_despawned_players(position)
end

GameModeManager.flow_callback_add_spawn_point = function (self, unit)
	self._game_mode:flow_callback_add_spawn_point(unit)
end

GameModeManager.flow_callback_add_game_mode_specific_spawn_point = function (self, unit)
	local i = 0
	local sides = {}

	while Unit.has_data(unit, "sides", i) do
		local side = Unit.get_data(unit, "sides", i)

		if #side > 0 then
			sides[#sides + 1] = side
		end

		i = i + 1
	end

	i = 0

	while Unit.has_data(unit, "game_modes", i) do
		local game_mode = Unit.get_data(unit, "game_modes", i)

		if game_mode == self._game_mode_key then
			if self._game_mode.flow_callback_add_game_mode_specific_spawn_point then
				self._game_mode:flow_callback_add_game_mode_specific_spawn_point(unit, sides)
			end

			break
		end

		i = i + 1
	end
end

GameModeManager.remove_respawn_units_due_to_crossroads = function (self, removed_path_distances, total_main_path_length)
	if self._game_mode.remove_respawn_units_due_to_crossroads then
		self._game_mode:remove_respawn_units_due_to_crossroads(removed_path_distances, total_main_path_length)
	end
end

GameModeManager.recalc_respawner_dist_due_to_crossroads = function (self)
	if self._game_mode.recalc_respawner_dist_due_to_crossroads then
		self._game_mode:recalc_respawner_dist_due_to_crossroads()
	end
end

GameModeManager.respawn_unit_spawned = function (self, unit)
	self._game_mode:respawn_unit_spawned(unit)
end

GameModeManager.respawn_gate_unit_spawned = function (self, unit)
	self._game_mode:respawn_gate_unit_spawned(unit)
end

GameModeManager.profile_changed = function (self, peer_id, local_player_id, profile_index, career_index)
	self._game_mode:profile_changed(peer_id, local_player_id, profile_index, career_index)
end

GameModeManager.force_respawn = function (self, peer_id, local_player_id)
	self._game_mode:force_respawn(peer_id, local_player_id)
end

GameModeManager.force_respawn_dead_players = function (self)
	self._game_mode:force_respawn_dead_players()
end

GameModeManager.set_respawning_enabled = function (self, enabled)
	if self._game_mode.set_respawning_enabled then
		self._game_mode:set_respawning_enabled(enabled)
	end
end

GameModeManager.on_game_mode_data_created = function (self, game_session, game_object_id)
	fassert(self._has_created_game_mode_data == false, "There has already been a game mode data go created.")

	self._has_created_game_mode_data = true

	self._game_mode:on_game_mode_data_created(game_session, game_object_id)
end

GameModeManager.on_game_mode_data_destroyed = function (self)
	self._has_created_game_mode_data = false

	self._game_mode:on_game_mode_data_destroyed()
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
		local pos = object_pos + right * offset.x + fwd * offset.y + up * offset.z
		local pose = Matrix4x4.from_quaternion_position(rot, pos)
		local extents = data.extents:unbox()

		QuickDrawer:quaternion(object_pos, rot)

		local enabled = self._end_level_areas[unit]

		QuickDrawer:box(pose, extents, enabled and Color(0, 255, 0) or Color(255, 0, 0))
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
					local center_pos = object_pos + right * offset.x + forward * offset.y + up * offset.z
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

		return num_non_disabled_players > 0
	end
end

GameModeManager.on_round_end = function (self)
	local game_mode = self._game_mode

	if game_mode and game_mode.on_round_end then
		game_mode:on_round_end()
	end
end

GameModeManager.change_game_mode_state = function (self, state_name)
	fassert(self.is_server, "Should only be called on the server.")

	local game_mode_states = self:setting("game_mode_states")

	fassert(table.contains(game_mode_states, state_name), "state_name (%s) does not exist in GameModeSettings", state_name)

	local network_lookup = GAME_MODE_STATE_NETWORK_IDS[self._game_mode_key]
	local state_name_id = network_lookup[state_name]

	self._network_transmit:send_rpc_clients("rpc_change_game_mode_state", state_name_id)
end

GameModeManager.get_boss_loot_pickup = function (self)
	if self._game_mode.get_boss_loot_pickup then
		return self._game_mode:get_boss_loot_pickup()
	end

	return "loot_die"
end

GameModeManager.get_environment_variation_name = function (self)
	local level_transition_handler = Managers.level_transition_handler
	local environment_variation_name = level_transition_handler:get_current_environment_variation_name()

	if environment_variation_name then
		local active_mutators = self:mutators()

		local function has_disabled_environment_variations(name, data)
			return data.template.disable_environment_variations
		end

		if not active_mutators or not table.find_func(active_mutators, has_disabled_environment_variations) then
			return environment_variation_name
		end
	end

	return nil
end

GameModeManager.apply_environment_variation = function (self)
	local environment_variation_name = self:get_environment_variation_name()

	if environment_variation_name then
		LevelHelper:flow_event(self._world, environment_variation_name)

		if self.is_server then
			self._network_transmit:send_rpc_clients("rpc_apply_environment_variation")
		end
	end
end

GameModeManager.rpc_apply_environment_variation = function (self)
	self:apply_environment_variation()
end

GameModeManager.rpc_change_game_mode_state = function (self, channel_id, state_name_id)
	fassert(not self.is_server, "Should only appear on the clients.")

	local network_lookup = GAME_MODE_STATE_NETWORK_IDS[self._game_mode_key]
	local state_name = network_lookup[state_name_id]

	self._game_mode:change_game_mode_state(state_name)
end

GameModeManager.rpc_trigger_round_over = function (self, channel_id)
	self._game_mode.trigger_round_over = true
end

GameModeManager.rpc_trigger_level_event = function (self, channel_id, event)
	local level = LevelHelper:current_level(self._world)

	if level then
		Level.trigger_event(level, event)
	end
end
