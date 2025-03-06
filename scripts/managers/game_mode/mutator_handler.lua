-- chunkname: @scripts/managers/game_mode/mutator_handler.lua

require("scripts/managers/game_mode/mutator_common_settings")
require("scripts/managers/game_mode/mutator_templates")

function mutator_dprint(text, ...)
	if script_data.debug_mutators then
		local s = string.format(text, ...)

		printf("[Mutator] %s", s)
	end
end

function mutator_print(text, ...)
	local s = string.format(text, ...)

	printf("[Mutator] %s", s)
end

MutatorHandler = class(MutatorHandler)

local RPCS = {
	"rpc_activate_mutator_client",
	"rpc_deactivate_mutator_client",
}

MutatorHandler.init = function (self, mutators, is_server, network_handler, has_local_client, world, network_event_delegate, network_transmit)
	self._is_server = is_server
	self._network_handler = network_handler
	self._has_local_client = has_local_client
	self._network_transmit = network_transmit
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	local mutator_context = {
		world = world,
	}

	mutator_context.is_server = is_server
	self._mutator_context = mutator_context
	self._active_mutators = {}
	self._mutators = {}

	if is_server and mutators then
		self._initialized_mutator_map = {}

		self:initialize_mutators(mutators)
	else
		local network_state = network_handler:get_network_state()

		self._initialized_mutator_map = network_state:get_initialized_mutator_map()

		network_state:register_callback("client_data_updated", self, "on_client_mutator_list_updated", "initialized_mutator_map")
	end

	Managers.state.event:register(self, "on_player_disabled", "player_disabled")
end

MutatorHandler.destroy = function (self)
	Managers.state.event:unregister(self)

	if not self._is_server then
		local network_state = self._network_handler:get_network_state()

		network_state:unregister_callback(self, "client_data_updated")
	end

	local active_mutators = self._active_mutators
	local mutator_context = self._mutator_context

	mutator_context.is_destroy = true

	for name, _ in pairs(active_mutators) do
		self:_deactivate_mutator(name, active_mutators, mutator_context, true)
	end

	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
	self._mutators = nil
	self._active_mutators = nil
end

MutatorHandler.initialize_mutators = function (self, mutators)
	local active_mutators = self._active_mutators
	local mutator_context = self._mutator_context

	for i = 1, #mutators do
		local name = mutators[i]

		self:_server_initialize_mutator(name, active_mutators, mutator_context)
	end

	if self._is_server then
		local network_state = self._network_handler:get_network_state()

		network_state:set_initialized_mutator_map(table.shallow_copy(self._initialized_mutator_map))
	end
end

MutatorHandler.activate_mutators = function (self)
	if self._is_server then
		local mutator_context = self._mutator_context
		local active_mutators = self._active_mutators
		local mutators = self._mutators

		for name, data in pairs(mutators) do
			self:_activate_mutator(name, active_mutators, mutator_context, data)
		end
	end
end

MutatorHandler.deactivate_mutators = function (self, is_destroy)
	local active_mutators = self._active_mutators
	local mutator_context = self._mutator_context

	mutator_context.is_destroy = is_destroy

	for name, _ in pairs(active_mutators) do
		self:_deactivate_mutator(name, active_mutators, mutator_context, true)
	end
end

MutatorHandler.activate_mutator = function (self, name, optional_duration, optional_flag)
	if self._is_server then
		local mutator_context = self._mutator_context
		local active_mutators = self._active_mutators
		local data = self._mutators[name]

		if optional_flag then
			data[optional_flag] = true
		end

		self:_activate_mutator(name, active_mutators, mutator_context, data, optional_duration)
	end
end

MutatorHandler.deactivate_mutator = function (self, name)
	if self._is_server then
		local active_mutators = self._active_mutators
		local mutator_context = self._mutator_context

		self:_deactivate_mutator(name, active_mutators, mutator_context)
	end
end

