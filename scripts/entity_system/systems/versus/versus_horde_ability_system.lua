-- chunkname: @scripts/entity_system/systems/versus/versus_horde_ability_system.lua

require("scripts/unit_extensions/default_player_unit/versus_horde_ability_extension")
require("scripts/unit_extensions/default_player_unit/versus_horde_ability_husk_extension")

local settings = local_require("scripts/settings/versus_horde_ability_settings")

VersusHordeAbilitySystem = class(VersusHordeAbilitySystem, ExtensionSystemBase)

local RPCS = {
	"rpc_activate_dark_pact_horde_ability",
	"rpc_client_outline_own_horde_units",
}
local EXTENSIONS = {
	"VersusHordeAbilityExtension",
	"VersusHordeAbilityHuskExtension",
}

VersusHordeAbilitySystem.init = function (self, entity_system_creation_context, system_name)
	VersusHordeAbilitySystem.super.init(self, entity_system_creation_context, system_name, EXTENSIONS)
	self:register_rpcs(entity_system_creation_context.network_event_delegate)

	if self.is_server then
		self._server_player_data = {}
		self._next_batch_sync = 0
		self._event_manager = Managers.state.event
		self._conflict_director = Managers.state.conflict
		self._mechanism = Managers.mechanism:game_mechanism()
		self._win_conditions = self._mechanism:win_conditions()

		self._event_manager:register(self, "new_player_unit", "on_player_unit_spawned")
		self._event_manager:register(self, "gm_event_round_started", "on_round_started")
		self._event_manager:register(self, "on_player_joined_party", "on_player_joined_party")
		self._event_manager:register(self, "on_player_left_party", "on_player_left_party")

		self._num_players_by_party = {
			0,
			0,
		}

		if self._mechanism:custom_settings_enabled() then
			local custom_settings_recharge_rate_percent = self._mechanism:get_custom_game_setting("horde_ability_recharge_rate_percent")

			self._custom_settings_modifier = custom_settings_recharge_rate_percent / 100
		end
	end

	self._extensions = {}
	self.unit_storage = entity_system_creation_context.unit_storage
end

VersusHordeAbilitySystem.destroy = function (self)
	if self.is_server then
		self._event_manager:unregister("new_player_unit", self)
		self._event_manager:unregister("gm_event_round_started", self)
		self._event_manager:unregister("on_player_joined_party", self)
		self._event_manager:unregister("on_player_left_party", self)

		if settings.save_charges_between_rounds then
			self._mechanism:cache_horde_ability_charge_data(self._server_player_data)
		end
	end

	self:unregister_rpcs()
end

VersusHordeAbilitySystem.register_rpcs = function (self, network_event_delegate)
	self._network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

VersusHordeAbilitySystem.unregister_rpcs = function (self)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end
end

VersusHordeAbilitySystem.update = function (self, context, t)
	if self.is_server then
		self:_server_update_ability_charges(context.dt)
		self:_server_batch_sync_client_horde_units(t)
	end

	for _, extension in pairs(self._extensions) do
		extension:update(t)
	end
end

VersusHordeAbilitySystem.on_remove_extension = function (self, unit, extension_name)
	self._extensions[unit] = nil

	VersusHordeAbilitySystem.super.on_remove_extension(self, unit, extension_name)
end

VersusHordeAbilitySystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = VersusHordeAbilitySystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)

	self._extensions[unit] = extension

	return extension
end

VersusHordeAbilitySystem.cooldown = function (self)
	return settings.cooldown
end

VersusHordeAbilitySystem.on_round_started = function (self)
	self._round_started = true
end

VersusHordeAbilitySystem.is_activation_allowed = function (self, is_in_ghost_mode)
	local allowed_by_ghost_mode_settings = settings.enable_activation_in_ghost_mode or not is_in_ghost_mode

	return allowed_by_ghost_mode_settings and self._round_started
end

VersusHordeAbilitySystem.activate_dark_pact_horde_ability = function (self)
	if self.is_server then
		local local_player_peer_id = Managers.player:local_player():network_id()

		self:server_spawn_horde(local_player_peer_id)
	else
		self.network_transmit:send_rpc_server("rpc_activate_dark_pact_horde_ability")
	end
end

