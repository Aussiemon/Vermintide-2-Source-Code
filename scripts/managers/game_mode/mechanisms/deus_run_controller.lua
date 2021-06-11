require("scripts/helpers/deus_power_up_utils")
require("scripts/helpers/rarity_utils")
require("scripts/managers/game_mode/mechanisms/deus_generate_graph")
require("scripts/settings/dlcs/morris/deus_map_visibility_settings")
require("scripts/settings/dlcs/morris/deus_blessing_settings")
require("scripts/settings/dlcs/morris/deus_cost_settings")
require("scripts/settings/dlcs/morris/deus_new_loadout_settings")
require("scripts/settings/dlcs/morris/deus_experience_settings")
require("scripts/managers/game_mode/mechanisms/deus_run_state")
require("scripts/utils/hash_utils")

DeusRunController = class(DeusRunController)
local RPCS = {
	"rpc_deus_shop_heal_player",
	"rpc_deus_shop_blessing_selected",
	"rpc_deus_shop_power_up_bought",
	"rpc_deus_save_loadout",
	"rpc_deus_add_power_ups",
	"rpc_deus_set_initial_soft_currency",
	"rpc_deus_set_initial_setup",
	"rpc_deus_chest_unlocked",
	"rpc_deus_soft_currency_picked_up"
}
local REAL_PLAYER_LOCAL_ID = 1
local DISCOUNT_CONVERSION_EPSILON = 10000
local stats_to_save = {
	{
		"kills_per_breed",
		"skaven_storm_vermin"
	},
	{
		"kills_per_breed",
		"skaven_storm_vermin_commander"
	},
	{
		"kills_per_breed",
		"skaven_storm_vermin_with_shield"
	},
	{
		"kills_per_breed",
		"skaven_plague_monk"
	},
	{
		"kills_per_breed",
		"chaos_warrior"
	},
	{
		"kills_per_breed",
		"chaos_berzerker"
	},
	{
		"kills_per_breed",
		"chaos_raider"
	},
	{
		"kills_per_breed",
		"beastmen_bestigor"
	},
	{
		"kills_per_breed",
		"skaven_gutter_runner"
	},
	{
		"kills_per_breed",
		"skaven_poison_wind_globadier"
	},
	{
		"kills_per_breed",
		"skaven_pack_master"
	},
	{
		"kills_per_breed",
		"skaven_ratling_gunner"
	},
	{
		"kills_per_breed",
		"skaven_warpfire_thrower"
	},
	{
		"kills_per_breed",
		"chaos_corruptor_sorcerer"
	},
	{
		"kills_per_breed",
		"chaos_vortex_sorcerer"
	},
	{
		"kills_per_breed",
		"beastmen_standard_bearer"
	},
	{
		"kills_total"
	},
	{
		"kills_melee"
	},
	{
		"kills_ranged"
	},
	{
		"damage_taken"
	},
	{
		"damage_dealt"
	},
	{
		"damage_dealt_per_breed",
		"skaven_rat_ogre"
	},
	{
		"damage_dealt_per_breed",
		"skaven_stormfiend"
	},
	{
		"damage_dealt_per_breed",
		"chaos_spawn"
	},
	{
		"damage_dealt_per_breed",
		"chaos_troll"
	},
	{
		"damage_dealt_per_breed",
		"beastmen_minotaur"
	},
	{
		"headshots"
	},
	{
		"saves"
	},
	{
		"revives"
	}
}
local loot_chest_rewards = {
	normal = {
		"loot_chest_01_06",
		2
	},
	hard = {
		"loot_chest_02_06",
		2
	},
	harder = {
		"loot_chest_03_06",
		2
	},
	hardest = {
		"loot_chest_04_06",
		2
	},
	cataclysm = {
		"loot_chest_04_06",
		2
	}
}
script_data.deus_run_controller_debug = true
local global_print = print

local function dprint(...)
	if script_data.deus_run_controller_debug then
		global_print("[DeusRunController] ", ...)
	end
end

local function print(...)
	global_print("[DeusRunController] ", ...)
end

local function low_precision_float_comparison(a, b)
	if not a and not b then
		return true
	elseif not a or not b then
		return false
	end

	return math.round_with_precision(a, 2) == math.round_with_precision(b, 2)
end

local function calculate_next_shop_heal(current_health, current_coins, default_heal_amount, default_heal_cost)
	local heal_amount, heal_cost = nil
	local health_per_coin = default_heal_amount / default_heal_cost

	if current_health <= 1 - DeusShopSettings.heal_amount then
		heal_amount = default_heal_amount
	else
		heal_amount = 1 - current_health
	end

	heal_cost = math.ceil(heal_amount / health_per_coin)

	if current_coins < heal_cost then
		heal_cost = current_coins
		heal_amount = heal_cost * health_per_coin
	end

	return heal_amount, heal_cost
end

DeusRunController.init = function (self, run_id, is_server, network_handler, server_peer_id, own_peer_id, own_initial_loadout, own_initial_talents, weapon_group_whitelist)
	self._run_state = DeusRunState:new(run_id, is_server, network_handler, server_peer_id, own_peer_id, own_initial_loadout, own_initial_talents, weapon_group_whitelist)
	self._network_handler = network_handler
end

DeusRunController.network_context_created = function (self, lobby, server_peer_id, own_peer_id, is_server, network_handler)
	self._run_state:network_context_created(lobby, server_peer_id, own_peer_id, is_server, network_handler)

	self._network_handler = network_handler
	local host_migration_count = self._run_state:get_host_migration_count()
	host_migration_count = host_migration_count + 1

	self._run_state:set_host_migration_count(host_migration_count)
end

DeusRunController.register_rpcs = function (self, network_event_delegate)
	self._network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
	self._run_state:register_rpcs(network_event_delegate)
end

DeusRunController.unregister_rpcs = function (self)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)
	end

	self._network_event_delegate = nil

	self._run_state:unregister_rpcs()
end

DeusRunController.full_sync = function (self)
	self._run_state:full_sync()
end

DeusRunController.is_server = function (self)
	return self._run_state:is_server()
end

DeusRunController.get_server_peer_id = function (self)
	return self._run_state:server_peer_id()
end

DeusRunController.get_own_peer_id = function (self)
	return self._run_state:own_peer_id()
end

DeusRunController.destroy = function (self)
	self:unregister_rpcs()
	self._run_state:destroy()

	self._destroyed = true
end

DeusRunController.get_run_ended = function (self)
	return self._run_state:get_run_ended()
end

DeusRunController.handle_run_ended = function (self)
	self._run_state:set_run_ended(true)
end

DeusRunController.setup_run = function (self, run_seed, difficulty, journey_name, dominant_god, initial_own_soft_currency, telemetry_id)
	self._run_state:set_run_seed(run_seed)
	self._run_state:set_run_difficulty(difficulty)
	self._run_state:set_journey_name(journey_name)
	self._run_state:set_dominant_god(dominant_god)

	local populate_config = DEUS_MAP_POPULATE_SETTINGS[journey_name] or DEUS_MAP_POPULATE_SETTINGS.default
	self._path_graph = deus_generate_graph(run_seed, journey_name, dominant_god, populate_config)

	self._run_state:set_current_node_key("start")

	self._run_start_time = os.time()

	self._run_state:set_own_player_telemetry_id(telemetry_id)

	local own_peer_id = self._run_state:get_own_peer_id()
	local profile_index, career_index = self._run_state:get_player_profile(own_peer_id, REAL_PLAYER_LOCAL_ID)
	local melee_item_string, ranged_item_string, initial_talents_for_career = nil

	if profile_index ~= 0 then
		local profile = SPProfiles[profile_index]
		local career_name = profile.careers[career_index].name
		local initial_talents = self._run_state:get_own_initial_talents()
		initial_talents_for_career = initial_talents[career_name]
		local initial_loadout = self._run_state:get_own_initial_loadout()
		local initial_loadout_for_career = initial_loadout[career_name]
		local melee_item = initial_loadout_for_career.slot_melee
		local ranged_item = initial_loadout_for_career.slot_ranged
		melee_item_string = DeusWeaponGeneration.serialize_weapon(melee_item)
		ranged_item_string = DeusWeaponGeneration.serialize_weapon(ranged_item)
	end

	local run_id = self._run_state:get_run_id()

	if self._run_state:is_server() then
		self._run_state:set_player_soft_currency(own_peer_id, REAL_PLAYER_LOCAL_ID, initial_own_soft_currency)
		self._run_state:set_peer_initialized(own_peer_id, true)

		if profile_index ~= 0 then
			self:_add_initial_talents_as_power_ups(own_peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index, initial_talents_for_career)
			self:_add_initial_weapons_to_loadout(own_peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index, melee_item_string, ranged_item_string)
			self._run_state:set_profile_initialized(own_peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index, true)
		end

		Managers.telemetry.events:deus_run_started(run_id, journey_name, run_seed, dominant_god, difficulty)
		self:_add_coin_tracking_entry(own_peer_id, REAL_PLAYER_LOCAL_ID, initial_own_soft_currency, "set initial soft currency")
	else
		local server_peer_id = self._run_state:get_server_peer_id()
		local server_channel_id = PEER_ID_TO_CHANNEL[server_peer_id]

		RPC.rpc_deus_set_initial_soft_currency(server_channel_id, initial_own_soft_currency)

		if profile_index ~= 0 and not self._run_state:get_profile_initialized(own_peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index) then
			self:_add_initial_talents_as_power_ups(own_peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index, initial_talents_for_career)
			self:_add_initial_weapons_to_loadout(own_peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index, melee_item_string, ranged_item_string)
			RPC.rpc_deus_set_initial_setup(server_channel_id, profile_index, career_index, initial_talents_for_career, melee_item_string, ranged_item_string)
		end
	end

	print(sprintf("starting <%s> with seed <%s> on difficulty <%s> and dominant god <%s>", journey_name, run_seed, difficulty, dominant_god))