MutatorHandler.hot_join_sync = function (self, peer_id)
	local network_transmit = self._network_transmit
	local active_mutators = self._active_mutators
	local mutator_context = self._mutator_context
	local is_server = self._is_server

	for mutator_name, mutator_settings in pairs(active_mutators) do
		local mutator_id = NetworkLookup.mutator_templates[mutator_name]
		local activated_by_twitch = not not mutator_settings.activated_by_twitch

		network_transmit:send_rpc("rpc_activate_mutator_client", peer_id, mutator_id, activated_by_twitch)
	end

	for name, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server then
			template.server.hot_join_sync_function(mutator_context, mutator_data, peer_id)
		else
			template.client.hot_join_sync_function(mutator_context, mutator_data, peer_id)
		end
	end
end

MutatorHandler.pre_update = function (self, dt, t)
	local active_mutators = self._active_mutators
	local mutator_context = self._mutator_context
	local is_server = self._is_server

	for name, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server and template.server.pre_update then
			template.server.pre_update(mutator_context, mutator_data, dt, t)
		end

		if self._has_local_client and template.client.pre_update then
			template.client.pre_update(mutator_context, mutator_data, dt, t)
		end
	end
end

local first_update = true

MutatorHandler.update = function (self, dt, t)
	local active_mutators = self._active_mutators
	local mutator_context = self._mutator_context
	local is_server = self._is_server

	for name, mutator_data in pairs(active_mutators) do
		if first_update then
			print("FIRST UPDATE @" .. t)

			first_update = false
		end

		local template = mutator_data.template

		if is_server and template.server.update then
			template.server.update(mutator_context, mutator_data, dt, t)
		end

		if self._has_local_client and template.client.update then
			template.client.update(mutator_context, mutator_data, dt, t)
		end

		if mutator_data.deactivate_at_t and t > mutator_data.deactivate_at_t then
			self:_deactivate_mutator(name, active_mutators, mutator_context)
		end
	end
end

MutatorHandler.has_activated_mutator = function (self, name)
	return self._active_mutators[name] ~= nil
end

MutatorHandler.has_mutator = function (self, name)
	return self._mutators[name] ~= nil
end

MutatorHandler.activated_mutators = function (self)
	return self._active_mutators
end

MutatorHandler.mutators = function (self)
	return self._mutators
end

MutatorHandler.initialized_mutator_map = function (self)
	return self._initialized_mutator_map
end

MutatorHandler.player_disabled = function (self, disabling_event, target_unit, attacker_unit)
	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local is_server = self._is_server

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server then
			template.server.player_disabled_function(mutator_context, mutator_data, disabling_event, target_unit, attacker_unit)
		end
	end
end

MutatorHandler.ai_killed = function (self, killed_unit, killer_unit, death_data, killing_blow)
	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local is_server = self._is_server
	local has_local_client = self._has_local_client

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server then
			template.server.ai_killed_function(mutator_context, mutator_data, killed_unit, killer_unit, death_data, killing_blow)
		end

		if has_local_client then
			template.client.ai_killed_function(mutator_context, mutator_data, killed_unit, killer_unit, death_data, killing_blow)
		end
	end
end

MutatorHandler.level_object_killed = function (self, killed_unit, killing_blow)
	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local is_server = self._is_server
	local has_local_client = self._has_local_client

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server then
			template.server.level_object_killed_function(mutator_context, mutator_data, killed_unit, killing_blow)
		end

		if has_local_client then
			template.client.level_object_killed_function(mutator_context, mutator_data, killed_unit, killing_blow)
		end
	end
end

MutatorHandler.ai_hit_by_player = function (self, hit_unit, attacking_unit, attack_data)
	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local is_server = self._is_server
	local has_local_client = self._has_local_client

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server then
			template.server.ai_hit_by_player_function(mutator_context, mutator_data, hit_unit, attacking_unit, attack_data)
		end

		if has_local_client then
			template.client.ai_hit_by_player_function(mutator_context, mutator_data, hit_unit, attacking_unit, attack_data)
		end
	end
end