VersusHordeAbilitySystem.rpc_client_outline_own_horde_units = function (self, channel_id, unit_list)
	for i = 1, #unit_list do
		local unit = self.unit_storage:unit(unit_list[i])

		if unit then
			local outline_extension = ScriptUnit.extension(unit, "outline_system")

			outline_extension:add_outline(OutlineSettingsVS.templates.horde_ability)
		end
	end
end

VersusHordeAbilitySystem.server_register_horde_unit = function (self, go_id, peer_id)
	local player_data = self._server_player_data[peer_id]

	player_data.ability_horde_units_to_sync[#player_data.ability_horde_units_to_sync + 1] = go_id
end

VersusHordeAbilitySystem._server_update_ability_charges = function (self, dt)
	local cooldown = settings.cooldown
	local recharge_increment

	for peer_id, data in pairs(self._server_player_data) do
		if data.ability_charge then
			local recharge_modifier_data = self:_recharge_modifier(peer_id)
			local cooldown_mod = recharge_modifier_data.cooldown
			local custom_settings_modifier = self._custom_settings_modifier or 1

			recharge_increment = not self._round_started and 0 or dt * cooldown_mod * custom_settings_modifier
			data.ability_charge = math.clamp(data.ability_charge + recharge_increment, 0, cooldown)

			if data.extension then
				local boost_mod = recharge_modifier_data.boost

				data.extension:server_set_ability_charge(math.floor(data.ability_charge), cooldown_mod, boost_mod)
			end
		end
	end
end

VersusHordeAbilitySystem.server_spawn_horde = function (self, peer_id)
	local conflict_director = Managers.state.conflict
	local side = Managers.state.side:get_side_from_name("dark_pact")
	local side_id = side.side_id
	local player_data = self._server_player_data[peer_id]

	if settings.cooldown > player_data.ability_charge then
		return
	end

	local horde_ability_composition = self:get_composition()
	local data = {
		override_composition_type = horde_ability_composition,
	}
	local optional_data = {
		horde_ability_caller_peer_id = peer_id,
	}
	local override_epicenter_pos = player_data.extension and POSITION_LOOKUP[player_data.extension:unit()] or nil

	conflict_director.horde_spawner:execute_ambush_horde(data, side_id, false, override_epicenter_pos, optional_data)

	player_data.ability_charge = 0

	local player = Managers.player:player(peer_id, 1)

	if player then
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local dialogue_input = ScriptUnit.extension_input(player_unit, "dialogue_system")

			dialogue_input:trigger_dialogue_event("vs_ability_horde")
		end

		self:_activation_chat_box_message(player:name())
	end
end

VersusHordeAbilitySystem.server_register_peer = function (self, peer_id)
	local cached_ability_charge = settings.save_charges_between_rounds and self._mechanism:get_cached_horde_ability_charges(peer_id)

	if not self._server_player_data[peer_id] then
		self._server_player_data[peer_id] = {
			ability_charge = cached_ability_charge or 0,
			ability_horde_units_to_sync = {},
		}
	end
end

VersusHordeAbilitySystem.server_ability_recharge_boost = function (self, peer_id, action, damage_source, damage_type, target_downed)
	if target_downed and not settings.recharge_boosts_on_downed_units then
		return
	end

	local player_data = self._server_player_data[peer_id]

	if not player_data then
		return
	end

	local actions = settings.recharge_boosts.actions
	local damage_sources = settings.recharge_boosts.damage_sources
	local recharge_value = actions[action] or damage_sources[damage_source] or damage_sources[damage_type]

	if recharge_value then
		recharge_value = recharge_value * self:_recharge_modifier(peer_id).boost

		local percentual_boost = settings.cooldown / 100 * recharge_value

		player_data.ability_charge = player_data.ability_charge + percentual_boost
	end
end

VersusHordeAbilitySystem.on_player_unit_spawned = function (self, player, unit, player_unique_id)
	local extension = self._extensions[unit]

	if not extension then
		return
	end

	local peer_id = player.peer_id
	local player_data = self._server_player_data[peer_id] or {}
	local ability_charge = player_data and player_data.ability_charge or self._mechanism:get_cached_horde_ability_charges(peer_id) or 0

	player_data.player_unit = unit
	player_data.extension = self._extensions[unit]
	player_data.ability_charge = ability_charge
	self._server_player_data[peer_id] = player_data
end

VersusHordeAbilitySystem.rpc_activate_dark_pact_horde_ability = function (self, channel_id)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	self:server_spawn_horde(peer_id)
end

VersusHordeAbilitySystem._server_batch_sync_client_horde_units = function (self, t)
	if t < self._next_batch_sync then
		return
	end

	self._next_batch_sync = t + settings.horde_units_batch_sync_interval

	for peer_id, player_data in pairs(self._server_player_data) do
		local units_to_sync = player_data.ability_horde_units_to_sync

		if units_to_sync and not table.is_empty(units_to_sync) then
			local sync_array = Script.new_array(settings.max_num_horde_units_per_player)

			for i = 1, #units_to_sync do
				sync_array[i] = units_to_sync[i]
			end

			table.clear(units_to_sync)

			if PEER_ID_TO_CHANNEL[peer_id] then
				self.network_transmit:send_rpc("rpc_client_outline_own_horde_units", peer_id, sync_array)
			end
		end
	end
end

VersusHordeAbilitySystem.get_composition = function (self)
	local factions = ConflictDirectors[self._conflict_director.current_conflict_settings].factions
	local compositions = settings.compositions_per_faction
	local selected_composition = compositions.skaven

	if factions and not table.is_empty(factions) then
		local num_factions = #factions
		local start_index = math.random(1, num_factions)

		for i = 0, num_factions - 1 do
			local selected_index = math.index_wrapper(start_index + i, num_factions)
			local faction = factions[selected_index]

			if compositions[faction] then
				selected_composition = compositions[faction]

				break
			end
		end
	end

	return selected_composition
end

VersusHordeAbilitySystem.on_player_joined_party = function (self, peer_id, local_player_id, party_id, slot_id, is_bot)
	if is_bot then
		return
	end

	if self._num_players_by_party[party_id] then
		self._num_players_by_party[party_id] = self._num_players_by_party[party_id] + 1
	end
end

VersusHordeAbilitySystem.on_player_left_party = function (self, peer_id, local_player_id, party_id, slot_id)
	if self._num_players_by_party[party_id] then
		self._num_players_by_party[party_id] = self._num_players_by_party[party_id] - 1
	end
end

VersusHordeAbilitySystem._recharge_modifier = function (self)
	self._pactsworn_party_id = Managers.state.side:get_side_from_name("dark_pact").party.party_id
	self._hero_party_id = Managers.state.side:get_side_from_name("heroes").party.party_id

	local pactsworn_party_id = Managers.state.side:get_side_from_name("dark_pact").party.party_id
	local hero_party_id = Managers.state.side:get_side_from_name("heroes").party.party_id
	local team_size_difference = math.clamp(self._num_players_by_party[hero_party_id] - self._num_players_by_party[pactsworn_party_id], 0, 3)
	local team_size_modifier = settings.team_size_difference_recharge_modifier[team_size_difference]
	local pactsworn_score = self._win_conditions:get_total_score(pactsworn_party_id)
	local hero_score = self._win_conditions:get_total_score(hero_party_id)
	local factor = 10
	local score_difference = pactsworn_score - hero_score
	local sign = math.sign(score_difference)
	local rounded_score_difference = math.floor(math.abs(score_difference / factor)) * factor * sign
	local max_score_difference = settings.max_score_difference_modifier
	local score_modifier = settings.score_difference_recharge_modifier[rounded_score_difference] or settings.score_difference_recharge_modifier[max_score_difference * sign]
	local max_modifier = settings.team_size_difference_recharge_modifier[3]
	local recharge_modifier = {
		cooldown = math.min(score_modifier.cooldown_mod * team_size_modifier, max_modifier),
		boost = math.min(score_modifier.boost_mod * team_size_modifier, max_modifier),
	}
	local current_set = self._mechanism:get_current_set()

	if current_set == 1 then
		recharge_modifier = {
			cooldown = team_size_modifier,
			boost = team_size_modifier,
		}
	end

	return recharge_modifier or 1
end

VersusHordeAbilitySystem._activation_chat_box_message = function (self, player_name)
	if not player_name then
		return
	end

	local chat = Managers.chat

	if chat ~= nil and chat:has_channel(1) then
		local localize_parameters = false
		local pop_chat = true

		chat:send_system_chat_message(1, "vs_chat_message_horde_ability", player_name, localize_parameters, pop_chat)
	end
end

VersusHordeAbilitySystem.settings = function (self)
	return settings
end