end

DeusRunController.get_state_revision = function (self)
	return self._run_state:get_revision()
end

DeusRunController.rpc_deus_set_initial_soft_currency = function (self, sender_channel_id, initial_own_soft_currency)
	local sender = CHANNEL_TO_PEER_ID[sender_channel_id]

	if not self._run_state:get_peer_initialized(sender) then
		local progress = nil
		local current_node_key = self._run_state:get_current_node_key()
		local current_node = self._path_graph[current_node_key]

		if current_node.node_type == "ingame" then
			progress = current_node.run_progress
		else
			local traversed_nodes = self._run_state:get_traversed_nodes()

			for i = #traversed_nodes, 1, -1 do
				local node = self._path_graph[traversed_nodes[i]]

				if node.node_type == "ingame" then
					progress = node.run_progress

					break
				end
			end
		end

		progress = progress or 0
		local extra_coins = DeusNewLoadoutSettings.coin_formula(progress)
		local new_coins = extra_coins + initial_own_soft_currency

		self._run_state:set_player_soft_currency(sender, REAL_PLAYER_LOCAL_ID, new_coins)
		self._run_state:set_peer_initialized(sender, true)
		self:_add_coin_tracking_entry(sender, REAL_PLAYER_LOCAL_ID, new_coins, "set initial soft currency")
	end
end

DeusRunController.rpc_deus_set_initial_setup = function (self, sender_channel_id, profile_index, career_index, initial_talents_for_career, melee_item_string, ranged_item_string)
	local sender = CHANNEL_TO_PEER_ID[sender_channel_id]

	if not self._run_state:get_profile_initialized(sender, REAL_PLAYER_LOCAL_ID, profile_index, career_index) then
		self:_add_initial_talents_as_power_ups(sender, REAL_PLAYER_LOCAL_ID, profile_index, career_index, initial_talents_for_career)
		self:_add_initial_weapons_to_loadout(sender, REAL_PLAYER_LOCAL_ID, profile_index, career_index, melee_item_string, ranged_item_string)
		self._run_state:set_profile_initialized(sender, REAL_PLAYER_LOCAL_ID, profile_index, career_index, true)
	end
end

DeusRunController.profile_changed = function (self, peer_id, local_player_id, profile_index, career_index)
	if self._run_state:get_own_peer_id() ~= peer_id then
		return
	end

	if self._run_state:get_profile_initialized(peer_id, local_player_id, profile_index, career_index) then
		return
	end

	local initial_talents = self._run_state:get_own_initial_talents()
	local profile = SPProfiles[profile_index]
	local career_name = profile.careers[career_index].name
	local initial_talents_for_career = initial_talents[career_name]
	local initial_loadout = self._run_state:get_own_initial_loadout()
	local initial_loadout_for_career = initial_loadout[career_name]
	local melee_item = initial_loadout_for_career.slot_melee
	local ranged_item = initial_loadout_for_career.slot_ranged
	local melee_item_string = DeusWeaponGeneration.serialize_weapon(melee_item)
	local ranged_item_string = DeusWeaponGeneration.serialize_weapon(ranged_item)

	self:_add_initial_talents_as_power_ups(peer_id, local_player_id, profile_index, career_index, initial_talents_for_career)
	self:_add_initial_weapons_to_loadout(peer_id, local_player_id, profile_index, career_index, melee_item_string, ranged_item_string)

	if self._run_state:is_server() then
		fassert(profile_index ~= 0, "the host must have a profile assigned already")
		self._run_state:set_profile_initialized(peer_id, local_player_id, profile_index, career_index, true)
	else
		local server_peer_id = self._run_state:get_server_peer_id()
		local server_channel_id = PEER_ID_TO_CHANNEL[server_peer_id]

		RPC.rpc_deus_set_initial_setup(server_channel_id, profile_index, career_index, initial_talents_for_career, melee_item_string, ranged_item_string)
	end
end