MutatorHandler.player_hit = function (self, hit_unit, attacking_unit, attack_data)
	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local is_server = self._is_server
	local has_local_client = self._has_local_client

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server then
			template.server.player_hit_function(mutator_context, mutator_data, hit_unit, attacking_unit, attack_data)
		end

		if has_local_client then
			template.client.player_hit_function(mutator_context, mutator_data, hit_unit, attacking_unit, attack_data)
		end
	end
end

MutatorHandler.modify_player_base_damage = function (self, damaged_unit, attacker_unit, damage, damage_type)
	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local is_server = self._is_server

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server and template.modify_player_base_damage then
			damage = template.modify_player_base_damage(mutator_context, mutator_data, damaged_unit, attacker_unit, damage, damage_type)
		end
	end

	return damage
end

MutatorHandler.player_respawned = function (self, spawned_unit)
	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local is_server = self._is_server
	local has_local_client = self._has_local_client

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server then
			template.server.player_respawned_function(mutator_context, mutator_data, spawned_unit)
		end

		if has_local_client then
			template.client.player_respawned_function(mutator_context, mutator_data, spawned_unit)
		end
	end
end

MutatorHandler.damage_taken = function (self, attacked_unit, attacker_unit, damage, damage_source, damage_type)
	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local is_server = self._is_server
	local has_local_client = self._has_local_client

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server then
			template.server.damage_taken_function(mutator_context, mutator_data, attacked_unit, attacker_unit, damage, damage_source, damage_type)
		end

		if has_local_client then
			template.client.damage_taken_function(mutator_context, mutator_data, attacked_unit, attacker_unit, damage, damage_source, damage_type)
		end
	end
end

MutatorHandler.pre_ai_spawned = function (self, breed, optional_data)
	local is_server = self._is_server

	if not is_server then
		return
	end

	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if template.server.pre_ai_spawned_function then
			template.server.pre_ai_spawned_function(mutator_context, mutator_data, breed, optional_data)
		end
	end
end

MutatorHandler.ai_spawned = function (self, spawned_unit)
	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local is_server = self._is_server
	local has_local_client = self._has_local_client

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server then
			template.server.ai_spawned_function(mutator_context, mutator_data, spawned_unit)
		end

		if has_local_client then
			template.client.ai_spawned_function(mutator_context, mutator_data, spawned_unit)
		end
	end
end

MutatorHandler.post_ai_spawned = function (self, ai_unit, breed, optional_data)
	local is_server = self._is_server

	if not is_server then
		return
	end

	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if template.server.post_ai_spawned_function then
			template.server.post_ai_spawned_function(mutator_context, mutator_data, ai_unit, breed, optional_data)
		end
	end
end

MutatorHandler.players_left_safe_zone = function (self)
	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local is_server = self._is_server

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if is_server then
			template.server.server_players_left_safe_zone(mutator_context, mutator_data)
		end
	end
end

MutatorHandler.evaluate_lose_conditions = function (self)
	fassert(self._is_server, "evaluate_lose_conditions only runs on server")

	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators
	local lost, lost_delay = false

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if template.lose_condition_function then
			local result, delay = template.lose_condition_function(mutator_context, mutator_data)

			if result then
				if delay and (lost_delay == nil or lost_delay < delay) then
					lost_delay = delay
				end

				lost = result
			end
		end
	end

	return lost, lost_delay
end

MutatorHandler.evaluate_end_zone_activation_conditions = function (self)
	fassert(self._is_server, "evaluate_end_zone_activation_conditions only runs on server")

	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if template.end_zone_activation_condition_function then
			local result = template.end_zone_activation_condition_function(mutator_context, mutator_data)

			if not result then
				return false
			end
		end
	end

	return true
end

MutatorHandler.post_process_terror_event = function (self, elements)
	fassert(self._is_server, "post_process_terror_event only runs on server")

	local mutator_context = self._mutator_context
	local active_mutators = self._active_mutators

	for _, mutator_data in pairs(active_mutators) do
		local template = mutator_data.template

		if template.post_process_terror_event then
			template.post_process_terror_event(mutator_context, mutator_data, elements)
		end
	end
end

