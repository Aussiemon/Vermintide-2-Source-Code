-- chunkname: @scripts/managers/game_mode/mechanisms/deus_run_state.lua

require("scripts/helpers/deus_power_up_utils")
require("scripts/network/shared_state")

local shared_state_spec = require("scripts/managers/game_mode/mechanisms/deus_run_state_spec")

DeusRunState = class(DeusRunState)

DeusRunState.init = function (self, run_id, is_server, network_handler, server_peer_id, own_peer_id, own_initial_loadout, own_initial_talents, weapon_group_whitelist)
	self._run_id = run_id
	self._is_server = is_server
	self._server_peer_id = server_peer_id
	self._own_peer_id = own_peer_id
	self._network_handler = network_handler

	local run_state_id_key = "deus_run_state_" .. run_id

	self._shared_state = SharedState:new(run_state_id_key, shared_state_spec, is_server, network_handler, server_peer_id, own_peer_id)
	self._own_initial_loadout = own_initial_loadout
	self._own_initial_talents = own_initial_talents
	self._weapon_group_whitelist = weapon_group_whitelist
end

DeusRunState.network_context_created = function (self, lobby, server_peer_id, own_peer_id, is_server, network_handler)
	self._is_server = is_server
	self._server_peer_id = server_peer_id
	self._network_handler = network_handler

	self._shared_state:network_context_created(lobby, server_peer_id, own_peer_id, is_server, network_handler)
end

DeusRunState.register_rpcs = function (self, network_event_delegate)
	self._shared_state:register_rpcs(network_event_delegate)
end

DeusRunState.unregister_rpcs = function (self)
	self._shared_state:unregister_rpcs()
end

DeusRunState.full_sync = function (self)
	self._shared_state:full_sync()
end

DeusRunState.destroy = function (self)
	self:unregister_rpcs()
	self._shared_state:destroy()
end

DeusRunState.get_revision = function (self)
	return self._shared_state:get_revision()
end

DeusRunState.is_server = function (self)
	return self._is_server
end

DeusRunState.get_server_peer_id = function (self)
	return self._server_peer_id
end

DeusRunState.get_own_peer_id = function (self)
	return self._own_peer_id
end

DeusRunState.get_own_initial_loadout = function (self)
	return self._own_initial_loadout
end

DeusRunState.get_own_initial_talents = function (self)
	return self._own_initial_talents
end

DeusRunState.get_weapon_group_whitelist = function (self)
	return self._weapon_group_whitelist
end

DeusRunState.set_run_ended = function (self, value)
	self._shared_state:set_server(self._shared_state:get_key("run_ended"), value)
end

DeusRunState.get_run_ended = function (self)
	return self._shared_state:get_server(self._shared_state:get_key("run_ended"))
end

DeusRunState.set_run_seed = function (self, run_seed)
	self._run_seed = run_seed
end

DeusRunState.set_run_difficulty = function (self, difficulty)
	self._difficulty = difficulty
end

DeusRunState.get_run_difficulty = function (self)
	return self._difficulty
end

DeusRunState.set_journey_name = function (self, journey_name)
	self._journey_name = journey_name
end

DeusRunState.get_journey_name = function (self)
	return self._journey_name
end

DeusRunState.set_dominant_god = function (self, dominant_god)
	self._dominant_god = dominant_god
end

DeusRunState.get_dominant_god = function (self)
	return self._dominant_god
end

DeusRunState.get_run_id = function (self)
	return self._run_id
end

DeusRunState.get_run_seed = function (self)
	return self._run_seed
end

DeusRunState.set_current_node_key = function (self, node_key)
	self._shared_state:set_server(self._shared_state:get_key("run_node_key"), node_key)
end

DeusRunState.get_current_node_key = function (self)
	return self._shared_state:get_server(self._shared_state:get_key("run_node_key"))
end

DeusRunState.get_completed_level_count = function (self)
	return self._shared_state:get_server(self._shared_state:get_key("completed_level_count")) or 0
end

DeusRunState.set_completed_level_count = function (self, count)
	self._shared_state:set_server(self._shared_state:get_key("completed_level_count"), count)