DeusRunController._add_initial_talents_as_power_ups = function (self, peer_id, local_player_id, profile_index, career_index, initial_talents_for_career)
	local talent_power_ups = {}

	for tier = 1, #initial_talents_for_career, 1 do
		local column = initial_talents_for_career[tier]

		if column ~= 0 then
			local power_up, rarity = DeusPowerUpUtils.get_talent_power_up_from_tier_and_column(tier, column)
			talent_power_ups[#talent_power_ups + 1] = DeusPowerUpUtils.generate_specific_power_up(power_up.name, rarity)
		end
	end

	local existing_power_ups = self._run_state:get_player_power_ups(peer_id, local_player_id, profile_index, career_index)
	local skip_metatable = true
	local new_power_ups = table.clone(existing_power_ups, skip_metatable)

	table.append(new_power_ups, talent_power_ups)
	self._run_state:set_player_power_ups(peer_id, local_player_id, profile_index, career_index, new_power_ups)
end

DeusRunController._add_initial_weapons_to_loadout = function (self, peer_id, local_player_id, profile_index, career_index, melee_item_string, ranged_item_string)
	self._run_state:set_player_loadout(peer_id, local_player_id, profile_index, career_index, "slot_melee", melee_item_string)
	self._run_state:set_player_loadout(peer_id, local_player_id, profile_index, career_index, "slot_ranged", ranged_item_string)
end

DeusRunController.get_run_id = function (self)
	return self._run_state:get_run_id()
end

DeusRunController.get_run_seed = function (self)
	return self._run_state:get_run_seed()
end

DeusRunController.get_run_difficulty = function (self)
	return self._run_state:get_run_difficulty()
end

DeusRunController.get_journey_name = function (self)
	return self._run_state:get_journey_name()
end

DeusRunController.get_dominant_god = function (self)
	return self._run_state:get_dominant_god()
end

DeusRunController.handle_level_won = function (self)
	self:_blessings_handle_level_won()

	local completed_level_count = self._run_state:get_completed_level_count()
	completed_level_count = completed_level_count + 1

	self._run_state:set_completed_level_count(completed_level_count)

	local traversed_nodes = self._run_state:get_traversed_nodes()
	local current_node_key = self._run_state:get_current_node_key()
	local skip_metatable = true
	traversed_nodes = table.clone(traversed_nodes, skip_metatable)
	traversed_nodes[#traversed_nodes + 1] = current_node_key

	self._run_state:set_traversed_nodes(traversed_nodes)

	local current_node = self._path_graph[current_node_key]

	if current_node.curse then
		local peers = self._network_handler:get_peers()

		for _, peer in ipairs(peers) do
			local cursed_nodes_completed = self._run_state:get_cursed_levels_completed(peer)
			cursed_nodes_completed = cursed_nodes_completed + 1

			self._run_state:set_cursed_levels_completed(peer, cursed_nodes_completed)
		end
	end
end

DeusRunController.has_completed_current_node = function (self)
	local current_node_key = self._run_state:get_current_node_key()

	if current_node_key == "start" then
		return false
	else
		local traversed_nodes = self._run_state:get_traversed_nodes()

		return table.contains(traversed_nodes, current_node_key)
	end
end

DeusRunController.handle_shrine_completed = function (self)
	local traversed_nodes = self._run_state:get_traversed_nodes()
	local current_node_key = self._run_state:get_current_node_key()
	local skip_metatable = true
	traversed_nodes = table.clone(traversed_nodes, skip_metatable)
	traversed_nodes[#traversed_nodes + 1] = current_node_key

	self._run_state:set_traversed_nodes(traversed_nodes)
end

DeusRunController.get_traversed_nodes = function (self)
	return self._run_state:get_traversed_nodes() or {}
end

DeusRunController.get_unreachable_nodes = function (self)
	local current_node_key = self:get_current_node_key()
	local reachable_nodes = {
		[current_node_key] = true
	}
	local traversed_nodes = self._run_state:get_traversed_nodes()

	for _, traversed_node_key in ipairs(traversed_nodes) do
		reachable_nodes[traversed_node_key] = true
	end

	local graph_data = self._path_graph

	local function add_to_reachable_from(node_key)
		local node = graph_data[node_key]

		for _, next_node_key in ipairs(node.next) do
			reachable_nodes[next_node_key] = true

			add_to_reachable_from(next_node_key)
		end
	end

	add_to_reachable_from(current_node_key)

	local unreachable_nodes = {}

	for node_key, _ in pairs(graph_data) do
		if not reachable_nodes[node_key] then
			unreachable_nodes[#unreachable_nodes + 1] = node_key
		end
	end

	return unreachable_nodes
end

DeusRunController.get_visited_nodes = function (self)
	local traversed_nodes = self:get_traversed_nodes()
	local current_node_key = self:get_current_node_key()
	local skip_metatable = true
	local visited_nodes = table.clone(traversed_nodes, skip_metatable)

	if not table.contains(visited_nodes, current_node_key) then
		table.insert(visited_nodes, current_node_key)
	end

	return visited_nodes
end

DeusRunController.get_completed_level_count = function (self)
	return self._run_state:get_completed_level_count()
end

DeusRunController.get_map_visibility = function (self)
	local graph_data = self._path_graph
	local current_node_key = self._run_state:get_current_node_key()
	local traversed_nodes = self._run_state:get_traversed_nodes() or {}
	local level_data = {}

	for node_key, _ in pairs(graph_data) do
		level_data[node_key] = DeusMapVisibilitySettings.STRONG_FOG_LEVEL
	end

	local function spread_from_node(node_key)
		level_data[node_key] = DeusMapVisibilitySettings.WEAK_FOG_LEVEL

		local function spread_level_reduction(nested_node_key, levels_to_go)
			if DeusMapVisibilitySettings.STRONG_FOG_LEVEL < levels_to_go then
				return
			end

			level_data[nested_node_key] = math.min(level_data[nested_node_key], levels_to_go)

			for _, next_node_key in ipairs(graph_data[nested_node_key].next) do
				spread_level_reduction(next_node_key, levels_to_go + 1)
			end
		end

		for _, next_node_key in ipairs(graph_data[node_key].next) do
			spread_level_reduction(next_node_key, DeusMapVisibilitySettings.WEAK_FOG_LEVEL)
		end
	end

	spread_from_node(current_node_key)

	if script_data.deus_fog_with_no_memory then
		for _, traversed_node_key in ipairs(traversed_nodes) do
			level_data[traversed_node_key] = DeusMapVisibilitySettings.WEAK_FOG_LEVEL
		end

		level_data.start = DeusMapVisibilitySettings.WEAK_FOG_LEVEL
	else
		for _, traversed_node_key in ipairs(traversed_nodes) do
			spread_from_node(traversed_node_key)
		end

		spread_from_node("start")
	end

	level_data.final = 0

	return level_data
end

DeusRunController.get_end_of_level_rewards_arguments = function (self, game_won, quickplay)
	local completed_level_count = self._run_state:get_completed_level_count()
	local own_peer_id = self._run_state:get_own_peer_id()
	local soft_currency = self._run_state:get_player_soft_currency(own_peer_id, REAL_PLAYER_LOCAL_ID)
	local current_node_key = self._run_state:get_current_node_key()
	local current_node = self._path_graph[current_node_key]
	local run_progress = current_node.run_progress
	local difficulty = self._run_state:get_run_difficulty()
	local loot_chest_name = loot_chest_rewards[difficulty][1]
	local loot_chest_num = loot_chest_rewards[difficulty][2]

	return {
		deus_completed_level_count = completed_level_count,
		deus_soft_currency = soft_currency,
		deus_item_name = loot_chest_name,
		deus_num_duplicates = loot_chest_num,
		chest_upgrade_data = {
			quickplay = quickplay,
			game_won = game_won,
			cursed_chests_purified = self._run_state:get_cursed_chests_purified(own_peer_id),
			cursed_levels_completed = self._run_state:get_cursed_levels_completed(own_peer_id),
			coin_chests_collected = self._run_state:get_coin_chests_collected(own_peer_id),
			run_progress = run_progress
		}
	}
end

DeusRunController.get_mission_results = function (self)
	local mission_results = {}
	local peer_id = self._run_state:get_own_peer_id()
	mission_results[#mission_results + 1] = {
		text = "deus_cursed_chests_purified",
		experience = self._run_state:get_cursed_chests_purified(peer_id) * DeusExperienceSettings.CURSED_CHESTS
	}
	mission_results[#mission_results + 1] = {
		text = "deus_cursed_levels_beaten",
		experience = self._run_state:get_cursed_levels_completed(peer_id) * DeusExperienceSettings.CURSES
	}
	mission_results[#mission_results + 1] = {
		text = "deus_coin_chests_collected",
		experience = self._run_state:get_coin_chests_collected(peer_id) * DeusExperienceSettings.COINS
	}

	return mission_results
end

DeusRunController.record_cursed_chest_purified = function (self)
	local peers = self._network_handler:get_peers()

	for _, peer in ipairs(peers) do
		local cursed_chests_purified = self._run_state:get_cursed_chests_purified(peer)
		cursed_chests_purified = cursed_chests_purified + 1

		self._run_state:set_cursed_chests_purified(peer, cursed_chests_purified)
	end
end

DeusRunController.save_persisted_score = function (self, statistics_db, peer_id, local_player_id)
	local stats_id = PlayerUtils.unique_player_id(peer_id, local_player_id)
	local saved_data = {}

	for index, stat_type in ipairs(stats_to_save) do
		if statistics_db:has_stat(stats_id, unpack(stat_type)) then
			saved_data[index] = statistics_db:get_stat(stats_id, unpack(stat_type))
		else
			saved_data[index] = 0
		end
	end

	self._run_state:set_persisted_score(peer_id, local_player_id, saved_data)
end

DeusRunController.restore_persisted_score = function (self, statistics_db, peer_id, local_player_id)
	local stats_id = PlayerUtils.unique_player_id(peer_id, local_player_id)
	local persisted_score = self._run_state:get_persisted_score(peer_id, local_player_id)

	for index, stat_type in ipairs(stats_to_save) do
		local value = persisted_score[index]
		local args = table.clone(stat_type)
		args[#args + 1] = value or 0

		statistics_db:set_non_persistent_stat(stats_id, unpack(args))
	end
end

DeusRunController.save_scoreboard = function (self, scoreboard)
	self._run_state:set_scoreboard(scoreboard)
end

DeusRunController.get_scoreboard = function (self)
	return self._run_state:get_scoreboard()
end

DeusRunController.get_own_peer_id = function (self)
	return self._run_state:get_own_peer_id()
end

DeusRunController.get_server_peer_id = function (self)
	return self._run_state:get_server_peer_id()
end

DeusRunController.get_peers = function (self)
	return self._network_handler:get_peers()
end

DeusRunController.set_own_player_avatar_info = function (self, level, name, frame)
	self._run_state:set_own_player_level(level)
	self._run_state:set_own_player_frame(frame)
	self._run_state:set_own_player_name(name)
end

DeusRunController.get_own_loadout = function (self)
	local local_peer_id = self._run_state:get_own_peer_id()
	local profile_index, career_index = self._run_state:get_player_profile(local_peer_id, REAL_PLAYER_LOCAL_ID)

	if self._destroyed then
		local profile = SPProfiles[profile_index]
		local career_name = profile.careers[career_index].name
		local initial_loadout = self._run_state:get_own_initial_loadout()
		local initial_loadout_for_career = initial_loadout[career_name]
		local melee_item = initial_loadout_for_career.slot_melee
		local ranged_item = initial_loadout_for_career.slot_ranged

		return melee_item, ranged_item
	else
		local melee_item_string = self._run_state:get_player_loadout(local_peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index, "slot_melee")
		local ranged_item_string = self._run_state:get_player_loadout(local_peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index, "slot_ranged")
		local melee_item = DeusWeaponGeneration.deserialize_weapon(melee_item_string)
		local ranged_item = DeusWeaponGeneration.deserialize_weapon(ranged_item_string)

		return melee_item, ranged_item
	end
end

DeusRunController.get_loadout = function (self, peer_id, local_player_id, profile_index, career_index)
	local melee_item_string = self._run_state:get_player_loadout(peer_id, local_player_id, profile_index, career_index, "slot_melee")
	local ranged_item_string = self._run_state:get_player_loadout(peer_id, local_player_id, profile_index, career_index, "slot_ranged")
	local melee_item = melee_item_string and DeusWeaponGeneration.deserialize_weapon(melee_item_string)
	local ranged_item = ranged_item_string and DeusWeaponGeneration.deserialize_weapon(ranged_item_string)

	return melee_item, ranged_item
end

DeusRunController.save_loadout = function (self, item, slot_name)
	local local_peer_id = self._run_state:get_own_peer_id()
	local profile_index, career_index = self._run_state:get_player_profile(local_peer_id, REAL_PLAYER_LOCAL_ID)
	local item_string = DeusWeaponGeneration.serialize_weapon(item)

	self._run_state:set_player_loadout(local_peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index, slot_name, item_string)

	if not self._run_state:is_server() then
		local server_peer_id = self._run_state:get_server_peer_id()
		local server_channel_id = PEER_ID_TO_CHANNEL[server_peer_id]

		RPC.rpc_deus_save_loadout(server_channel_id, slot_name, item_string)
	end
end

DeusRunController.rpc_deus_save_loadout = function (self, sender_channel_id, slot_name, item_string)
	local sender = CHANNEL_TO_PEER_ID[sender_channel_id]
	local profile_index, career_index = self._run_state:get_player_profile(sender, REAL_PLAYER_LOCAL_ID)

	self._run_state:set_player_loadout(sender, REAL_PLAYER_LOCAL_ID, profile_index, career_index, slot_name, item_string)
end

DeusRunController.on_soft_currency_picked_up = function (self, amount, type)
	local own_peer_id = self._run_state:get_own_peer_id()

	self:_add_soft_currency_to_peer(own_peer_id, amount)

	if not self._run_state:is_server() then
		local server_peer_id = self._run_state:get_server_peer_id()
		local server_channel_id = PEER_ID_TO_CHANNEL[server_peer_id]

		RPC.rpc_deus_soft_currency_picked_up(server_channel_id, amount, type)
	elseif type == DeusSoftCurrencySettings.types.GROUND then
		local ground_coins_picked_up = self._run_state:get_ground_coins_picked_up()
		ground_coins_picked_up = ground_coins_picked_up + 1

		self._run_state:set_ground_coins_picked_up(ground_coins_picked_up)
	elseif type == DeusSoftCurrencySettings.types.MONSTER then
		local monster_coins_picked_up = self._run_state:get_monster_coins_picked_up()
		monster_coins_picked_up = monster_coins_picked_up + 1

		self._run_state:set_monster_coins_picked_up(monster_coins_picked_up)
	end
end

DeusRunController.get_player_soft_currency = function (self, peer_id)
	return self._run_state:get_player_soft_currency(peer_id, REAL_PLAYER_LOCAL_ID)
end

DeusRunController.rpc_deus_soft_currency_picked_up = function (self, sender_channel_id, amount, type)
	local sender = CHANNEL_TO_PEER_ID[sender_channel_id]

	self:_add_soft_currency_to_peer(sender, amount)
end

DeusRunController._add_soft_currency_to_peer = function (self, peer_id, amount)
	local coin_chests_collected = self._run_state:get_coin_chests_collected(peer_id)
	coin_chests_collected = coin_chests_collected + 1

	self._run_state:set_coin_chests_collected(peer_id, coin_chests_collected)

	local coins = self._run_state:get_player_soft_currency(peer_id, REAL_PLAYER_LOCAL_ID)
	local new_coins = coins + amount

	self._run_state:set_player_soft_currency(peer_id, REAL_PLAYER_LOCAL_ID, new_coins)
	self:_add_coin_tracking_entry(peer_id, REAL_PLAYER_LOCAL_ID, amount, "add coins")
end

DeusRunController.get_shop_heal_data = function (self)
	local local_peer_id = self._run_state:get_own_peer_id()
	local profile_index, career_index = self._run_state:get_player_profile(local_peer_id, REAL_PLAYER_LOCAL_ID)
	local current_health = self._run_state:get_player_health_percentage(local_peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index)
	local current_coins = self._run_state:get_player_soft_currency(local_peer_id, REAL_PLAYER_LOCAL_ID)
	local heal_amount = DeusShopSettings.heal_amount
	local heal_cost = DeusShopSettings.heal_cost
	heal_amount, heal_cost = calculate_next_shop_heal(current_health, current_coins, heal_amount, heal_cost)

	return heal_amount, heal_cost
end

DeusRunController.shop_buy_health = function (self)
	local local_peer_id = self._run_state:get_own_peer_id()
	local success = self:_try_buy_health(local_peer_id)

	if success and not self._run_state:is_server() then
		local server_peer_id = self._run_state:get_server_peer_id()
		local server_channel_id = PEER_ID_TO_CHANNEL[server_peer_id]

		RPC.rpc_deus_shop_heal_player(server_channel_id)
	end
end

DeusRunController.shop_buy_blessing = function (self, blessing_name)
	local success = self:_try_buy_blessing(self._run_state:get_own_peer_id(), blessing_name)

	if success and not self._run_state:is_server() then
		local server_peer_id = self._run_state:get_server_peer_id()
		local server_channel_id = PEER_ID_TO_CHANNEL[server_peer_id]

		RPC.rpc_deus_shop_blessing_selected(server_channel_id, blessing_name)
	end
end

DeusRunController.shop_buy_power_up = function (self, power_up, discount)
	local success = self:_try_buy_power_up(self._run_state:get_own_peer_id(), power_up, discount)

	if success and not self._run_state:is_server() then
		local server_peer_id = self._run_state:get_server_peer_id()
		local server_channel_id = PEER_ID_TO_CHANNEL[server_peer_id]

		RPC.rpc_deus_shop_power_up_bought(server_channel_id, power_up.rarity, power_up.name, power_up.client_id, math.round(discount * DISCOUNT_CONVERSION_EPSILON))
	end
end

DeusRunController._try_buy_health = function (self, peer_id)
	local profile_index, career_index = self._run_state:get_player_profile(peer_id, REAL_PLAYER_LOCAL_ID)
	local current_health = self._run_state:get_player_health_percentage(peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index)
	local current_coins = self._run_state:get_player_soft_currency(peer_id, REAL_PLAYER_LOCAL_ID)

	if current_health < 1 then
		local heal_amount = DeusShopSettings.heal_amount
		local heal_cost = DeusShopSettings.heal_cost
		heal_amount, heal_cost = calculate_next_shop_heal(current_health, current_coins, heal_amount, heal_cost)

		if heal_cost <= current_coins then
			local new_health = math.clamp(current_health + heal_amount, 0, 1)

			self._run_state:set_player_soft_currency(peer_id, REAL_PLAYER_LOCAL_ID, current_coins - heal_cost)
			self._run_state:set_player_health_percentage(peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index, new_health)
			self:_add_coin_tracking_entry(peer_id, REAL_PLAYER_LOCAL_ID, -heal_cost, "health")

			return true
		end
	end

	return false
end

DeusRunController.rpc_deus_shop_heal_player = function (self, sender_channel_id)
	local sender = CHANNEL_TO_PEER_ID[sender_channel_id]
	local success = self:_try_buy_health(sender)

	if not success then
		local profile_index, career_index = self._run_state:get_player_profile(sender, REAL_PLAYER_LOCAL_ID)
		local current_health = self._run_state:get_player_health_percentage(sender, REAL_PLAYER_LOCAL_ID, profile_index, career_index)
		local current_coins = self._run_state:get_player_soft_currency(sender, REAL_PLAYER_LOCAL_ID)

		self._run_state:set_player_soft_currency(sender, REAL_PLAYER_LOCAL_ID, current_coins)
		self._run_state:set_player_health_percentage(sender, REAL_PLAYER_LOCAL_ID, profile_index, career_index, current_health)
	end
end

DeusRunController.rpc_deus_shop_blessing_selected = function (self, sender_channel_id, blessing_name)
	local sender = CHANNEL_TO_PEER_ID[sender_channel_id]
	local success = self:_try_buy_blessing(sender, blessing_name)

	if not success then
		local blessings_with_buyer = self._run_state:get_blessings_with_buyer()
		local current_coins = self._run_state:get_player_soft_currency(sender, REAL_PLAYER_LOCAL_ID)

		self._run_state:set_blessings_with_buyer(blessings_with_buyer)
		self._run_state:set_player_soft_currency(sender, REAL_PLAYER_LOCAL_ID, current_coins)
	end
end

DeusRunController.rpc_deus_shop_power_up_bought = function (self, sender_channel_id, rarity, power_up_name, power_up_client_id, discount)
	local sender = CHANNEL_TO_PEER_ID[sender_channel_id]
	discount = discount / DISCOUNT_CONVERSION_EPSILON
	local power_up = DeusPowerUps[rarity][power_up_name]
	power_up.client_id = power_up_client_id
	local success = self:_try_buy_power_up(sender, power_up, discount)

	if not success then
		local profile_index, career_index = self._run_state:get_player_profile(sender, REAL_PLAYER_LOCAL_ID)
		local power_ups = self._run_state:get_player_power_ups(sender, REAL_PLAYER_LOCAL_ID, profile_index, career_index)
		local current_coins = self._run_state:get_player_soft_currency(sender, REAL_PLAYER_LOCAL_ID)

		self._run_state:set_player_power_ups(sender, REAL_PLAYER_LOCAL_ID, profile_index, career_index, power_ups)
		self._run_state:set_player_soft_currency(sender, REAL_PLAYER_LOCAL_ID, current_coins)
	end
end

DeusRunController.get_player_power_ups = function (self, peer_id, local_player_id)
	local profile_index, career_index = self._run_state:get_player_profile(peer_id, local_player_id)
	local power_ups = self._run_state:get_player_power_ups(peer_id, local_player_id, profile_index, career_index)

	return power_ups
end

DeusRunController.get_power_ups = function (self, peer_id, local_player_id, profile_index, career_index)
	local power_ups = self._run_state:get_player_power_ups(peer_id, local_player_id, profile_index, career_index)

	return power_ups
end

DeusRunController.get_party_power_ups = function (self)
	local power_ups = self._run_state:get_party_power_ups()

	return power_ups
end

DeusRunController.generate_random_power_ups = function (self, count, availability_type, extra_seed)
	extra_seed = extra_seed or "0"
	local local_peer_id = self._run_state:get_own_peer_id()
	local current_node_key = self._run_state:get_current_node_key()
	local current_node = self._path_graph[current_node_key]
	local node_power_up_seed = current_node.system_seeds.power_ups or 0
	local power_up_seed = HashUtils.fnv32_hash(extra_seed .. "_" .. local_peer_id .. "_" .. node_power_up_seed)
	local run_progress = current_node.run_progress
	local profile_index, career_index = self._run_state:get_player_profile(local_peer_id, REAL_PLAYER_LOCAL_ID)
	local existing_power_ups = self._run_state:get_player_power_ups(local_peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index)
	local profile = SPProfiles[profile_index]
	local career_name = profile.careers[career_index].name
	local new_power_ups = nil
	power_up_seed, new_power_ups = DeusPowerUpUtils.generate_random_power_ups(power_up_seed, count, existing_power_ups, self._run_state:get_run_difficulty(), run_progress, availability_type, career_name)

	return new_power_ups
end

DeusRunController.add_power_ups = function (self, new_power_ups, local_player_id)
	if #new_power_ups == 0 then
		return
	end

	fassert(local_player_id, "Invalid local_player_id")

	local local_peer_id = self._run_state:get_own_peer_id()
	local profile_index, career_index = self._run_state:get_player_profile(local_peer_id, local_player_id)
	local power_ups = self._run_state:get_player_power_ups(local_peer_id, local_player_id, profile_index, career_index)
	local skip_metatable = true
	power_ups = table.clone(power_ups, skip_metatable)

	table.append(power_ups, new_power_ups)
	self._run_state:set_player_power_ups(local_peer_id, local_player_id, profile_index, career_index, power_ups)

	if not self._run_state:is_server() then
		local new_power_ups_string = DeusPowerUpUtils.power_ups_to_string(new_power_ups)
		local server_peer_id = self._run_state:get_server_peer_id()
		local server_channel_id = PEER_ID_TO_CHANNEL[server_peer_id]

		RPC.rpc_deus_add_power_ups(server_channel_id, new_power_ups_string)
	end
end

DeusRunController.try_grant_end_of_level_deus_power_up = function (self)
	local current_node_key = self:get_current_node_key()
	local current_node = self._path_graph[current_node_key]
	local power_up_name = current_node.terror_event_power_up
	local power_up_rarity = current_node.terror_event_power_up_rarity

	if power_up_name then
		local power_up = DeusPowerUpUtils.generate_specific_power_up(power_up_name, power_up_rarity)
		local party_power_ups = self._run_state:get_party_power_ups()
		local skip_metatable = true
		party_power_ups = table.clone(party_power_ups, skip_metatable)
		party_power_ups[#party_power_ups + 1] = power_up

		self._run_state:set_party_power_ups(party_power_ups)

		return power_up
	end
end

DeusRunController.rpc_deus_add_power_ups = function (self, sender_channel_id, power_ups_string)
	local sender = CHANNEL_TO_PEER_ID[sender_channel_id]
	local new_power_ups = DeusPowerUpUtils.string_to_power_ups(power_ups_string)
	local profile_index, career_index = self._run_state:get_player_profile(sender, REAL_PLAYER_LOCAL_ID)
	local power_ups = self._run_state:get_player_power_ups(sender, REAL_PLAYER_LOCAL_ID, profile_index, career_index)
	local skip_metatable = true
	power_ups = table.clone(power_ups, skip_metatable)

	table.append(new_power_ups, power_ups)
	self._run_state:set_player_power_ups(sender, REAL_PLAYER_LOCAL_ID, profile_index, career_index, new_power_ups)
end

DeusRunController.get_blessings = function (self)
	return self._run_state:get_blessings()
end

DeusRunController.get_blessings_with_buyer = function (self)
	return self._run_state:get_blessings_with_buyer()
end

DeusRunController.has_blessing = function (self, blessing_name)
	local blessings = self._run_state:get_blessings()

	return table.contains(blessings, blessing_name)
end

DeusRunController.generate_random_blessing_name = function (self)
	local random_blessing_name = nil
	local blessing_keys = {}
	local current_node_key = self._run_state:get_current_node_key()
	local current_node = self._path_graph[current_node_key]
	local seed = current_node.system_seeds.blessings or 0
	local blessing_settings = DeusBlessingSettings
	local blessings = self._run_state:get_blessings()

	for blessing_name, _ in pairs(blessing_settings) do
		if not table.contains(blessings, blessing_name) then
			table.insert(blessing_keys, blessing_name)
		end
	end

	if #blessing_keys > 0 then
		local _, random_blessing_index = Math.next_random(seed, 1, #blessing_keys)
		random_blessing_name = blessing_keys[random_blessing_index]
	end

	return random_blessing_name
end

DeusRunController.remove_blessing = function (self, blessing_to_remove)
	local blessings_with_buyer = self._run_state:get_blessings_with_buyer()
	local skip_metatable = true
	blessings_with_buyer = table.clone(blessings_with_buyer, skip_metatable)

	for blessing_name, _ in pairs(blessings_with_buyer) do
		if blessing_to_remove == blessing_name then
			blessings_with_buyer[blessing_name] = nil
		end
	end

	self._run_state:set_blessings_with_buyer(blessings_with_buyer)
end

DeusRunController.has_power_up = function (self, peer_id, power_up_client_id)
	local profile_index, career_index = self._run_state:get_player_profile(peer_id, REAL_PLAYER_LOCAL_ID)
	local power_ups = self._run_state:get_player_power_ups(peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index)

	for _, power_up in ipairs(power_ups) do
		if power_up.client_id == power_up_client_id then
			return true
		end
	end

	return false
end

DeusRunController.reached_max_power_ups = function (self, peer_id, power_up_name)
	local profile_index, career_index = self._run_state:get_player_profile(peer_id, REAL_PLAYER_LOCAL_ID)
	local power_ups = self._run_state:get_player_power_ups(peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index)
	local max_amount = DeusPowerUpTemplates[power_up_name].max_amount
	local amount = 0

	for _, power_up in ipairs(power_ups) do
		if power_up.name == power_up_name then
			amount = amount + 1

			if max_amount <= amount then
				return true
			end
		end
	end

	return false
end

DeusRunController._blessings_handle_level_won = function (self)
	local blessings_with_buyer = self._run_state:get_blessings_with_buyer()
	local new_blessings = {}

	for blessing_name, buyer in pairs(blessings_with_buyer) do
		local blessing_data = DeusBlessingSettings[blessing_name]
		local is_active = true

		if not blessing_data.is_permanent then
			local lifetime = self._run_state:get_blessing_lifetime(blessing_name)
			lifetime = lifetime - 1

			self._run_state:set_blessing_lifetime(blessing_name, lifetime)

			if lifetime <= 0 then
				is_active = false
			end
		end

		if is_active then
			new_blessings[blessing_name] = buyer
		end
	end

	self._run_state:set_blessings_with_buyer(new_blessings)
end

DeusRunController._try_buy_blessing = function (self, buyer, blessing_name)
	local blessing_data = DeusBlessingSettings[blessing_name]

	fassert(blessing_data, "No blessing with the name [%s] was found, check the blessings settings", blessing_name)

	if self:has_blessing(blessing_name) then
		return false
	end

	local current_coins = self._run_state:get_player_soft_currency(buyer, REAL_PLAYER_LOCAL_ID)
	local blessing_cost = DeusCostSettings.shop.blessings[blessing_name]

	if current_coins < blessing_cost then
		return false
	end

	if blessing_data.grant_item then
		local grant_item = blessing_data.grant_item
		local item_name = grant_item.item_name
		local slot_name = grant_item.slot_name
		local profile_index, career_index = self._run_state:get_player_profile(buyer, REAL_PLAYER_LOCAL_ID)
		local additional_items = self._run_state:get_player_additional_items(buyer, REAL_PLAYER_LOCAL_ID, profile_index, career_index)

		local function can_add_additional_items()
			local profile = SPProfiles[profile_index]
			local career_name = profile.careers[career_index].name
			local career_data = CareerSettings[career_name]
			local additional_item_slots = career_data and career_data.additional_item_slots

			if additional_item_slots then
				local slot_count = additional_item_slots[slot_name]

				if slot_count then
					local current_item_count = (additional_items[slot_name] and #additional_items[slot_name].items) or 0

					return slot_count > current_item_count
				else
					return false
				end
			else
				return false
			end
		end

		local function add_to_additional_items()
			additional_items = table.clone(additional_items)

			if not additional_items[slot_name] then
				local slot_additional_items = {
					items = {}
				}
			end

			slot_additional_items.items[#slot_additional_items.items + 1] = ItemMasterList[item_name]
			additional_items[slot_name] = slot_additional_items

			self._run_state:set_player_additional_items(buyer, REAL_PLAYER_LOCAL_ID, profile_index, career_index, additional_items)
		end

		if slot_name == "slot_grenade" then
			local current_grenade = self._run_state:get_player_consumable_grenade_slot(buyer, REAL_PLAYER_LOCAL_ID, profile_index, career_index)

			if not current_grenade or not can_add_additional_items() then
				self._run_state:set_player_consumable_grenade_slot(buyer, REAL_PLAYER_LOCAL_ID, profile_index, career_index, item_name)
			else
				add_to_additional_items()
			end
		elseif slot_name == "slot_potion" then
			self._run_state:set_player_consumable_potion_slot(buyer, REAL_PLAYER_LOCAL_ID, profile_index, career_index, item_name)

			local current_potion = self._run_state:get_player_consumable_potion_slot(buyer, REAL_PLAYER_LOCAL_ID, profile_index, career_index)

			if not current_potion or not can_add_additional_items() then
				self._run_state:set_player_consumable_potion_slot(buyer, REAL_PLAYER_LOCAL_ID, profile_index, career_index, item_name)
			else
				add_to_additional_items()
			end
		elseif slot_name == "slot_healthkit" then
			self._run_state:set_player_consumable_healthkit_slot(buyer, REAL_PLAYER_LOCAL_ID, profile_index, career_index, item_name)

			local current_healthkit = self._run_state:get_player_consumable_healthkit_slot(buyer, REAL_PLAYER_LOCAL_ID, profile_index, career_index)

			if not current_healthkit or not can_add_additional_items() then
				self._run_state:set_player_consumable_healthkit_slot(buyer, REAL_PLAYER_LOCAL_ID, profile_index, career_index, item_name)
			else
				add_to_additional_items()
			end
		end
	elseif blessing_data.improve_all_weapons then
		local power_level_table = blessing_data.improve_all_weapons
		local difficulty = self._run_state:get_run_difficulty()
		local difficulty_settings = DifficultySettings[difficulty]
		local difficulty_rank = difficulty_settings.rank
		local power_level = power_level_table[difficulty_rank] or power_level_table[DifficultySettings.normal.rank]
		local peers = self._network_handler:get_peers()

		for i = 1, #peers, 1 do
			local peer_id = peers[i]
			local profile_index, career_index = self._run_state:get_player_profile(peer_id, REAL_PLAYER_LOCAL_ID)
			local melee_item_string = self._run_state:get_player_loadout(peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index, "slot_melee")
			local ranged_item_string = self._run_state:get_player_loadout(peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index, "slot_ranged")

			if melee_item_string then
				local melee_item = DeusWeaponGeneration.deserialize_weapon(melee_item_string)
				melee_item.power_level = melee_item.power_level + power_level
				melee_item_string = DeusWeaponGeneration.serialize_weapon(melee_item)

				self._run_state:set_player_loadout(peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index, "slot_melee", melee_item_string)
			end

			if ranged_item_string then
				local ranged_item = DeusWeaponGeneration.deserialize_weapon(ranged_item_string)
				ranged_item.power_level = ranged_item.power_level + power_level
				ranged_item_string = DeusWeaponGeneration.serialize_weapon(ranged_item)

				self._run_state:set_player_loadout(peer_id, REAL_PLAYER_LOCAL_ID, profile_index, career_index, "slot_ranged", ranged_item_string)
			end
		end
	end

	local blessings_with_buyer = self._run_state:get_blessings_with_buyer()
	local skip_metatable = true
	blessings_with_buyer = table.clone(blessings_with_buyer, skip_metatable)
	blessings_with_buyer[blessing_name] = buyer

	self._run_state:set_blessings_with_buyer(blessings_with_buyer)
	self._run_state:set_player_soft_currency(buyer, REAL_PLAYER_LOCAL_ID, current_coins - blessing_cost)

	local bought_blessings = self._run_state:get_bought_blessings()
	bought_blessings = table.clone(bought_blessings, skip_metatable)
	bought_blessings[#bought_blessings + 1] = blessing_name

	self._run_state:set_bought_blessings(bought_blessings)
	self:_add_coin_tracking_entry(buyer, REAL_PLAYER_LOCAL_ID, -blessing_cost, "blessing")

	return true
end

DeusRunController._try_buy_power_up = function (self, buyer, power_up, discount)
	local has_power_up = self:has_power_up(buyer, power_up.client_id)

	if has_power_up then
		return false
	end

	local rarity = power_up.rarity
	local power_up_cost = DeusCostSettings.shop.power_ups[rarity]
	power_up_cost = power_up_cost - math.round(power_up_cost * discount)
	local profile_index, career_index = self._run_state:get_player_profile(buyer, REAL_PLAYER_LOCAL_ID)
	local current_coins = self._run_state:get_player_soft_currency(buyer, REAL_PLAYER_LOCAL_ID)

	if current_coins < power_up_cost then
		return false
	end

	local power_ups = self._run_state:get_player_power_ups(buyer, REAL_PLAYER_LOCAL_ID, profile_index, career_index)
	local skip_metatable = true
	power_ups = table.clone(power_ups, skip_metatable)

	table.insert(power_ups, power_up)
	self._run_state:set_player_power_ups(buyer, REAL_PLAYER_LOCAL_ID, profile_index, career_index, power_ups)

	local new_coins = current_coins - power_up_cost

	self._run_state:set_player_soft_currency(buyer, REAL_PLAYER_LOCAL_ID, new_coins)

	local tracking_event = (discount == 0 and rarity .. "_power_up") or rarity .. "_discounted_power_up"

	self:_add_coin_tracking_entry(buyer, REAL_PLAYER_LOCAL_ID, -power_up_cost, tracking_event)

	local bought_power_ups = self._run_state:get_bought_power_ups()
	bought_power_ups = table.clone(bought_power_ups, skip_metatable)
	bought_power_ups[#bought_power_ups + 1] = power_up.name

	self._run_state:set_bought_power_ups(bought_power_ups)

	return true
end

DeusRunController.get_player_profile = function (self, peer_id, local_player_id)
	local profile_index, career_index = self._run_state:get_player_profile(peer_id, local_player_id)

	return profile_index, career_index
end

DeusRunController.get_player_level = function (self, peer_id)
	return self._run_state:get_player_level(peer_id)
end

DeusRunController.get_player_name = function (self, peer_id)
	return self._run_state:get_player_name(peer_id)
end

DeusRunController.get_player_frame = function (self, peer_id)
	return self._run_state:get_player_frame(peer_id)
end

DeusRunController.get_player_health_state = function (self, peer_id, local_player_id)
	local profile_index, career_index = self._run_state:get_player_profile(peer_id, local_player_id)

	return self._run_state:get_player_health_state(peer_id, local_player_id, profile_index, career_index)
end

DeusRunController.get_player_health_percentage = function (self, peer_id, local_player_id)
	local profile_index, career_index = self._run_state:get_player_profile(peer_id, local_player_id)

	return self._run_state:get_player_health_percentage(peer_id, local_player_id, profile_index, career_index)
end

DeusRunController.get_player_melee_ammo = function (self, peer_id, local_player_id)
	local profile_index, career_index = self._run_state:get_player_profile(peer_id, local_player_id)

	return self._run_state:get_player_melee_ammo(peer_id, local_player_id, profile_index, career_index)
end

DeusRunController.get_player_ranged_ammo = function (self, peer_id, local_player_id)
	local profile_index, career_index = self._run_state:get_player_profile(peer_id, local_player_id)

	return self._run_state:get_player_ranged_ammo(peer_id, local_player_id, profile_index, career_index)
end

DeusRunController.get_player_health_percentage = function (self, peer_id, local_player_id)
	local profile_index, career_index = self._run_state:get_player_profile(peer_id, local_player_id)

	return self._run_state:get_player_health_percentage(peer_id, local_player_id, profile_index, career_index)
end

DeusRunController.get_player_consumable_healthkit_slot = function (self, peer_id, local_player_id)
	local profile_index, career_index = self._run_state:get_player_profile(peer_id, local_player_id)

	return self._run_state:get_player_consumable_healthkit_slot(peer_id, local_player_id, profile_index, career_index)
end

DeusRunController.get_player_consumable_potion_slot = function (self, peer_id, local_player_id)
	local profile_index, career_index = self._run_state:get_player_profile(peer_id, local_player_id)

	return self._run_state:get_player_consumable_potion_slot(peer_id, local_player_id, profile_index, career_index)
end

DeusRunController.get_player_consumable_grenade_slot = function (self, peer_id, local_player_id)
	local profile_index, career_index = self._run_state:get_player_profile(peer_id, local_player_id)

	return self._run_state:get_player_consumable_grenade_slot(peer_id, local_player_id, profile_index, career_index)
end

DeusRunController.get_player_persistent_buffs = function (self, peer_id, local_player_id)
	local profile_index, career_index = self._run_state:get_player_profile(peer_id, local_player_id)

	return self._run_state:get_player_persistent_buffs(peer_id, local_player_id, profile_index, career_index)
end

DeusRunController.restore_game_mode_data = function (self, peer_id, local_player_id, profile_index, career_index)
	local data = {}
	local spawned_once = self._run_state:get_player_spawned_once(peer_id, local_player_id, profile_index, career_index)

	if not spawned_once then
		data.health_state = "alive"
		data.health_percentage = 1
		data.ammo = {
			slot_ranged = 1,
			slot_melee = 1
		}
		data.consumables = {}
		data.additional_items = {}
		local difficulty = self._run_state:get_run_difficulty()
		local difficulty_settings = DifficultySettings[difficulty]
		data.consumables.slot_healthkit = difficulty_settings.slot_healthkit
		data.consumables.slot_potion = difficulty_settings.slot_potion
		data.consumables.slot_grenade = difficulty_settings.slot_grenade

		self._run_state:set_player_spawned_once(peer_id, local_player_id, profile_index, career_index, true)
	else
		data.health_state = self._run_state:get_player_health_state(peer_id, local_player_id, profile_index, career_index)
		data.health_percentage = self._run_state:get_player_health_percentage(peer_id, local_player_id, profile_index, career_index)
		data.ammo = {
			slot_melee = self._run_state:get_player_melee_ammo(peer_id, local_player_id, profile_index, career_index),
			slot_ranged = self._run_state:get_player_ranged_ammo(peer_id, local_player_id, profile_index, career_index)
		}
		data.consumables = {
			slot_healthkit = self._run_state:get_player_consumable_healthkit_slot(peer_id, local_player_id, profile_index, career_index),
			slot_potion = self._run_state:get_player_consumable_potion_slot(peer_id, local_player_id, profile_index, career_index),
			slot_grenade = self._run_state:get_player_consumable_grenade_slot(peer_id, local_player_id, profile_index, career_index)
		}
		local skip_metatable = true
		data.additional_items = table.clone(self._run_state:get_player_additional_items(peer_id, local_player_id, profile_index, career_index), skip_metatable)
	end

	return data
end

DeusRunController.save_game_mode_data = function (self, peer_id, local_player_id, profile_index, career_index, data)
	if self._destroyed then
		return
	end

	local existing_health_state = self._run_state:get_player_health_state(peer_id, local_player_id, profile_index, career_index)
	local new_health_state = data.health_state

	if existing_health_state ~= new_health_state then
		self._run_state:set_player_health_state(peer_id, local_player_id, profile_index, career_index, new_health_state)
	end

	local existing_health_percentage = self._run_state:get_player_health_percentage(peer_id, local_player_id, profile_index, career_index)
	local new_health_percentage = data.health_percentage

	if not low_precision_float_comparison(existing_health_percentage, new_health_percentage) then
		self._run_state:set_player_health_percentage(peer_id, local_player_id, profile_index, career_index, new_health_percentage)
	end

	local existing_melee_ammo = self._run_state:get_player_melee_ammo(peer_id, local_player_id, profile_index, career_index)
	local new_melee_ammo = data.ammo.slot_melee

	if not low_precision_float_comparison(existing_melee_ammo, new_melee_ammo) then
		self._run_state:set_player_melee_ammo(peer_id, local_player_id, profile_index, career_index, new_melee_ammo)
	end

	local existing_ranged_ammo = self._run_state:get_player_ranged_ammo(peer_id, local_player_id, profile_index, career_index)
	local new_ranged_ammo = data.ammo.slot_ranged

	if not low_precision_float_comparison(existing_ranged_ammo, new_ranged_ammo) then
		self._run_state:set_player_ranged_ammo(peer_id, local_player_id, profile_index, career_index, new_ranged_ammo)
	end

	local existing_consumable_healthkit_slot = self._run_state:get_player_consumable_healthkit_slot(peer_id, local_player_id, profile_index, career_index)
	local new_consumable_healthkit_slot = data.consumables.slot_healthkit

	if existing_consumable_healthkit_slot ~= new_consumable_healthkit_slot then
		self._run_state:set_player_consumable_healthkit_slot(peer_id, local_player_id, profile_index, career_index, new_consumable_healthkit_slot)
	end

	local existing_consumable_potion_slot = self._run_state:get_player_consumable_potion_slot(peer_id, local_player_id, profile_index, career_index)
	local new_consumable_potion_slot = data.consumables.slot_potion

	if existing_consumable_potion_slot ~= new_consumable_potion_slot then
		self._run_state:set_player_consumable_potion_slot(peer_id, local_player_id, profile_index, career_index, new_consumable_potion_slot)
	end

	local existing_consumable_grenade_slot = self._run_state:get_player_consumable_grenade_slot(peer_id, local_player_id, profile_index, career_index)
	local new_consumable_grenade_slot = data.consumables.slot_grenade

	if existing_consumable_grenade_slot ~= new_consumable_grenade_slot then
		self._run_state:set_player_consumable_grenade_slot(peer_id, local_player_id, profile_index, career_index, new_consumable_grenade_slot)
	end

	local existing_additional_items = self._run_state:get_player_additional_items(peer_id, local_player_id, profile_index, career_index)
	local new_additional_items = data.additional_items
	local additional_items_changed = false

	for new_slot_name, new_slot_data in pairs(data.additional_items) do
		local existing_slot_data = existing_additional_items[new_slot_name]

		if not existing_slot_data then
			additional_items_changed = true

			break
		end

		local new_items = new_slot_data.items
		local existing_items = existing_slot_data.items

		if #new_items ~= #existing_items then
			additional_items_changed = true

			break
		end

		for i = 1, #new_items, 1 do
			if new_items[i].key ~= existing_items[i].key then
				additional_items_changed = true

				break
			end
		end

		if additional_items_changed then
			break
		end
	end

	if additional_items_changed then
		new_additional_items = table.clone(new_additional_items)

		self._run_state:set_player_additional_items(peer_id, local_player_id, profile_index, career_index, new_additional_items)
	end
end

DeusRunController.save_persistent_buffs = function (self, peer_id, local_player_id, profile_index, career_index, persistent_buffs)
	if self._destroyed then
		return
	end

	local existing_persistent_buffs = self._run_state:get_player_persistent_buffs(peer_id, local_player_id, profile_index, career_index)
	local commit_buffs = false

	if #existing_persistent_buffs ~= #persistent_buffs then
		commit_buffs = true
	else
		for index, buff in ipairs(existing_persistent_buffs) do
			commit_buffs = commit_buffs or existing_persistent_buffs[index] ~= persistent_buffs[index]
		end
	end

	if commit_buffs then
		persistent_buffs = table.clone(persistent_buffs)

		self._run_state:set_player_persistent_buffs(peer_id, local_player_id, profile_index, career_index, persistent_buffs)
	end
end

DeusRunController.get_graph_data = function (self)
	return self._path_graph
end

DeusRunController.set_current_node_key = function (self, node_key)
	self._run_state:set_current_node_key(node_key)
end

DeusRunController.get_current_node_key = function (self)
	return self._run_state:get_current_node_key()
end

DeusRunController.get_current_node = function (self)
	local current_node_key = self:get_current_node_key()

	return self._path_graph[current_node_key]
end

DeusRunController.get_node = function (self, node_key)
	return self._path_graph[node_key]
end

DeusRunController.get_weapon_pool = function (self)
	local base_weapon_pool = self:get_base_weapon_pool()
	local weapon_pool = table.clone(base_weapon_pool)
	local pool_excludes = self._run_state:get_own_weapon_pool_excludes()
	local excluded_weapon_groups = table.clone(pool_excludes)

	for pool_rarity, weapon_groups in pairs(excluded_weapon_groups) do
		for excluded_weapon_group, _ in pairs(weapon_groups) do
			weapon_pool[pool_rarity][excluded_weapon_group] = nil
		end
	end

	local slot_amounts = DeusWeaponGeneration.get_weapon_pool_slot_amounts(base_weapon_pool, weapon_pool)
	local deus_weapon_groups = DeusWeaponGroups
	local temp_empty_slots = {}

	for rarity, _ in pairs(weapon_pool) do
		table.clear(temp_empty_slots)

		for slot_type, amount in pairs(slot_amounts[rarity]) do
			if amount == 0 then
				table.insert(temp_empty_slots, slot_type)
			end
		end

		if #temp_empty_slots > 0 then
			for weapon_group_name, _ in pairs(base_weapon_pool[rarity]) do
				local weapon_group = deus_weapon_groups[weapon_group_name]
				local slot_type = weapon_group.slot_type

				if table.contains(temp_empty_slots, slot_type) then
					pool_excludes[rarity][weapon_group_name] = nil
					weapon_pool[rarity][weapon_group_name] = base_weapon_pool[rarity][weapon_group_name]
				end
			end
		end
	end

	self._run_state:set_own_weapon_pool_excludes(pool_excludes)

	return weapon_pool
end

DeusRunController.get_slot_chances = function (self)
	local slot_chance_melee = DeusSlotChance.melee
	local slot_chance_ranged = DeusSlotChance.ranged
	local slot_chance_multiplier = DeusSlotChance.slot_chance_multiplier
	local melee_weapon, ranged_weapon = self:get_own_loadout()

	if melee_weapon and ranged_weapon then
		local melee_weapon_rarity_order = RaritySettings[melee_weapon.rarity].order
		local ranged_weapon_rarity_order = RaritySettings[ranged_weapon.rarity].order

		if ranged_weapon_rarity_order < melee_weapon_rarity_order then
			slot_chance_ranged = slot_chance_ranged * slot_chance_multiplier
		elseif melee_weapon_rarity_order < ranged_weapon_rarity_order then
			slot_chance_melee = slot_chance_melee * slot_chance_multiplier
		end
	end

	return slot_chance_melee, slot_chance_ranged
end

DeusRunController.get_own_weapon_pool_excludes = function (self)
	return self._run_state:get_own_weapon_pool_excludes()
end

DeusRunController.get_base_weapon_pool = function (self)
	local peer_id = self._run_state:get_own_peer_id()
	local profile_index, career_index = self._run_state:get_player_profile(peer_id, REAL_PLAYER_LOCAL_ID)
	local profile = SPProfiles[profile_index]
	local career_name = profile.careers[career_index].name
	local weapon_pool_data = self._run_state:get_own_weapon_pool_data()
	local is_weapon_pool_valid = weapon_pool_data and weapon_pool_data.career_index == career_index and weapon_pool_data.profile_index == profile_index

	if not is_weapon_pool_valid then
		local base_weapon_pool = DeusWeaponGeneration.generate_weapon_pool(career_name, self._run_state:get_weapon_group_whitelist())
		weapon_pool_data = {
			profile_index = profile_index,
			career_index = career_index,
			base_weapon_pool = base_weapon_pool
		}

		self._run_state:set_own_weapon_pool_data(weapon_pool_data)
	end

	return weapon_pool_data.base_weapon_pool
end

DeusRunController.purchase_chest = function (self, rarity, chest_type, cost)
	local own_peer_id = self._run_state:get_own_peer_id()
	local current_coins = self._run_state:get_player_soft_currency(own_peer_id, REAL_PLAYER_LOCAL_ID)

	if current_coins < cost then
		return false
	end

	local new_coins = current_coins - cost

	self._run_state:set_player_soft_currency(own_peer_id, REAL_PLAYER_LOCAL_ID, new_coins)

	local event_type_rarity_prefix = (rarity and rarity .. "_") or ""
	local event_type = event_type_rarity_prefix .. chest_type .. "_chest"

	self:_add_coin_tracking_entry(own_peer_id, REAL_PLAYER_LOCAL_ID, -cost, event_type)
	self:_record_chest_purchased_for_tracking(rarity, chest_type)

	if not self._run_state:is_server() then
		local server_peer_id = self._run_state:get_server_peer_id()
		local server_channel_id = PEER_ID_TO_CHANNEL[server_peer_id]
		local rarity_lookup = NetworkLookup.rarities[rarity or "common"]
		local chest_type_lookup = NetworkLookup.deus_chest_types[chest_type]

		RPC.rpc_deus_chest_unlocked(server_channel_id, cost, rarity_lookup, chest_type_lookup)
	end

	return true
end

DeusRunController.remove_weapon_from_pool = function (self, rarity, weapon_key)
	self:_remove_weapon_from_pool(rarity, weapon_key)
end

DeusRunController._remove_weapon_from_pool = function (self, rarity, weapon_key)
	local pool_excludes = self._run_state:get_own_weapon_pool_excludes()
	local weapon_group_name = DeusWeapons[weapon_key].base_item
	local rarities = RarityUtils.get_lower_rarities(rarity)

	table.insert(rarities, rarity)

	for _, rarity in ipairs(rarities) do
		pool_excludes[rarity] = pool_excludes[rarity] or {}
		pool_excludes[rarity][weapon_group_name] = true
	end

	self._run_state:set_own_weapon_pool_excludes(pool_excludes)
end

DeusRunController.rpc_deus_chest_unlocked = function (self, sender_channel_id, cost, rarity_lookup, chest_type_lookup)
	local sender = CHANNEL_TO_PEER_ID[sender_channel_id]
	local rarity = NetworkLookup.rarities[rarity_lookup]
	local chest_type = NetworkLookup.deus_chest_types[chest_type_lookup]
	local current_coins = self._run_state:get_player_soft_currency(sender, REAL_PLAYER_LOCAL_ID)
	local new_coins = current_coins - cost

	self._run_state:set_player_soft_currency(sender, REAL_PLAYER_LOCAL_ID, new_coins)
	self:_record_chest_purchased_for_tracking(rarity, chest_type)

	local event_type = nil

	if chest_type == DEUS_CHEST_TYPES.power_up then
		event_type = chest_type .. "_chest"
	else
		event_type = rarity .. "_" .. chest_type .. "_chest"
	end

	self:_add_coin_tracking_entry(sender, REAL_PLAYER_LOCAL_ID, -cost, event_type)
end

DeusRunController._record_chest_purchased_for_tracking = function (self, rarity, chest_type)
	if chest_type == DEUS_CHEST_TYPES.power_up then
		local count = self._run_state:get_power_up_chests_used()
		count = count + 1

		self._run_state:set_power_up_chests_used(count)
	else
		local chest_table = nil

		if chest_type == DEUS_CHEST_TYPES.swap_melee then
			chest_table = self._run_state:get_melee_swap_chests_used()
		elseif chest_type == DEUS_CHEST_TYPES.swap_ranged then
			chest_table = self._run_state:get_ranged_swap_chests_used()
		elseif chest_type == DEUS_CHEST_TYPES.upgrade then
			chest_table = self._run_state:get_upgrade_chests_used()
		end

		fassert(chest_table, "unknown %s chest_type", chest_type)

		local skip_metatable = true
		chest_table = table.clone(chest_table, skip_metatable)
		chest_table[rarity] = (chest_table[rarity] and chest_table[rarity] + 1) or 1

		if chest_type == DEUS_CHEST_TYPES.swap_melee then
			self._run_state:set_melee_swap_chests_used(chest_table)
		elseif chest_type == DEUS_CHEST_TYPES.swap_ranged then
			self._run_state:set_ranged_swap_chests_used(chest_table)
		elseif chest_type == DEUS_CHEST_TYPES.upgrade then
			self._run_state:set_upgrade_chests_used(chest_table)
		end
	end
end

DeusRunController.set_twitch_level_vote = function (self, node_key)
	self._run_state:set_twitch_level_vote(node_key)
end

DeusRunController.get_twitch_level_vote = function (self)
	return self._run_state:get_twitch_level_vote()
end

DeusRunController.request_standard_twitch_level_vote = function (self, twitch_manager)
	local graph = self:get_graph_data()
	local current_node = self:get_current_node()
	local next_node_keys = current_node.next
	local next_node_a = graph[next_node_keys[1]]
	local next_node_b = graph[next_node_keys[2]]
	local vote_templates = {
		TwitchVoteDeusSelectLevelNames[next_node_a.base_level],
		TwitchVoteDeusSelectLevelNames[next_node_b.base_level]
	}
	local vote_time = Application.user_setting("twitch_vote_time") or TwitchSettings.default_vote_time

	twitch_manager:register_vote(vote_time, "standard_vote", nil, vote_templates, true)
end

DeusRunController.map_finished_voting = function (self)
	self._run_state:set_twitch_level_vote(nil)
end

DeusRunController._add_coin_tracking_entry = function (self, peer_id, local_player_id, coins, description)
	local run_state = self._run_state

	if not run_state:is_server() then
		return
	end

	local telemetry_id = run_state:get_player_telemetry_id(peer_id, local_player_id)
	local run_id = run_state:get_run_id()

	Managers.telemetry.events:deus_coins_changed(telemetry_id, run_id, coins, description)

	if coins > 0 then
		local coins_earned = self._run_state:get_coins_earned()
		coins_earned = coins_earned + coins

		self._run_state:set_coins_earned(coins_earned)
	else
		local coins_spent = self._run_state:get_coins_spent()
		coins_spent = coins_spent + coins

		self._run_state:set_coins_spent(coins_spent)
	end
end

DeusRunController.handle_level_start = function (self)
	self._level_start_time = os.time()
end

DeusRunController.handle_start_next_round = function (self)
	self._deus_weapon_chest_distribution = nil
end

DeusRunController.get_deus_weapon_chest_type = function (self)
	local chest_distribution = self._deus_weapon_chest_distribution

	if not chest_distribution or #chest_distribution == 0 then
		local run_state = self._run_state
		local current_node_key = run_state:get_current_node_key()
		local current_node = self._path_graph[current_node_key]
		local level_key = current_node.level
		local level_settings = LevelSettings[level_key]
		local distribution = level_settings.deus_weapon_chest_distribution

		assert(distribution, string.format("No deus_weapon_chest_distribution set for %s", level_key))

		chest_distribution = {}

		for chest_type, amount in pairs(distribution) do
			for i = 1, amount, 1 do
				chest_distribution[#chest_distribution + 1] = chest_type
			end
		end

		local seed = current_node.level_seed
		seed = HashUtils.fnv32_hash(seed)

		table.shuffle(chest_distribution, seed)

		self._deus_weapon_chest_distribution = chest_distribution
	end

	local chest_type = chest_distribution[#chest_distribution]
	chest_distribution[#chest_distribution] = nil

	return chest_type
end

DeusRunController.get_level_ended_tracking_data = function (self, statistics_db, game_won, num_bots)
	local level_start_time = self._level_start_time

	fassert(level_start_time, " DeusRunController:handle_level_start was never called")

	local level_duration_in_seconds = os.difftime(os.time(), level_start_time)
	local run_state = self._run_state
	local current_node_key = run_state:get_current_node_key()
	local current_node = self._path_graph[current_node_key]
	local run_progress = current_node.run_progress
	local own_peer_id = self._run_state:get_own_peer_id()
	local stats_id = PlayerUtils.unique_player_id(own_peer_id, REAL_PLAYER_LOCAL_ID)
	local times_revived = statistics_db:get_stat(stats_id, "times_revived")
	local difficulty_tweak = math.round(math.lerp(-DifficultyTweak.range, DifficultyTweak.range, run_progress))

	return {
		run_id = run_state:get_run_id(),
		peer_ids = self._network_handler:get_peers(),
		run_seed = run_state:get_run_seed(),
		journey_name = run_state:get_journey_name(),
		dominant_god = run_state:get_dominant_god(),
		difficulty = run_state:get_run_difficulty(),
		difficulty_tweak = difficulty_tweak,
		level = current_node.base_level,
		path = current_node.path,
		curse = current_node.curse or "None",
		theme = current_node.theme,
		level_duration_in_seconds = level_duration_in_seconds,
		game_won = game_won,
		times_revived = times_revived,
		num_bots = num_bots
	}
end

DeusRunController.get_level_started_tracking_data = function (self, statistics_db, num_bots)
	local run_state = self._run_state
	local current_node_key = run_state:get_current_node_key()
	local current_node = self._path_graph[current_node_key]
	local run_progress = current_node.run_progress
	local difficulty_tweak = math.round(math.lerp(-DifficultyTweak.range, DifficultyTweak.range, run_progress))

	return {
		run_id = run_state:get_run_id(),
		peer_ids = self._network_handler:get_peers(),
		run_seed = run_state:get_run_seed(),
		journey_name = run_state:get_journey_name(),
		dominant_god = run_state:get_dominant_god(),
		difficulty = run_state:get_run_difficulty(),
		difficulty_tweak = difficulty_tweak,
		level = current_node.base_level,
		path = current_node.path,
		curse = current_node.curse or "None",
		theme = current_node.theme,
		num_bots = num_bots
	}
end

DeusRunController.get_run_tracking_data = function (self, game_won)
	local run_start_time = self._run_start_time

	fassert(run_start_time, " DeusRunController:setup_run was never called")

	local run_duration_in_seconds = os.difftime(os.time(), run_start_time)
	local run_state = self._run_state
	local own_peer_id = run_state:get_own_peer_id()
	local traversed_nodes = run_state:get_traversed_nodes()
	local completed_levels = {}
	local shops_visited = 0
	local completed_travel_levels = 0
	local completed_signature_levels = 0

	for _, traversed_node_key in ipairs(traversed_nodes) do
		local node = self._path_graph[traversed_node_key]
		completed_levels[#completed_levels + 1] = node.level

		if node.level_type == "SIGNATURE" then
			completed_signature_levels = completed_signature_levels + 1
		elseif node.level_type == "TRAVEL" then
			completed_travel_levels = completed_travel_levels + 1
		elseif node.level_type == "SHOP" then
			shops_visited = shops_visited + 1
		end
	end

	return {
		run_id = run_state:get_run_id(),
		run_duration_in_seconds = run_duration_in_seconds,
		completed_levels = completed_levels,
		game_won = game_won,
		blessings_boughts = run_state:get_bought_blessings(),
		power_ups_bought = run_state:get_bought_power_ups(),
		ground_coins_picked_up = run_state:get_ground_coins_picked_up(),
		monster_coins_picked_up = run_state:get_monster_coins_picked_up(),
		melee_swap_chests_used = run_state:get_melee_swap_chests_used(),
		ranged_swap_chests_used = run_state:get_ranged_swap_chests_used(),
		upgrade_chests_used = run_state:get_upgrade_chests_used(),
		power_up_chests_used = run_state:get_power_up_chests_used(),
		cursed_chests_used = run_state:get_cursed_chests_purified(own_peer_id),
		coins_earned = run_state:get_coins_earned(),
		coins_spent = run_state:get_coins_spent(),
		shops_visited = shops_visited,
		signature_levels_completed = completed_signature_levels,
		travel_levels_completed = completed_travel_levels,
		host_migration_count = run_state:get_host_migration_count()
	}
end

return