MutatorHandler.pickup_settings_updated_settings = function (self, pickup_settings)
	if not self._is_server then
		return
	end

	if not pickup_settings then
		return nil
	end

	local pickup_settings_clone = table.clone(pickup_settings)
	local final_multipliers = {}
	local mutators = self._mutators

	for _, mutator in pairs(mutators) do
		local pickup_system_multipliers = mutator.template.pickup_system_multipliers

		if pickup_system_multipliers then
			for pickup_type, value in pairs(pickup_system_multipliers) do
				if final_multipliers[pickup_type] then
					final_multipliers[pickup_type] = final_multipliers[pickup_type] * value
				else
					final_multipliers[pickup_type] = value
				end
			end
		end
	end

	local function apply_multipliers(pickup_type, pickup_name, amount)
		if final_multipliers[pickup_name] then
			return math.ceil(amount * final_multipliers[pickup_name])
		elseif final_multipliers[pickup_type] then
			return math.ceil(amount * final_multipliers[pickup_type])
		else
			return amount
		end
	end

	for pickup_type, value in pairs(pickup_settings_clone) do
		if type(value) == "table" then
			for pickup_name, amount in pairs(value) do
				value[pickup_name] = apply_multipliers(pickup_type, pickup_name, amount)
			end
		else
			pickup_settings_clone[pickup_type] = apply_multipliers(pickup_type, nil, value)
		end
	end

	return pickup_settings_clone
end

MutatorHandler.conflict_director_updated_settings = function (self)
	if not self._is_server then
		return
	end

	local mutator_context = self._mutator_context
	local mutators = self._mutators

	for name, mutator_data in pairs(mutators) do
		local template = mutator_data.template

		if template.update_conflict_settings then
			template.update_conflict_settings(mutator_context, mutator_data)
		end
	end
end

MutatorHandler.get_terror_event_tags = function (self)
	local mutator_context = self._mutator_context
	local mutators = self._mutators
	local terror_event_tags

	for name, mutator_data in pairs(mutators) do
		local template = mutator_data.template

		if template.get_terror_event_tags then
			terror_event_tags = terror_event_tags or {}

			template.get_terror_event_tags(mutator_context, mutator_data, terror_event_tags)
		end
	end

	return terror_event_tags
end

MutatorHandler.tweak_zones = function (self, conflict_director_name, zones, num_zones)
	if not self._is_server then
		return
	end

	local mutator_context = self._mutator_context
	local mutators = self._mutators

	for name, mutator_data in pairs(mutators) do
		local template = mutator_data.template

		if template.tweak_zones then
			template.tweak_zones(mutator_context, mutator_data, conflict_director_name, zones, num_zones)
		end
	end

	return zones
end

MutatorHandler._server_initialize_mutator = function (self, name, active_mutators, mutator_context)
	fassert(self._is_server, "Only server is allowed to run mutator initialization function.")

	if not MutatorTemplates[name] then
		mutator_print("No such template (%s)", name)

		return
	end

	local mutators = self._mutators

	fassert(mutators[name] == nil, "Can't initialize an already initialized mutator (%s)", name)
	fassert(active_mutators[name] == nil, "Can't initialize an activated mutator (%s)", name)

	local template = MutatorTemplates[name]
	local mutator_data = {
		template = template,
	}

	mutator_print("Initializing mutator '%s'", name)

	local server_template = template.server

	if server_template.initialize_function then
		server_template.initialize_function(mutator_context, mutator_data)
	end

	self._mutators[name] = mutator_data
	self._initialized_mutator_map[name] = true
end