end

DeusRunState.get_traversed_nodes = function (self)
	return self._shared_state:get_server(self._shared_state:get_key("traversed_nodes"))
end

DeusRunState.set_traversed_nodes = function (self, traversed_nodes_array)
	self._shared_state:set_server(self._shared_state:get_key("traversed_nodes"), traversed_nodes_array)
end

DeusRunState.get_blessings = function (self)
	local blessings_with_buyer = self._shared_state:get_server(self._shared_state:get_key("blessings_with_buyer"))
	local blessings_array = {}

	for blessing, _ in pairs(blessings_with_buyer) do
		blessings_array[#blessings_array + 1] = blessing
	end

	return blessings_array
end

DeusRunState.get_blessings_with_buyer = function (self)
	return self._shared_state:get_server(self._shared_state:get_key("blessings_with_buyer"))
end

DeusRunState.set_blessings_with_buyer = function (self, blessings_with_buyer)
	self._shared_state:set_server(self._shared_state:get_key("blessings_with_buyer"), blessings_with_buyer)
end

DeusRunState.get_blessing_lifetime = function (self, blessing_name)
	local blessing_lifetimes = self._shared_state:get_server(self._shared_state:get_key("blessing_lifetimes"))

	return blessing_lifetimes[blessing_name] or 0
end

DeusRunState.set_blessing_lifetime = function (self, blessing_name, lifetime)
	local blessing_lifetimes = self._shared_state:get_server(self._shared_state:get_key("blessing_lifetimes"))
	local skip_metatable = true

	blessing_lifetimes = table.clone(blessing_lifetimes, skip_metatable)
	blessing_lifetimes[blessing_name] = lifetime

	self._shared_state:set_server(self._shared_state:get_key("blessing_lifetimes"), blessing_lifetimes)
end

DeusRunState.get_peer_initialized = function (self, peer_id)
	local key = self._shared_state:get_key("peer_initialized", peer_id)

	return self._shared_state:get_server(key)
end

DeusRunState.set_peer_initialized = function (self, peer_id, initialized)
	local key = self._shared_state:get_key("peer_initialized", peer_id)

	self._shared_state:set_server(key, initialized)
end

DeusRunState.get_profile_initialized = function (self, peer_id, local_player_id, profile_index, career_index)
	local key = self._shared_state:get_key("profile_initialized", peer_id, local_player_id, profile_index, career_index)

	return self._shared_state:get_server(key)
end

DeusRunState.set_profile_initialized = function (self, peer_id, local_player_id, profile_index, career_index, initialized)
	local key = self._shared_state:get_key("profile_initialized", peer_id, local_player_id, profile_index, career_index)

	self._shared_state:set_server(key, initialized)
end

DeusRunState.get_cursed_levels_completed = function (self, peer_id)
	local key = self._shared_state:get_key("cursed_levels_completed", peer_id)

	return self._shared_state:get_server(key)
end

DeusRunState.set_cursed_levels_completed = function (self, peer_id, count)
	local key = self._shared_state:get_key("cursed_levels_completed", peer_id)

	self._shared_state:set_server(key, count)
end

DeusRunState.get_cursed_chests_purified = function (self, peer_id)
	local key = self._shared_state:get_key("cursed_chests_purified", peer_id)

	return self._shared_state:get_server(key)
end

DeusRunState.set_cursed_chests_purified = function (self, peer_id, count)
	local key = self._shared_state:get_key("cursed_chests_purified", peer_id)

	self._shared_state:set_server(key, count)
end

DeusRunState.get_coin_chests_collected = function (self, peer_id)
	local key = self._shared_state:get_key("coin_chests_collected", peer_id)

	return self._shared_state:get_server(key)
end

DeusRunState.set_coin_chests_collected = function (self, peer_id, count)
	local key = self._shared_state:get_key("coin_chests_collected", peer_id)

	self._shared_state:set_server(key, count)
end

DeusRunState.get_party_power_ups = function (self)
	local key = self._shared_state:get_key("party_power_ups")

	return self._shared_state:get_server(key)
end

DeusRunState.set_party_power_ups = function (self, power_ups)
	local key = self._shared_state:get_key("party_power_ups")

	self._shared_state:set_server(key, power_ups)
end

DeusRunState.get_bought_power_ups = function (self)
	local key = self._shared_state:get_key("bought_power_ups")

	return self._shared_state:get_server(key)
end

DeusRunState.set_bought_power_ups = function (self, bought_power_ups)
	local key = self._shared_state:get_key("bought_power_ups")

	self._shared_state:set_server(key, bought_power_ups)
end

DeusRunState.get_bought_blessings = function (self)
	local key = self._shared_state:get_key("bought_blessings")

	return self._shared_state:get_server(key)
end

DeusRunState.set_bought_blessings = function (self, bought_blessings)
	local key = self._shared_state:get_key("bought_blessings")

	self._shared_state:set_server(key, bought_blessings)
end

DeusRunState.get_ground_coins_picked_up = function (self)
	local key = self._shared_state:get_key("ground_coins_picked_up")

	return self._shared_state:get_server(key)
end

DeusRunState.set_ground_coins_picked_up = function (self, coin_count)
	local key = self._shared_state:get_key("ground_coins_picked_up")

	self._shared_state:set_server(key, coin_count)
end

DeusRunState.get_monster_coins_picked_up = function (self)
	local key = self._shared_state:get_key("monster_coins_picked_up")

	return self._shared_state:get_server(key)
end

DeusRunState.set_monster_coins_picked_up = function (self, coin_count)
	local key = self._shared_state:get_key("monster_coins_picked_up")

	self._shared_state:set_server(key, coin_count)
end

DeusRunState.get_coins_spent = function (self)
	local key = self._shared_state:get_key("coins_spent")

	return self._shared_state:get_server(key)
end

DeusRunState.set_coins_spent = function (self, coin_count)
	local key = self._shared_state:get_key("coins_spent")

	self._shared_state:set_server(key, coin_count)
end

DeusRunState.get_coins_earned = function (self)
	local key = self._shared_state:get_key("coins_earned")

	return self._shared_state:get_server(key)
end

DeusRunState.set_coins_earned = function (self, coin_count)
	local key = self._shared_state:get_key("coins_earned")

	self._shared_state:set_server(key, coin_count)
end

DeusRunState.get_melee_swap_chests_used = function (self)
	local key = self._shared_state:get_key("melee_swap_chests_used")

	return self._shared_state:get_server(key)
end

DeusRunState.set_melee_swap_chests_used = function (self, value)
	local key = self._shared_state:get_key("melee_swap_chests_used")

	self._shared_state:set_server(key, value)
end

DeusRunState.get_ranged_swap_chests_used = function (self)
	local key = self._shared_state:get_key("ranged_swap_chests_used")

	return self._shared_state:get_server(key)
end

DeusRunState.set_ranged_swap_chests_used = function (self, value)
	local key = self._shared_state:get_key("ranged_swap_chests_used")

	self._shared_state:set_server(key, value)
end

DeusRunState.get_upgrade_chests_used = function (self)
	local key = self._shared_state:get_key("upgrade_chests_used")

	return self._shared_state:get_server(key)
end

DeusRunState.set_upgrade_chests_used = function (self, value)
	local key = self._shared_state:get_key("upgrade_chests_used")

	self._shared_state:set_server(key, value)
end

DeusRunState.get_power_up_chests_used = function (self)
	local key = self._shared_state:get_key("power_up_chests_used")

	return self._shared_state:get_server(key)
end

DeusRunState.set_power_up_chests_used = function (self, value)
	local key = self._shared_state:get_key("power_up_chests_used")

	self._shared_state:set_server(key, value)
end

DeusRunState.get_host_migration_count = function (self)
	local key = self._shared_state:get_key("host_migration_count")

	return self._shared_state:get_server(key)
end

DeusRunState.set_host_migration_count = function (self, value)
	local key = self._shared_state:get_key("host_migration_count")

	self._shared_state:set_server(key, value)
end

DeusRunState.get_belakor_enabled = function (self)
	return self._belakor_enabled
end

DeusRunState.set_belakor_enabled = function (self, belakor_enabled)
	self._belakor_enabled = belakor_enabled
end

DeusRunState.get_arena_belakor_node = function (self)
	local key = self._shared_state:get_key("arena_belakor_node")
	local value = self._shared_state:get_server(key)

	return value ~= "" and value or nil
end

DeusRunState.set_arena_belakor_node = function (self, value)
	local key = self._shared_state:get_key("arena_belakor_node")

	self._shared_state:set_server(key, value)
end

DeusRunState.get_seen_arena_belakor_node = function (self, peer_id)
	local key = self._shared_state:get_key("seen_arena_belakor_node", peer_id)
	local value = self._shared_state:get_server(key)

	return value ~= "" and value or nil
end

DeusRunState.set_seen_arena_belakor_node = function (self, peer_id, value)
	local key = self._shared_state:get_key("seen_arena_belakor_node", peer_id)

	self._shared_state:set_server(key, value)
end

DeusRunState.get_granted_non_party_end_of_level_power_ups = function (self, peer_id, local_player_id, profile_index, career_index)
	return self._shared_state:get_server(self._shared_state:get_key("granted_non_party_end_of_level_power_ups", peer_id, local_player_id, profile_index, career_index))
end

DeusRunState.set_granted_non_party_end_of_level_power_ups = function (self, peer_id, local_player_id, profile_index, career_index, granted_non_party_end_of_level_power_ups_array)
	self._shared_state:set_server(self._shared_state:get_key("granted_non_party_end_of_level_power_ups", peer_id, local_player_id, profile_index, career_index), granted_non_party_end_of_level_power_ups_array)
end

DeusRunState.get_player_profile = function (self, peer_id, local_player_id)
	local profile_index, career_index = self._network_handler.profile_synchronizer:profile_by_peer(peer_id, local_player_id)

	return profile_index or 0, career_index or 0
end

DeusRunState.get_player_level = function (self, peer_id)
	return self._shared_state:get_peer(peer_id, self._shared_state:get_key("player_level"))
end

DeusRunState.set_own_player_level = function (self, level)
	self._shared_state:set_own(self._shared_state:get_key("player_level"), level)
end

DeusRunState.get_player_name = function (self, peer_id)
	return self._shared_state:get_peer(peer_id, self._shared_state:get_key("player_name"))
end

DeusRunState.set_own_player_name = function (self, name)
	self._shared_state:set_own(self._shared_state:get_key("player_name"), name)
end

DeusRunState.get_player_frame = function (self, peer_id)
	return self._shared_state:get_peer(peer_id, self._shared_state:get_key("player_frame"))
end

DeusRunState.set_own_player_frame = function (self, frame)
	self._shared_state:set_own(self._shared_state:get_key("player_frame"), frame)
end

DeusRunState.get_player_spawned_once = function (self, peer_id, local_player_id, profile_index, career_index)
	local key = self._shared_state:get_key("spawned_once", peer_id, local_player_id, profile_index, career_index)

	return self._shared_state:get_server(key) or false
end

DeusRunState.set_player_spawned_once = function (self, peer_id, local_player_id, profile_index, career_index, player_spawned_once)
	local key = self._shared_state:get_key("spawned_once", peer_id, local_player_id, profile_index, career_index)

	self._shared_state:set_server(key, player_spawned_once)
end

DeusRunState.get_player_power_ups = function (self, peer_id, local_player_id, profile_index, career_index)
	local key = self._shared_state:get_key("power_ups", peer_id, local_player_id, profile_index, career_index)

	return self._shared_state:get_server(key)
end

DeusRunState.set_player_power_ups = function (self, peer_id, local_player_id, profile_index, career_index, power_ups)
	local key = self._shared_state:get_key("power_ups", peer_id, local_player_id, profile_index, career_index)

	self._shared_state:set_server(key, power_ups)
end

DeusRunState.get_player_persistent_buffs = function (self, peer_id, local_player_id, profile_index, career_index)
	local key = self._shared_state:get_key("persistent_buffs", peer_id, local_player_id, profile_index, career_index)

	return self._shared_state:get_server(key)
end

DeusRunState.set_player_persistent_buffs = function (self, peer_id, local_player_id, profile_index, career_index, persistent_buffs)
	local key = self._shared_state:get_key("persistent_buffs", peer_id, local_player_id, profile_index, career_index)

	self._shared_state:set_server(key, persistent_buffs)
end

DeusRunState.get_player_soft_currency = function (self, peer_id, local_player_id)
	local key = self._shared_state:get_key("soft_currency", peer_id, local_player_id)

	return self._shared_state:get_server(key)
end

DeusRunState.set_player_soft_currency = function (self, peer_id, local_player_id, coins)
	local key = self._shared_state:get_key("soft_currency", peer_id, local_player_id)

	self._shared_state:set_server(key, coins)
end

DeusRunState.get_player_health_percentage = function (self, peer_id, local_player_id, profile_index, career_index)
	local key = self._shared_state:get_key("health_percentage", peer_id, local_player_id, profile_index, career_index)

	return self._shared_state:get_server(key)
end

DeusRunState.set_player_health_percentage = function (self, peer_id, local_player_id, profile_index, career_index, health_percentage)
	local key = self._shared_state:get_key("health_percentage", peer_id, local_player_id, profile_index, career_index)

	self._shared_state:set_server(key, health_percentage)
end

DeusRunState.get_player_health_state = function (self, peer_id, local_player_id, profile_index, career_index)
	local key = self._shared_state:get_key("health_state", peer_id, local_player_id, profile_index, career_index)

	return self._shared_state:get_server(key)
end

DeusRunState.set_player_health_state = function (self, peer_id, local_player_id, profile_index, career_index, health_state)
	local key = self._shared_state:get_key("health_state", peer_id, local_player_id, profile_index, career_index)

	self._shared_state:set_server(key, health_state)
end

DeusRunState.get_player_melee_ammo = function (self, peer_id, local_player_id, profile_index, career_index)
	local key = self._shared_state:get_key("melee_ammo", peer_id, local_player_id, profile_index, career_index)

	return self._shared_state:get_server(key)
end

DeusRunState.set_player_melee_ammo = function (self, peer_id, local_player_id, profile_index, career_index, melee_ammo)
	local key = self._shared_state:get_key("melee_ammo", peer_id, local_player_id, profile_index, career_index)

	self._shared_state:set_server(key, melee_ammo)
end

DeusRunState.get_player_ranged_ammo = function (self, peer_id, local_player_id, profile_index, career_index)
	local key = self._shared_state:get_key("ranged_ammo", peer_id, local_player_id, profile_index, career_index)

	return self._shared_state:get_server(key)
end

DeusRunState.set_player_ranged_ammo = function (self, peer_id, local_player_id, profile_index, career_index, ranged_ammo)
	local key = self._shared_state:get_key("ranged_ammo", peer_id, local_player_id, profile_index, career_index)

	self._shared_state:set_server(key, ranged_ammo)
end

DeusRunState.get_player_consumable_healthkit_slot = function (self, peer_id, local_player_id, profile_index, career_index)
	local key = self._shared_state:get_key("healthkit", peer_id, local_player_id, profile_index, career_index)
	local val = self._shared_state:get_server(key)

	return val ~= "" and val or nil
end

DeusRunState.set_player_consumable_healthkit_slot = function (self, peer_id, local_player_id, profile_index, career_index, item_name)
	local key = self._shared_state:get_key("healthkit", peer_id, local_player_id, profile_index, career_index)
	local val = item_name or ""

	self._shared_state:set_server(key, val)
end

DeusRunState.get_player_consumable_potion_slot = function (self, peer_id, local_player_id, profile_index, career_index)
	local key = self._shared_state:get_key("potion", peer_id, local_player_id, profile_index, career_index)
	local val = self._shared_state:get_server(key)

	return val ~= "" and val or nil
end

DeusRunState.set_player_consumable_potion_slot = function (self, peer_id, local_player_id, profile_index, career_index, item_name)
	local key = self._shared_state:get_key("potion", peer_id, local_player_id, profile_index, career_index)
	local val = item_name or ""

	self._shared_state:set_server(key, val)
end

DeusRunState.get_player_consumable_grenade_slot = function (self, peer_id, local_player_id, profile_index, career_index)
	local key = self._shared_state:get_key("grenade", peer_id, local_player_id, profile_index, career_index)
	local val = self._shared_state:get_server(key)

	return val ~= "" and val or nil
end

DeusRunState.set_player_consumable_grenade_slot = function (self, peer_id, local_player_id, profile_index, career_index, item_name)
	local key = self._shared_state:get_key("grenade", peer_id, local_player_id, profile_index, career_index)
	local val = item_name or ""

	self._shared_state:set_server(key, val)
end

DeusRunState.get_player_additional_items = function (self, peer_id, local_player_id, profile_index, career_index)
	local key = self._shared_state:get_key("additional_items", peer_id, local_player_id, profile_index, career_index)

	return self._shared_state:get_server(key)
end

DeusRunState.set_player_additional_items = function (self, peer_id, local_player_id, profile_index, career_index, additional_items)
	local key = self._shared_state:get_key("additional_items", peer_id, local_player_id, profile_index, career_index)

	self._shared_state:set_server(key, additional_items)
end

DeusRunState.get_player_loadout = function (self, peer_id, local_player_id, profile_index, career_index, slot)
	local key = self._shared_state:get_key(slot, peer_id, local_player_id, profile_index, career_index)
	local val = self._shared_state:get_server(key)

	return val ~= "" and val or nil
end

DeusRunState.set_player_loadout = function (self, peer_id, local_player_id, profile_index, career_index, slot, serialized_deus_weapon)
	local key = self._shared_state:get_key(slot, peer_id, local_player_id, profile_index, career_index)

	self._shared_state:set_server(key, serialized_deus_weapon or "")
end

DeusRunState.set_twitch_level_vote = function (self, node_key)
	self._shared_state:set_server(self._shared_state:get_key("twitch_vote"), node_key or "")
end

DeusRunState.get_twitch_level_vote = function (self)
	local twitch_vote = self._shared_state:get_server(self._shared_state:get_key("twitch_vote"))

	if twitch_vote == "" then
		return nil
	else
		return twitch_vote
	end
end

DeusRunState.set_scoreboard = function (self, scoreboard)
	self._scoreboard = scoreboard
end

DeusRunState.get_scoreboard = function (self, scoreboard)
	return self._scoreboard
end

DeusRunState.set_persisted_score = function (self, peer_id, local_player_id, persisted_score)
	local key = self._shared_state:get_key("persisted_score", peer_id, local_player_id)

	self._shared_state:set_server(key, persisted_score)
end

DeusRunState.get_persisted_score = function (self, peer_id, local_player_id, persisted_score)
	local key = self._shared_state:get_key("persisted_score", peer_id, local_player_id)

	return self._shared_state:get_server(key)
end

DeusRunState.set_own_weapon_pool_data = function (self, weapon_pool_data)
	self._weapon_pool_data = weapon_pool_data
end

DeusRunState.get_own_weapon_pool_data = function (self)
	return self._weapon_pool_data
end

DeusRunState.set_own_weapon_pool_excludes = function (self, pool_excludes)
	self._weapon_pool_excludes = pool_excludes
end

DeusRunState.get_own_weapon_pool_excludes = function (self)
	return self._weapon_pool_excludes or {}
end

DeusRunState.get_player_telemetry_id = function (self, peer_id)
	local key = self._shared_state:get_key("telemetry_id")

	return self._shared_state:get_peer(peer_id, key)
end

DeusRunState.set_own_player_telemetry_id = function (self, telemetry_id)
	local key = self._shared_state:get_key("telemetry_id")

	self._shared_state:set_own(key, telemetry_id)
end