MutatorHandler._activate_mutator = function (self, name, active_mutators, mutator_context, mutator_data, optional_duration)
	fassert(active_mutators[name] == nil, "Can't have multiple of same mutator running at the same time (%s)", name)

	if not MutatorTemplates[name] then
		mutator_print("No such template (%s)", name)

		return
	end

	mutator_print("Activating mutator '%s'", name)

	local template = MutatorTemplates[name]

	mutator_data = mutator_data or {
		template = template,
	}

	if optional_duration then
		local t = Managers.time:time("game")

		mutator_data.deactivate_at_t = t + optional_duration
	end

	active_mutators[name] = mutator_data

	if self._is_server then
		local server_template = template.server

		if server_template.start_function then
			server_template.start_function(mutator_context, mutator_data)
		end
	end

	if self._has_local_client then
		local client_template = template.client

		if client_template.start_function then
			client_template.start_function(mutator_context, mutator_data)
		end
	end

	if template.register_rpcs then
		template.register_rpcs(mutator_context, mutator_data, self.network_event_delegate)
	end

	if self._is_server then
		local mutator_id = NetworkLookup.mutator_templates[name]
		local activated_by_twitch = not not mutator_data.activated_by_twitch

		self._network_transmit:send_rpc_clients("rpc_activate_mutator_client", mutator_id, activated_by_twitch)
	end
end

MutatorHandler._deactivate_mutator = function (self, name, active_mutators, mutator_context, is_destroy)
	fassert(active_mutators[name], "Trying to deactivate mutator (%s) but it isn't active", name)
	mutator_print("Deactivating mutator '%s'", name)

	local template = MutatorTemplates[name]
	local mutator_data = active_mutators[name]

	if template.unregister_rpcs then
		template.unregister_rpcs(mutator_context, mutator_data)
	end

	active_mutators[name] = nil
	self._mutators[name] = nil

	if self._is_server then
		local server_template = template.server

		if server_template.stop_function then
			server_template.stop_function(mutator_context, mutator_data, is_destroy)
		end

		self._initialized_mutator_map[name] = nil

		local network_state = self._network_handler:get_network_state()

		network_state:set_initialized_mutator_map(table.shallow_copy(self._initialized_mutator_map))
	end

	if self._has_local_client then
		local client_template = template.client

		if client_template.stop_function then
			client_template.stop_function(mutator_context, mutator_data, is_destroy)
		end
	end

	if self._is_server and not is_destroy then
		local mutator_id = NetworkLookup.mutator_templates[name]

		self._network_transmit:send_rpc_clients("rpc_deactivate_mutator_client", mutator_id)
	end
end

MutatorHandler.tweak_pack_spawning_settings = function (zone_mutator_list, mutator_list, conflict_director_name, pack_spawning_settings)
	local new_pack_spawning_settings

	local function run_mutators(mutators)
		for _, mutator_name in ipairs(mutators) do
			local mutator_template = MutatorTemplates[mutator_name]

			if mutator_template.tweak_pack_spawning_settings then
				if not new_pack_spawning_settings then
					new_pack_spawning_settings = table.clone(pack_spawning_settings)
				end

				mutator_template.tweak_pack_spawning_settings(conflict_director_name, new_pack_spawning_settings)
			end
		end
	end

	run_mutators(mutator_list)
	run_mutators(zone_mutator_list)

	return new_pack_spawning_settings or pack_spawning_settings
end

MutatorHandler.rpc_activate_mutator_client = function (self, channel_id, mutator_id, activated_by_twitch)
	fassert(not self._is_server, "Only call rpc_activate_mutator_client on clients.")

	local mutator_name = NetworkLookup.mutator_templates[mutator_id]
	local active_mutators = self._active_mutators
	local mutator_context = self._mutator_context
	local mutator_data = {
		template = MutatorTemplates[mutator_name],
		activated_by_twitch = activated_by_twitch,
	}

	self:_activate_mutator(mutator_name, active_mutators, mutator_context, mutator_data)
end

MutatorHandler.rpc_deactivate_mutator_client = function (self, channel_id, mutator_id)
	fassert(not self._is_server, "Only call rpc_deactivate_mutator_client on clients.")

	local mutator_name = NetworkLookup.mutator_templates[mutator_id]
	local active_mutators = self._active_mutators
	local mutator_context = self._mutator_context

	self:_deactivate_mutator(mutator_name, active_mutators, mutator_context)
end

MutatorHandler.on_client_mutator_list_updated = function (self, key_type, peer_id, local_player_id, profile_index, career_index, party_id, value)
	self._initialized_mutator_map = value
end
