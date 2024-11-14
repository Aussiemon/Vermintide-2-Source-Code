-- chunkname: @scripts/managers/game_mode/mechanisms/versus_mechanism.lua

require("scripts/managers/irc/irc_manager")
require("scripts/managers/game_mode/mechanisms/versus_game_server_slot_reservation_handler")
require("scripts/managers/game_mode/mechanisms/player_hosted_slot_reservation_handler")
require("scripts/managers/game_mode/mechanisms/shared_state_versus")

VersusMechanism = class(VersusMechanism)
VersusMechanism.name = "Versus"

local CHAT_MESSAGE_TARGETS = {
	team = {
		message_target = "Team",
		message_target_key = "vs_msg_target_team",
		message_target_type = Irc.TEAM_MSG,
	},
	all = {
		message_target = "All",
		message_target_key = "vs_msg_target_all",
		message_target_type = Irc.ALL_MSG,
	},
}
local RPCS = {
	"rpc_versus_setup_match",
	"rpc_sync_vs_custom_game_slot_data",
	"rpc_request_slot_reservation_sync",
}
local REAL_PLAYER_LOCAL_ID = 1
local PACKAGE_REFERENCE_NAME = "VersusMechanism"
local HUB_LEVEL_NAME = "carousel_hub"
local dlc_settings = DLCSettings.carousel

local function print_vote_request(params)
	local mission_id = params.mission_id
	local preferred_level_keys = params.preferred_level_keys
	local difficulty_key = params.difficulty
	local quick_game = params.quick_game
	local private_game = params.private_game
	local player_hosted = params.player_hosted
	local use_dedicated_win_servers = params.dedicated_servers_win
	local use_dedicated_aws_servers = params.dedicated_servers_aws
	local join_method = params.join_method
	local matchmaking_type = params.matchmaking_type
	local mechanism = params.mechanism

	print("............................................................................................................")
	print("............................................................................................................")
	printf("GAME START SETTINGS -> Mission: %s | Difficulty: %s | Find Player Hosted: %s | Find Dedicated Servers - WIN: %s | Find Dedicated Servers - AWS: %s | Quick Game: %s | Private Game: %s | Matchmaking Type: %s | Join Method: %s", mission_id and mission_id or "Not specified", difficulty_key, player_hosted and "yes" or "no", use_dedicated_win_servers and "yes" or "no", use_dedicated_aws_servers and "yes" or "no", quick_game and "yes" or "no", private_game and "yes" or "no", matchmaking_type or "Not specified", join_method)
	print("............................................................................................................")
	print("............................................................................................................")
end

local vote_requests = {
	default = function (params)
		print_vote_request(params)

		local vote_data = {
			mission_id = params.mission_id,
			preferred_level_keys = params.preferred_level_keys,
			difficulty = params.difficulty,
			quick_game = params.quick_game,
			player_hosted = params.player_hosted,
			use_dedicated_win_servers = params.dedicated_servers_win,
			use_dedicated_aws_servers = params.dedicated_servers_aws,
			join_method = params.join_method,
			matchmaking_type = params.matchmaking_type,
			mechanism = params.mechanism,
			vote_type = params.request_type,
		}
		local vote_template = "carousel_settings_vote"

		Managers.state.voting:request_vote(vote_template, vote_data, Network.peer_id())
	end,
	versus_custom = function (params)
		print_vote_request(params)

		local vote_data = {
			mission_id = params.mission_id,
			any_level = params.any_level,
			difficulty = params.difficulty,
			private_game = params.private_game,
			quick_game = params.quick_game,
			player_hosted = params.player_hosted,
			use_dedicated_win_servers = params.dedicated_servers_win,
			use_dedicated_aws_servers = params.dedicated_servers_aws,
			join_method = params.join_method,
			matchmaking_type = params.matchmaking_type,
			mechanism = params.mechanism,
			vote_type = params.request_type,
		}
		local vote_template = "carousel_player_hosted_settings_vote"

		Managers.state.voting:request_vote(vote_template, vote_data, Network.peer_id())
	end,
}

VersusMechanism.init = function (self, settings)
	self._hero_profiles = table.clone(PROFILES_BY_AFFILIATION.heroes)

	fassert(PROFILES_BY_AFFILIATION.dark_pact, "You are missing dark-pact player profiles. See vs_profiles.lua")

	self._dark_pact_profiles = table.clone(PROFILES_BY_AFFILIATION.dark_pact)
	self._spectator_profiles = table.clone(PROFILES_BY_AFFILIATION.spectators)
	self._saved_bot_profiles = {}

	local parties = Managers.party:parties()

	for party_id = 1, #parties do
		self._saved_bot_profiles[party_id] = {}
	end

	self._message_targets_initiated = false
	self._challenge_progression = {}

	self:register_chats()
	self:_reset(settings, true)
end

VersusMechanism.register_rpcs = function (self, network_event_delegate)
	self:unregister_rpcs()

	self._network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	if self._shared_state then
		self._shared_state:register_rpcs(self._network_event_delegate)
	end
end

VersusMechanism.unregister_rpcs = function (self)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end

	if self._shared_state then
		self._shared_state:unregister_rpcs()
	end
end

VersusMechanism._reset = function (self, settings, on_init)
	self._settings = settings
	self._level_override_key = nil
	self._total_rounds_started = 0
	self._profiles_reservable = false

	self:_clear_horde_ability_data()

	local changing_to_inn = self._state ~= "inn"

	if self._shared_state then
		self._shared_state:destroy()

		self._shared_state = nil
	end

	if changing_to_inn then
		self:set_current_state("inn")

		if not on_init then
			Managers.mechanism:reset_party_data(false)
		end

		if DEDICATED_SERVER and not Development.parameter("network_log_spew") and not Development.parameter("network_log_messages") and not Development.parameter("network_log_messages") then
			Network.log("info")
		end

		self._local_match = false
		self._private_lobby = true
		self._using_dedicated_servers = true
		self._using_dedicated_aws_servers = true
		self._using_player_hosted = true
		self._current_set = 1
		self._num_sets = 1
		self._force_start_dedicated_server = false
		self._join_signaling_timer = 0
		self._queue_tickets = {}
	end

	if not on_init then
		if DEDICATED_SERVER and not Development.parameter("network_log_spew") and not Development.parameter("network_log_messages") and not Development.parameter("network_log_messages") then
			Network.log("warnings")
		end

		local network_server = Managers.mechanism:network_server()

		if network_server then
			for _, peer_id in ipairs(network_server:get_peers()) do
				Managers.party:assign_peer_to_party(peer_id, REAL_PLAYER_LOCAL_ID)
			end
		end
	end

	if changing_to_inn then
		self._win_conditions = VersusWinConditions:new(self)
	end

	self._peer_backend_id = {}
end

VersusMechanism.setup_mechanism_parties = function (self, mechanism_manager)
	self:_create_party_info()

	local parties = Managers.party:parties()

	if self._slot_reservation_handler then
		self._slot_reservation_handler:destroy()
	end

	if DEDICATED_SERVER then
		self._slot_reservation_handler = VersusGameServerSlotReservationHandler:new(parties)
	else
		self._slot_reservation_handler = PlayerHostedSlotReservationHandler:new(mechanism_manager, {
			parties[1],
		})
	end

	self._saved_bot_profiles = {}

	for party_id = 1, #parties do
		self._saved_bot_profiles[party_id] = {}
	end
end

VersusMechanism.make_profiles_reservable = function (self)
	self._profiles_reservable = true
end

VersusMechanism.profiles_reservable = function (self)
	return self._profiles_reservable
end

VersusMechanism.network_context_created = function (self, lobby, server_peer_id, own_peer_id, is_server, network_handler)
	if self._shared_state then
		local level_settings = LevelSettings[Managers.level_transition_handler:get_current_level_key()]

		if is_server and not self._shared_state:get_match_ended() and not level_settings.hub_level then
			self._shared_state:network_context_created(lobby, server_peer_id, own_peer_id, is_server, network_handler)
		else
			self._shared_state:destroy()

			self._shared_state = nil
		end
	end

	if self._slot_reservation_handler and self._slot_reservation_handler.network_context_created then
		self._slot_reservation_handler:network_context_created(lobby, server_peer_id, own_peer_id, is_server, network_handler)
	end
end

VersusMechanism.network_context_destroyed = function (self)
	self:_reset(self._settings)
end

VersusMechanism.destroy = function (self)
	local package_map = self._dark_pact_packages

	if package_map then
		local package_manager = Managers.package

		for package_name, _ in pairs(package_map) do
			package_manager:unload(package_name, PACKAGE_REFERENCE_NAME)
		end
	end

	self._slot_reservation_handler:destroy()

	self._slot_reservation_handler = nil

	self:unregister_chats()
	self:_unload_sound_bank()
end

VersusMechanism._create_party_info = function (self)
	self._num_reserved_slots = 0
	self._num_total_slots = 0
	self._member_info_by_party = {}

	local member_info_by_party = self._member_info_by_party
	local parties = Managers.party:parties()

	for party_id = 1, #parties do
		local party = parties[party_id]
		local slots = party.slots
		local members, states = {}, {}

		for j = 1, #slots do
			states[j] = "?"
			members[j] = "?"
		end

		member_info_by_party[party_id] = {
			members = members,
			states = states,
		}
	end
end

VersusMechanism.reset_party_info = function (self)
	local member_info_by_party = self._member_info_by_party

	for party_id = 1, #member_info_by_party do
		local info = member_info_by_party[party_id]

		table.clear(info.members)
		table.clear(info.states)
	end
end

VersusMechanism.max_instance_members = function (self)
	if DEDICATED_SERVER or self._local_match or self._is_hosting_custom_game then
		local max_members = self._slot_reservation_handler:num_slots_total()

		return max_members
	else
		return Managers.mechanism:max_party_members()
	end
end

VersusMechanism.set_is_hosting_versus_custom_game = function (self, is_hosting)
	self._is_hosting_custom_game = is_hosting

	if is_hosting then
		Managers.party:server_init_friend_parties(true)
	else
		Managers.party:server_clear_friend_parties()
		self._slot_reservation_handler:shrink()
	end

	if Managers.mechanism:is_server() then
		LobbySetup.update_network_options_max_members()
		Managers.mechanism:update_lobby_max_members()
	end
end

VersusMechanism.is_hosting_versus_custom_game = function (self)
	return self._is_hosting_custom_game
end

VersusMechanism.sync_mechanism_data = function (self, peer_id, mechanism_newly_initialized)
	local channel_id = PEER_ID_TO_CHANNEL[peer_id]

	if self._local_match then
		RPC.rpc_carousel_set_local_match(channel_id, self._local_match)
	end

	if self._private_lobby then
		RPC.rpc_carousel_set_private_lobby(channel_id, self._private_lobby)
	end

	RPC.rpc_dedicated_or_player_hosted_search(channel_id, self._using_dedicated_servers, self._using_dedicated_aws_servers, self._using_player_hosted)

	if self._win_conditions then
		self._win_conditions:hot_join_sync(peer_id)
	end

	if self._slot_reservation_handler.hot_join_sync then
		self._slot_reservation_handler:hot_join_sync(peer_id)
	end

	if not mechanism_newly_initialized then
		return
	end

	if self._shared_state then
		RPC.rpc_versus_setup_match(channel_id)
	end
end

VersusMechanism._load_sound_bank = function (self)
	if not self._sound_bank_loaded then
		local package_to_load = "resource_packages/dlcs/ingame_sounds_carousel"

		print("Loading carousel mode sound bank resource package %s", package_to_load)
		Managers.package:load(package_to_load, "versus", nil, true)

		self._sound_bank_loaded = true
	end
end

VersusMechanism._unload_sound_bank = function (self)
	if self._sound_bank_loaded then
		local package_to_unload = "resource_packages/dlcs/ingame_sounds_carousel"

		print("Unloading carousel sound bank resource package %s", package_to_unload)
		Managers.package:unload(package_to_unload, "versus")

		self._sound_bank_loaded = false
	end
end

VersusMechanism._load_dark_pact_profiles = function (self)
	local package_map = {}

	local function add_packages_to_map(map, list)
		for i = 1, #list do
			local package_name = list[i]

			map[package_name] = true
		end
	end

	local dark_pact_skins = table.keys(table.filter(Cosmetics, function (cosmetic)
		return cosmetic.dark_pact
	end))

	for i = 1, #dark_pact_skins do
		local skin_name = dark_pact_skins[i]
		local skin_item = ItemMasterList[skin_name]
		local first_person = true
		local first_person_packages = CosmeticsUtils.retrieve_skin_packages(skin_name, first_person)

		if first_person_packages then
			add_packages_to_map(package_map, first_person_packages)
		end

		local third_person_packages = CosmeticsUtils.retrieve_skin_packages(skin_name, not first_person)

		if third_person_packages then
			add_packages_to_map(package_map, third_person_packages)
		end

		local weapon_item_name = skin_item.linked_weapon
		local weapon_item_data = weapon_item_name and ItemMasterList[weapon_item_name]

		if weapon_item_data then
			local item_template_name = weapon_item_data.temporary_template or weapon_item_data.template
			local item_template = WeaponUtils.get_weapon_template(item_template_name)
			local item_units = BackendUtils.get_item_units(weapon_item_data)
			local career_name = weapon_item_data.can_wield[1]
			local weapon_packages = WeaponUtils.get_weapon_packages(item_template, item_units, first_person, career_name)

			if weapon_packages then
				add_packages_to_map(package_map, weapon_packages)
			end
		end
	end

	package_map["units/weapons/player/wpn_packmaster_claw_combo/wpn_packmaster_claw_combo"] = true
	package_map["units/weapons/player/wpn_packmaster_claw_combo/wpn_packmaster_claw_combo_3p"] = true

	local package_manager = Managers.package

	for package_name, _ in pairs(package_map) do
		local callback
		local async = true
		local prioritize = false

		package_manager:load(package_name, PACKAGE_REFERENCE_NAME, callback, async, prioritize)
	end

	self._dark_pact_packages = package_map
end

VersusMechanism.is_packages_loaded = function (self)
	local package_map = self._dark_pact_packages

	if package_map == nil then
		return false
	end

	local package_manager = Managers.package

	for package_name, _ in pairs(package_map) do
		if not package_manager:has_loaded(package_name, PACKAGE_REFERENCE_NAME) then
			return false
		end
	end

	return true
end

VersusMechanism.load_packages = function (self)
	self:_load_sound_bank()

	if self._dark_pact_packages then
		return
	end

	self:_load_dark_pact_profiles()
end

VersusMechanism.server_decide_side_order = function (self)
	if not self._settings.disadvantaged_team_starts then
		return
	end

	local heroes_id = Managers.party:get_party(1).name == "heroes" and 2 or 1

	if self._state == "round_2" then
		local score = {}

		for i = 1, 2 do
			score[i] = self._win_conditions:get_total_score(i)
		end

		if score[1] ~= score[2] then
			heroes_id = table.max(score)
		end
	end

	self:set_side_order_state(heroes_id)
end

VersusMechanism.set_side_order_state = function (self, heroes_id)
	local network_handler = Managers.mechanism:network_handler()

	network_handler:set_side_order_state(heroes_id)
end

VersusMechanism._build_side_compositions = function (self, state)
	local heroes_id, dark_pact_id = self:_update_sides(state)
	local spectators_id = 3
	local party_manager = Managers.party
	local side_compositions = {
		{
			name = "heroes",
			show_damage_feedback = false,
			relations = {
				enemy = {
					"dark_pact",
				},
			},
			party = Managers.party:get_party(heroes_id),
			add_these_settings = {
				show_damage_feedback = false,
				using_enemy_recycler = true,
				using_grims_and_tomes = true,
				available_profiles = self._hero_profiles,
			},
		},
		{
			name = "dark_pact",
			relations = {
				enemy = {
					"heroes",
				},
			},
			party = Managers.party:get_party(dark_pact_id),
			add_these_settings = {
				show_damage_feedback = true,
				using_grims_and_tomes = false,
				available_profiles = self._dark_pact_profiles,
			},
		},
		{
			name = "spectators",
			relations = {
				neutral = {
					"heroes",
					"dark_pact",
				},
			},
			party = party_manager:get_party(spectators_id),
			add_these_settings = {
				show_damage_feedback = true,
				using_grims_and_tomes = false,
				available_profiles = self._spectator_profiles,
			},
		},
		{
			name = "neutral",
			relations = {
				enemy = {},
			},
		},
	}

	return side_compositions
end

VersusMechanism._update_sides = function (self, state)
	local heroes_id, dark_pact_id

	if state == "inn" then
		heroes_id = 1
		dark_pact_id = 2
	elseif self._settings.disadvantaged_team_starts then
		local network_handler = Managers.mechanism:network_handler()
		local side_order_state = network_handler:get_side_order_state()

		if side_order_state then
			heroes_id = side_order_state
			dark_pact_id = side_order_state == 1 and 2 or 1
		elseif state == "round_1" then
			heroes_id = 1
			dark_pact_id = 2
		else
			ferror("Unknown state %s", state)
		end
	elseif state == "inn" then
		heroes_id = 1
		dark_pact_id = 2
	elseif state == "round_1" then
		heroes_id = 1
		dark_pact_id = 2
	elseif state == "round_2" then
		heroes_id = 2
		dark_pact_id = 1
	else
		ferror("Unknown state %s", state)
	end

	self._heroes_id = heroes_id
	self._dark_pact_id = dark_pact_id

	self:_set_party_side_data(heroes_id, "heroes")
	self:_set_party_side_data(dark_pact_id, "dark_pact")

	return heroes_id, dark_pact_id
end

VersusMechanism._set_party_side_data = function (self, party_id, side_name)
	local party_manager = Managers.party
	local parties_by_name = party_manager:parties_by_name()
	local party = party_manager:get_party(party_id)

	party.name = side_name
	parties_by_name[side_name] = party
end

VersusMechanism.progress_state = function (self)
	local state = self._state

	if self:match_ended_early() then
		if DEDICATED_SERVER then
			self._force_start_dedicated_server = false
		end

		return self._state
	end

	if state == "inn" then
		self:set_current_state("round_1")
	elseif state == "round_1" then
		self:set_current_state("round_2")
	elseif state == "round_2" then
		if not self:is_last_set() then
			self:set_current_state("round_1")

			return self._state
		end

		if DEDICATED_SERVER then
			self._force_start_dedicated_server = false
		end
	else
		ferror("VersusMechanism: unknown state %s", state)
	end

	return self._state
end

VersusMechanism.debug_load_level = function (self, level_name, environment_variation_id)
	local level_settings = LevelSettings[level_name]
	local level_transition_handler = Managers.level_transition_handler

	level_transition_handler:set_next_level(level_name, environment_variation_id)
	level_transition_handler:promote_next_level_data()
	Managers.mechanism:progress_state()
end

VersusMechanism.set_current_state = function (self, state)
	if DEDICATED_SERVER then
		cprintf("[Mechanism] State Changed from '%s' to '%s'", self._state or "None", state)
	end

	self._state = state
end

VersusMechanism.generate_level_seed = function (self)
	return Managers.mechanism:get_level_seed()
end

VersusMechanism.get_end_of_level_rewards_arguments = function (self, game_won, quickplay, statistics_db, stats_id, level_key, hero_name)
	local kill_count = statistics_db:get_stat(stats_id, "kills_total")

	return {
		kill_count = kill_count,
	}
end

VersusMechanism.get_hub_level_key = function (self)
	return HUB_LEVEL_NAME
end

VersusMechanism.get_prior_state = function (self)
	return nil
end

VersusMechanism.is_final_round = function (self)
	local is_final_round = self._win_conditions:is_final_round()

	return Development.parameter("versus_quick_match_end") or is_final_round or self._shared_state and self._shared_state:get_party_won_early() or self:match_ended_early()
end

VersusMechanism.get_level_end_view = function (self)
	return "LevelEndViewVersus"
end

local game_mode_end_reasons = {
	draw = true,
	party_one_won = true,
	party_one_won_early = true,
	party_two_won = true,
	party_two_won_early = true,
	round_end = true,
}

VersusMechanism.is_venture_over = function (self)
	local reason = self._game_round_ended_reason
	local game_mode_ended = game_mode_end_reasons[reason]
	local final_round = self._state == "round_2" or reason == "party_one_won_early" or reason == "party_two_won_early"

	return game_mode_ended and final_round
end

local match_over_reasons = {
	draw = true,
	party_one_won = true,
	party_one_won_early = true,
	party_two_won = true,
	party_two_won_early = true,
}

VersusMechanism.game_round_ended = function (self, t, dt, reason, reason_data)
	self._game_round_ended_reason = reason
	self._game_round_ended_reason_data = reason_data

	local match_over = match_over_reasons[reason]
	local state = self._state
	local level_key, level_seed, environment_variation_id

	self._level_override_key = nil

	local level_transition_handler = Managers.level_transition_handler

	if state == "inn" then
		level_key = level_transition_handler:get_next_level_key()
		environment_variation_id = level_transition_handler:get_next_environment_variation_id()
	elseif match_over and (reason == "party_one_won_early" or true) then
		self._shared_state:on_party_won_early()

		level_key = HUB_LEVEL_NAME
		environment_variation_id = LevelHelper:get_environment_variation_id(level_key)
		level_seed = Managers.mechanism:create_level_seed()

		self._shared_state:on_match_ended()
	elseif state == "round_1" then
		level_key = level_transition_handler:get_current_level_key()
		environment_variation_id = level_transition_handler:get_current_environment_variation_id()
	elseif state == "round_2" then
		if not self:is_last_set() then
			level_key = level_transition_handler:get_current_level_key()
			environment_variation_id = level_transition_handler:get_current_environment_variation_id()
		else
			level_key = HUB_LEVEL_NAME
			environment_variation_id = LevelHelper:get_environment_variation_id(level_key)
			level_seed = Managers.mechanism:create_level_seed()

			local versus_interface = Managers.backend:get_interface("versus")

			versus_interface:cancel_matchmaking()
		end
	else
		ferror("Bad state in mechanism versus: %s", tostring(state))
	end

	if reason == "round_end" or reason == "party_one_won" or reason == "party_two_won" or reason == "draw" or reason == "party_one_won_early" or reason == "party_two_won_early" then
		level_seed = level_seed or level_transition_handler:get_current_level_seed()

		level_transition_handler:set_next_level(level_key, environment_variation_id, level_seed)
	elseif reason == "start_game" then
		level_transition_handler:promote_next_level_data()
	elseif reason == "reload" then
		local network_manager = Managers.state.network
		local peer_ids = self._slot_reservation_handler:peers()

		for _, peer_id in pairs(peer_ids) do
			if PEER_ID_TO_CHANNEL[peer_id] then
				network_manager.network_server:kick_peer(peer_id)
			end
		end

		local game_server_manager = Managers.game_server

		if game_server_manager then
			local matchmaking_manager = Managers.matchmaking

			if matchmaking_manager and not matchmaking_manager:on_dedicated_server() then
				game_server_manager:set_leader_peer_id(nil)
			end

			game_server_manager:restart()
		end
	else
		ferror("Unknown reason (%s)", reason)
	end
end

VersusMechanism._get_next_game_mode_key = function (self)
	local game_mode_key
	local state = self._state

	if state == "inn" then
		local level_settings = LevelSettings[Managers.level_transition_handler:get_current_level_keys()]

		if level_settings.hub_level then
			game_mode_key = "inn_vs"
		else
			game_mode_key = "versus"
		end
	elseif state == "round_1" then
		game_mode_key = "versus"
	elseif state == "round_2" then
		game_mode_key = "versus"
	else
		ferror("Bad state in mechanism versus: %s", tostring(state))
	end

	return game_mode_key
end

VersusMechanism.start_next_round = function (self)
	self._game_round_ended_reason = nil
	self._game_round_ended_reason_data = nil
	self._join_signaling_timer = 0

	local state = self._state
	local game_mode_key = self:_get_next_game_mode_key()
	local should_reset

	if Managers.mechanism:is_server() then
		local level_transition_handler = Managers.level_transition_handler
		local next_level = level_transition_handler:get_next_level_key()

		should_reset = not DEDICATED_SERVER and next_level == HUB_LEVEL_NAME or state == "inn"
	end

	if should_reset then
		self:_reset(self._settings)
	end

	local side_compositions = self:_build_side_compositions(state)

	return game_mode_key, side_compositions
end

VersusMechanism.request_vote = function (self, params)
	local request_func = vote_requests[params.request_type] or vote_requests.default

	if request_func then
		request_func(params)
	end
end

VersusMechanism.preferred_slot_id = function (self, party_id, peer_id, local_player_id)
	if party_id == 0 then
		return nil
	end

	if self._state == "inn" then
		return nil
	end

	local party = Managers.party:get_party(party_id)
	local profile_index = self:update_wanted_hero_character(peer_id, local_player_id, party_id)
	local matching_bot_slot_id
	local num_slots = party.num_slots

	for slot_id = 1, num_slots do
		local player_status = party.slots[slot_id]
		local is_player = player_status.is_player

		if not is_player then
			local slot_profile_index = self:get_saved_bot(party_id, slot_id)

			if profile_index == slot_profile_index then
				matching_bot_slot_id = slot_id

				break
			end
		end
	end

	if matching_bot_slot_id then
		printf("[VersusMechanism] Looked for party slot for peer %s:%s with profile %s, and found slot with matching bot data", peer_id, local_player_id, profile_index)

		return matching_bot_slot_id
	end

	return nil
end

VersusMechanism._get_fallback_hero_profile = function (self, party_id, peer_id, local_player_id, ignore_bots)
	local available_profiles = self:_find_available_hero_profiles(party_id, peer_id, local_player_id, ignore_bots)
	local index = math.random(1, #available_profiles)
	local profile_index = available_profiles[index]
	local career_index = PlayerUtils.get_random_enabled_non_dlc_career_index_by_profile(profile_index)

	return profile_index, career_index
end

local available_profiles = {}

VersusMechanism._find_available_hero_profiles = function (self, party_id, peer_id, local_player_id, ignore_bots)
	local party_profiles = PROFILES_BY_AFFILIATION.heroes

	table.clear(available_profiles)

	for _, profile_name in ipairs(party_profiles) do
		local profile_index = PROFILES_BY_NAME[profile_name].index

		if Managers.mechanism:profile_available_for_peer(party_id, peer_id, profile_index) then
			available_profiles[#available_profiles + 1] = profile_index
		end
	end

	return available_profiles
end

VersusMechanism.update_wanted_hero_character = function (self, peer_id, local_player_id, party_id)
	local status = Managers.party:get_player_status(peer_id, local_player_id)
	local saved_profile_index, career_index = Managers.mechanism:get_persistent_profile_index_reservation(peer_id)
	local profile_index, unavailable_reason, debug_context = self:parse_hero_profile_availability(saved_profile_index, party_id, peer_id, local_player_id)
	local reason = "saved"

	if saved_profile_index ~= 0 and profile_index ~= saved_profile_index then
		printf("[VersusMechanism] Saved profile %s no longer available: %s, %s", saved_profile_index, unavailable_reason, debug_context)
	end

	if not profile_index then
		local network_server = Managers.mechanism:network_server()

		profile_index, career_index = network_server:peer_wanted_profile(peer_id, local_player_id)
		profile_index = self:parse_hero_profile_availability(profile_index, party_id, peer_id, local_player_id)
		reason = "wanted"
	end

	if not profile_index then
		profile_index = status.profile_index or status.preferred_profile_index
		career_index = status.career_index or status.preferred_career_index
		profile_index = self:parse_hero_profile_availability(profile_index, party_id, peer_id, local_player_id)
		reason = "status_fallback"
	end

	if not profile_index and status.slot_id then
		profile_index, career_index = self:get_saved_bot(party_id, status.slot_id)

		if profile_index and career_index then
			local career_settings = SPProfiles[profile_index].careers[career_index]

			if career_settings.required_dlc then
				profile_index, career_index = nil
			end
		end

		profile_index = self:parse_hero_profile_availability(profile_index, party_id, peer_id, local_player_id)
		reason = "bot_fallback"
	end

	if not profile_index then
		local ignore_bots = true

		profile_index, career_index = self:_get_fallback_hero_profile(party_id, peer_id, local_player_id, ignore_bots)
		reason = "available_fallback"
	end

	assert(profile_index and career_index, "[VersusMechanism] A profile could not be found in party")

	if reason ~= "saved" and self._profiles_reservable then
		printf("[VersusMechanism] update profile, reason: %s, %d, %d ", reason, profile_index, career_index)

		local success = Managers.mechanism:try_reserve_profile_for_peer_by_mechanism(peer_id, profile_index, career_index, true)

		if not success then
			Crashify.print_exception("VersusMechanism", "updated hero character %s for peer %s in party %s, but the profile could not be reserved.", profile_index, peer_id, party_id)
		end
	end

	return profile_index, career_index, reason
end

VersusMechanism.parse_hero_profile_availability = function (self, profile_index, party_id, peer_id, local_player_id)
	if not profile_index or profile_index == 0 then
		return nil, "invalid_profile"
	end

	local profile = SPProfiles[profile_index]

	if profile.affiliation ~= "heroes" then
		return nil, "not_a_hero"
	end

	local available = Managers.mechanism:profile_available_for_peer(party_id, peer_id, profile_index)

	if not available then
		return nil, "profile_already_taken"
	end

	return profile_index
end

VersusMechanism.uses_random_directors = function (self)
	return true
end

VersusMechanism.get_state = function (self)
	return self._state
end

VersusMechanism.set_local_match = function (self, local_match)
	self._local_match = local_match

	local mechanism_manager = Managers.mechanism

	if mechanism_manager:is_server() then
		mechanism_manager:send_rpc_clients("rpc_carousel_set_local_match", local_match)
	end

	mechanism_manager:reset_party_data(false)
end

VersusMechanism.set_private_lobby = function (self, private_lobby)
	self._private_lobby = private_lobby

	local mechanism_manager = Managers.mechanism

	if mechanism_manager:is_server() then
		mechanism_manager:send_rpc_clients("rpc_carousel_set_private_lobby", private_lobby)
	end
end

VersusMechanism.set_dedicated_or_player_hosted_search = function (self, use_dedicated_servers, use_dedicated_aws_servers, use_player_hosted)
	self._using_dedicated_servers = use_dedicated_servers
	self._using_dedicated_aws_servers = use_dedicated_aws_servers
	self._using_player_hosted = use_player_hosted

	local mechanism_manager = Managers.mechanism

	if mechanism_manager:is_server() then
		mechanism_manager:send_rpc_clients("rpc_dedicated_or_player_hosted_search", use_dedicated_servers, use_dedicated_aws_servers, use_player_hosted)
	end
end

VersusMechanism.is_local_match = function (self)
	return self._local_match
end

VersusMechanism.is_private_lobby = function (self)
	return self._private_lobby
end

VersusMechanism.using_dedicated_servers = function (self)
	return self._using_dedicated_servers, self._using_dedicated_aws_servers
end

VersusMechanism.using_player_hosted = function (self)
	return self._using_player_hosted
end

local dummy_members_table = {}

local function register_chat_channel_for_party(channel_id, party_id)
	local function member_func()
		table.clear(dummy_members_table)

		local reservation_handler = Managers.mechanism:get_slot_reservation_handler()

		if reservation_handler.supports_syncing then
			local peers = reservation_handler:peers_by_party(party_id)

			table.append(dummy_members_table, peers)
		else
			local party = Managers.party:get_party(party_id)
			local occupied_slots = party.occupied_slots

			for i = 1, #occupied_slots do
				local status = occupied_slots[i]

				if status.is_player then
					dummy_members_table[#dummy_members_table + 1] = status.peer_id
				end
			end
		end

		return dummy_members_table
	end

	Managers.chat:register_channel(channel_id, member_func)
end

VersusMechanism.get_chat_channel = function (self, peer_id, alt_chat_input)
	if not self._message_targets_initiated then
		return
	end

	if alt_chat_input then
		return 1, CHAT_MESSAGE_TARGETS.all.message_target
	end

	local _, party_id = Managers.party:get_party_from_player_id(peer_id, 1)

	if party_id == 1 then
		return 2, CHAT_MESSAGE_TARGETS.team.message_target
	elseif party_id == 2 then
		return 3, CHAT_MESSAGE_TARGETS.team.message_target
	else
		return 1, CHAT_MESSAGE_TARGETS.all.message_target
	end
end

VersusMechanism.register_chats = function (self)
	if self._message_targets_initiated or not Managers.chat then
		return
	end

	register_chat_channel_for_party(2, 1)
	register_chat_channel_for_party(3, 2)

	for _, message_target_data in pairs(CHAT_MESSAGE_TARGETS) do
		Managers.chat:add_message_target(message_target_data.message_target, message_target_data.message_target_type, message_target_data.message_target_key)
	end

	self._message_targets_initiated = true
end

VersusMechanism.unregister_chats = function (self)
	if not self._message_targets_initiated or not Managers.chat then
		return
	end

	Managers.chat:unregister_channel(2)
	Managers.chat:unregister_channel(3)

	for _, message_target_data in pairs(CHAT_MESSAGE_TARGETS) do
		Managers.chat:remove_message_target(message_target_data.message_target)
	end

	self._message_targets_initiated = false
end

VersusMechanism.try_reserve_game_server_slots = function (self, reserver, peers, invitee)
	local success = self._slot_reservation_handler:try_reserve_slots(reserver, peers, invitee)

	if not success then
		print("[VersusMechanism] Rejected game server reservation because the server is full")
	elseif self._state == "inn" then
		local game_mode_manager = Managers.state.game_mode

		if not game_mode_manager then
			print("[VersusMechanism] Rejected game server reservation because the server has not finished setting up.")

			return false
		end

		if DEDICATED_SERVER then
			local game_mode = game_mode_manager:game_mode()

			if game_mode and game_mode.update_auto_force_start_conditions then
				game_mode:update_auto_force_start_conditions(peers)
			end
		end
	end

	return success
end

VersusMechanism.get_slot_reservation_handler = function (self)
	return self._slot_reservation_handler
end

VersusMechanism.num_dedicated_reserved_slots_changed = function (self, num_reserved_slots, num_slots_total, dedicated_server_peer_id)
	print("num_dedicated_reserved_slots_changed", num_reserved_slots, num_slots_total)

	self._num_reserved_slots = num_reserved_slots
	self._num_total_slots = num_slots_total
end

VersusMechanism.reset_dedicated_slots_count = function (self)
	self._num_reserved_slots = 0
	self._num_total_slots = 0

	local member_info_by_party = self._member_info_by_party

	for party_id = 1, #member_info_by_party do
		local data = member_info_by_party[party_id]

		for i = 1, #data.members do
			data.states[i] = "unreserved"
			data.members[i] = ""
		end
	end

	self._server_id = nil
end

VersusMechanism.get_dedicated_slot_info = function (self)
	return self._num_reserved_slots, self._num_total_slots, self._member_info_by_party, self._server_id
end

VersusMechanism.rpc_sync_vs_custom_game_slot_data = function (self, channel_id, reserved_peers, reserved_peers_party_ids, friend_party_ids, party_leaders)
	if self._slot_reservation_handler then
		printf("[VersusMechanism] 'rpc_sync_vs_custom_game_slot_data' received from peer %s", CHANNEL_TO_PEER_ID[channel_id])
		self._slot_reservation_handler:update_slots(reserved_peers, reserved_peers_party_ids, friend_party_ids, party_leaders)
	end
end

VersusMechanism.rpc_request_slot_reservation_sync = function (self, channel_id)
	if self._slot_reservation_handler and self._slot_reservation_handler.slot_reservation_sync_requested then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self._slot_reservation_handler:slot_reservation_sync_requested(peer_id)
	end
end

VersusMechanism.dedicated_party_slot_status_changed = function (self, server_name, party_id, party_members_names, party_member_state)
	self._server_id = server_name

	local member_info_by_party = self._member_info_by_party
	local member_info = member_info_by_party[party_id]

	if not member_info then
		self:_create_party_info()

		member_info = self._member_info_by_party[party_id]
	end

	if not member_info then
		return
	end

	local members = member_info.members
	local states = member_info.states

	for i = 1, #party_members_names do
		members[i] = party_members_names[i]

		local state = party_member_state[i]

		if state == 1 then
			states[i] = "unreserved"
		elseif state == 2 then
			states[i] = "client"
		elseif state == 3 then
			states[i] = "group_leader_client"
		end
	end
end

VersusMechanism.game_server_slot_reservation_expired = function (self, peer_id)
	local remove_safe = true
	local unit_test = false

	self._slot_reservation_handler:unreserve_slot(peer_id, unit_test, remove_safe)
end

VersusMechanism.force_start_dedicated_server = function (self)
	if DEDICATED_SERVER then
		print("dedicated: got force start from a lobby host")

		self._force_start_dedicated_server = true
	else
		local dedicated_server_peer_id = Managers.mechanism:dedicated_server_peer_id()
		local channel_id = PEER_ID_TO_CHANNEL[dedicated_server_peer_id]

		if channel_id then
			print("Host sending request to dedicated server, to force start the game")
			RPC.rpc_force_start_dedicated_server(channel_id)
		else
			print("Host trying to tell dedicated to force start server, but no dedicated peer id was found")
		end
	end
end

VersusMechanism.switch_level_dedicated_server = function (self, level_key, from_dedicated_server)
	local level_id = 0

	if level_key then
		level_id = NetworkLookup.level_keys[level_key]
	end

	self._level_override_key = level_key

	print("set level override key:", level_key)

	if DEDICATED_SERVER then
		self._slot_reservation_handler:send_rpc_to_all_reserving_clients("rpc_switch_level_dedicated_server", level_id)
	else
		local dedicated_server_peer_id = Managers.mechanism:dedicated_server_peer_id()

		if dedicated_server_peer_id and not from_dedicated_server then
			local channel_id = PEER_ID_TO_CHANNEL[dedicated_server_peer_id]

			RPC.rpc_switch_level_dedicated_server(channel_id, level_id)
		end
	end
end

VersusMechanism.handle_ingame_enter = function (self, game_mode)
	local level_settings = LevelSettings[Managers.level_transition_handler:get_current_level_key()]

	if not self._shared_state and not level_settings.hub_level and Managers.mechanism:is_server() then
		self:_setup_match()

		if not DEDICATED_SERVER then
			self._slot_reservation_handler:update_slot_settings(Managers.party:parties())
		end
	end
end

VersusMechanism.get_level_override_key = function (self)
	return self._level_override_key
end

VersusMechanism.should_game_server_start_game = function (self)
	if self._force_start_dedicated_server then
		return true
	end

	return self._slot_reservation_handler:is_fully_reserved()
end

VersusMechanism.game_server_reservers = function (self)
	return self._slot_reservation_handler:reservers()
end

VersusMechanism.is_all_reserved_peers_joined = function (self, members_map)
	return self._slot_reservation_handler:is_all_reserved_peers_joined(members_map)
end

VersusMechanism.handle_party_assignment_for_joining_peer = function (self, peer_id, local_player_id)
	local game_mode_manager = Managers.state.game_mode
	local game_mode = game_mode_manager and game_mode_manager:game_mode()

	fassert(game_mode, "No game mode exists")

	local party_manager = Managers.party
	local reserved_party_id = Managers.mechanism:reserved_party_id_by_peer(peer_id)

	if not reserved_party_id then
		Crashify.print_exception("[VersusMechanism]", "Peer %s has not been assigned to a party before entering the game.", peer_id)

		reserved_party_id = Managers.mechanism:reserved_party_id_by_peer(peer_id)

		fassert(reserved_party_id, "[VersusMechanism] Peer %s could not be provided a party.", peer_id)
	end

	local _, current_party_id = party_manager:get_party_from_player_id(peer_id, local_player_id)
	local assigned_party_id

	if current_party_id == reserved_party_id or not party_manager:is_party_full(reserved_party_id) then
		assigned_party_id = reserved_party_id
	else
		local ignore_bots, ignore_none_game_participating_party = true, true
		local _, party_id = party_manager:get_least_filled_party(ignore_bots, ignore_none_game_participating_party)

		Crashify.print_exception("[VersusMechanism]", "Joining peer %s was not able to join their reserved party %s. Attempting to join %s instead", peer_id)

		assigned_party_id = party_id
	end

	return assigned_party_id
end

VersusMechanism.should_run_tutorial = function (self)
	return false, nil
end

VersusMechanism.win_conditions = function (self)
	return self._win_conditions
end

VersusMechanism.entered_mechanism_due_to_switch = function (self)
	Managers.chat:set_chat_enabled(true)
end

VersusMechanism.left_mechanism_due_to_switch = function (self)
	Managers.chat:set_chat_enabled(false)
end

VersusMechanism.should_play_level_introduction = function (self)
	local show_level_introduction = GameModeSettings.versus.show_level_introduction
	local state = self._state
	local show = show_level_introduction[state]

	return show ~= nil and show
end

VersusMechanism.get_custom_lobby_sort = function (self)
	return function (a, b)
		local a_server_info = a.server_info
		local b_server_info = b.server_info
		local a_num_players = a_server_info.num_players
		local b_num_players = b_server_info.num_players

		if a_num_players == b_num_players then
			local a_ping = a_server_info.ping
			local b_ping = b_server_info.ping
			local ping_diff = math.abs(a_ping - b_ping)

			if ping_diff <= 40 then
				local a_id = a_server_info.id or "ffffffffffffffff"
				local b_id = b_server_info.id or "ffffffffffffffff"

				return PlayerUtils.peer_id_compare(a_id, b_id)
			end

			return a_ping < b_ping
		end

		return b_num_players < a_num_players
	end
end

VersusMechanism.signal_reservers_to_join = function (self, t, network_server)
	local signaling_done = false

	if t > self._join_signaling_timer then
		local lobby_host = network_server.lobby_host
		local members_map = lobby_host:members():members_map()
		local all_reservers_are_a_member = true
		local reservers = self:game_server_reservers()

		for i = 1, #reservers do
			local peer_id = reservers[i]

			if not members_map[peer_id] then
				local party_id = self._slot_reservation_handler:party_id(peer_id)

				if party_id and party_id ~= 0 then
					local channel_id = PEER_ID_TO_CHANNEL[peer_id]

					if channel_id then
						printf("Sending rpc_join_reserved_game_server to %s", peer_id)
						RPC.rpc_join_reserved_game_server(channel_id)
					end

					all_reservers_are_a_member = false
				end
			end
		end

		signaling_done = all_reservers_are_a_member
		self._join_signaling_timer = t + 2
	end

	return signaling_done
end

VersusMechanism.get_current_set = function (self)
	return self._win_conditions:get_current_set()
end

VersusMechanism.get_current_spawn_group = function (self)
	return self:get_current_set()
end

VersusMechanism.get_map_start_section = function (self)
	return self:get_current_set()
end

VersusMechanism.is_last_set = function (self)
	return self:get_current_set() == self._num_sets
end

VersusMechanism.match_ended_early = function (self)
	local reason = self._game_round_ended_reason

	return reason == "party_one_won_early" or reason == "party_two_won_early", reason
end

VersusMechanism.get_game_round_ended_reason = function (self)
	return self._game_round_ended_reason, self._game_round_ended_reason_data
end

VersusMechanism.get_objective_settings = function (self)
	local level_key = Managers.level_transition_handler:get_current_level_key()

	return VersusObjectiveSettings[level_key] or {}
end

VersusMechanism.should_start_next_set = function (self)
	local last_set = self:is_last_set()

	return not last_set or self._win_conditions:get_current_round() % 2 == 1
end

VersusMechanism.num_sets = function (self)
	return self._num_sets
end

VersusMechanism.increment_total_rounds_started = function (self)
	self._total_rounds_started = self._total_rounds_started + 1
end

VersusMechanism.total_rounds_started = function (self)
	return self._total_rounds_started
end

VersusMechanism.match_id = function (self)
	return self._shared_state:get_match_id()
end

VersusMechanism.get_players_session_score = function (self, statistics_db, profile_synchronizer, saved_scoreboard_stats)
	return ScoreboardHelper.get_versus_stats(statistics_db, saved_scoreboard_stats)
end

VersusMechanism.sync_players_session_score = function (self, players_session_score, peer_ids, local_player_ids, scores)
	for _, player_data in pairs(players_session_score) do
		peer_ids[#peer_ids + 1] = player_data.peer_id
		local_player_ids[#local_player_ids + 1] = player_data.local_player_id

		local player_scores = player_data.scores
		local sorted_keys = table.keys(player_scores)

		table.sort(sorted_keys)

		for i = 1, #sorted_keys do
			local stat_name = sorted_keys[i]
			local score_value = player_scores[stat_name]

			scores[#scores + 1] = score_value
		end
	end
end

VersusMechanism.extract_players_session_score = function (self, num_players, num_stats_per_player, peer_ids, local_player_ids, unsynced_players_session_score, players_session_score)
	for _, player_data in pairs(unsynced_players_session_score) do
		local peer_id = player_data.peer_id
		local local_player_id = player_data.local_player_id

		for i = 1, num_players do
			if peer_id == peer_ids[i] and local_player_id == local_player_ids[i] then
				local player_scores = player_data.scores
				local sorted_keys = table.keys(player_scores)

				table.sort(sorted_keys)

				local start_value = (i - 1) * num_stats_per_player + 1
				local score_index = 1

				for j = start_value, start_value + num_stats_per_player - 1 do
					local key = sorted_keys[score_index]

					player_scores[key] = players_session_score[j]
					score_index = score_index + 1
				end

				break
			end
		end
	end
end

VersusMechanism.get_starting_level = function ()
	return HUB_LEVEL_NAME
end

VersusMechanism.set_saved_bot = function (self, party_id, slot_id, profile_index, career_index)
	local profile = SPProfiles[profile_index]

	assert(profile.affiliation == "heroes" or profile.affiliation == "spectators", "profile is not a hero")

	local saved_party_profiles = self._saved_bot_profiles[party_id]

	saved_party_profiles[slot_id] = {
		profile_index = profile_index,
		career_index = career_index,
	}
end

VersusMechanism.get_saved_bot = function (self, party_id, slot_id)
	local saved_party_profiles = self._saved_bot_profiles[party_id]
	local slot_bot_character = saved_party_profiles[slot_id]

	if slot_bot_character then
		return slot_bot_character.profile_index, slot_bot_character.career_index
	end
end

VersusMechanism.create_versus_migration_info = function (self, gm_event_end_conditions_met, gm_event_end_reason)
	local network_handler = Managers.mechanism:network_handler()
	local level_transition_handler = Managers.level_transition_handler
	local versus_migration_info = {
		friend_party = Managers.party:client_get_friend_party(),
	}
	local level_key = HUB_LEVEL_NAME
	local level_transition_handler = Managers.level_transition_handler
	local environment_variation_id = LevelHelper:get_environment_variation_id(level_key)
	local level_seed = Managers.mechanism:create_level_seed()
	local difficulty = level_transition_handler:get_current_difficulty()
	local difficulty_tweak = 0

	versus_migration_info.level_data = {
		level_key = level_key,
		environment_variation_id = environment_variation_id,
		level_seed = level_seed,
		difficulty = difficulty,
	}

	local is_private = "false"
	local matchmaking_type = NetworkLookup.matchmaking_types["n/a"]

	versus_migration_info.lobby_data = {
		is_private = is_private,
		difficulty = difficulty,
		selected_mission_id = level_key,
		mission_id = level_key,
		matchmaking_type = matchmaking_type,
	}

	return versus_migration_info
end

VersusMechanism.get_server_id = function (self)
	return self._server_id
end

VersusMechanism.set_peer_backend_id = function (self, peer_id, peer_backend_id)
	self._peer_backend_id[peer_id] = peer_backend_id
end

VersusMechanism.get_peer_backend_id = function (self, peer_id)
	return self._peer_backend_id[peer_id]
end

VersusMechanism.load_end_screen_resources = function (self)
	Managers.package:load("resource_packages/levels/dlcs/carousel/versus_dependencies", "end_screen_resource")
end

VersusMechanism.unload_end_screen_resources = function (self)
	Managers.package:unload("resource_packages/levels/dlcs/carousel/versus_dependencies", "end_screen_resource")
end

VersusMechanism._setup_match = function (self)
	if self._shared_state then
		self._shared_state:destroy()
	end

	local own_peer_id = Network.peer_id()
	local dedicated_server_peer_id = Managers.mechanism:dedicated_server_peer_id()
	local server_peer_id = Managers.mechanism:server_peer_id()
	local is_server

	if DEDICATED_SERVER then
		is_server = true
	elseif PEER_ID_TO_CHANNEL[dedicated_server_peer_id] then
		is_server = false
	else
		is_server = own_peer_id == server_peer_id
		dedicated_server_peer_id = nil

		if is_server then
			local own_backend_id = Managers.backend:player_id()

			self._peer_backend_id[own_peer_id] = own_backend_id
		end
	end

	printf("[VersusMechanism] Setting up match. Dedicated server id: %s, server id: %s, own id: %s", dedicated_server_peer_id, server_peer_id, own_peer_id)

	local network_handler = Managers.mechanism:network_handler()

	self._shared_state = SharedStateVersus:new(is_server, network_handler, dedicated_server_peer_id or server_peer_id, own_peer_id)

	self._shared_state:register_rpcs(self._network_event_delegate)

	if is_server then
		self._shared_state:generate_match_id()
	end

	self._shared_state:full_sync()

	self._num_sets = self:get_objective_settings().num_sets or 1

	if is_server then
		local network_server = Managers.state.network.network_server
		local peers = network_server:get_peers()

		for i = 1, #peers do
			if network_server:get_peer_initialized_mechanism(peers[i]) == Managers.mechanism:current_mechanism_name() then
				RPC.rpc_versus_setup_match(PEER_ID_TO_CHANNEL[peers[i]])
			end
		end
	end
end

VersusMechanism.rpc_versus_setup_match = function (self)
	self:_setup_match()
end

VersusMechanism.is_peer_fully_synced = function (self, peer_id)
	if self._shared_state then
		return self._shared_state:is_peer_fully_synced(peer_id)
	end

	return true
end

VersusMechanism.set_hero_cosmetics = function (self, peer_id, local_player_id, weapon_slot_name, weapon, weapon_pose, weapon_pose_skin, hero_skin, hat, pactsworn_cosmetics)
	self._shared_state:set_hero_cosmetics(peer_id, local_player_id, weapon_slot_name, weapon, weapon_pose, weapon_pose_skin, hero_skin, hat, pactsworn_cosmetics)
end

VersusMechanism.get_hero_cosmetics = function (self, peer_id, local_player_id)
	local existing_cosmetics_data = self._shared_state:get_hero_cosmetics(peer_id, local_player_id)
	local weapon = existing_cosmetics_data.weapon
	local weapon_pose, weapon_pose_skin = existing_cosmetics_data.weapon_pose, existing_cosmetics_data.weapon_pose_skin
	local hero_skin = existing_cosmetics_data.hero_skin
	local hat = existing_cosmetics_data.hat
	local pactsworn_cosmetics = existing_cosmetics_data.pactsworn_cosmetics

	return weapon, weapon_pose, weapon_pose_skin, hero_skin, hat, pactsworn_cosmetics
end

VersusMechanism.player_joined_party = function (self, peer_id, local_player_id, party_id, slot_id, is_bot)
	if Managers.mechanism:is_server() and self._slot_reservation_handler.player_joined_party then
		self._slot_reservation_handler:player_joined_party(peer_id, local_player_id, party_id, slot_id, is_bot)
	end
end

VersusMechanism.try_reserve_profile_for_peer_by_mechanism = function (self, profile_synchronizer, peer_id, profile_index, career_index, allow_switching)
	local profile = SPProfiles[profile_index]

	if profile.affiliation ~= "heroes" then
		return true
	end

	local party_id = self:reserved_party_id_by_peer(peer_id)

	if self._state == "inn" then
		return profile_synchronizer:try_reserve_profile_for_peer(party_id, peer_id, profile_index, career_index)
	end

	if not self._profiles_reservable then
		return true
	end

	local game_mode = Managers.state.game_mode
	local party_selection_logic = game_mode and game_mode.party_selection_logic and game_mode:party_selection_logic()

	if party_selection_logic then
		return true
	end

	if not allow_switching then
		local previous_profile_index, previous_career_index = Managers.mechanism:get_persistent_profile_index_reservation(peer_id)

		if previous_profile_index ~= 0 and previous_profile_index ~= profile_index then
			local reserved_by_peer = profile_synchronizer:get_profile_index_reservation(party_id, previous_profile_index)

			if not reserved_by_peer or reserved_by_peer == peer_id then
				return profile_synchronizer:try_reserve_profile_for_peer(party_id, peer_id, previous_profile_index, previous_career_index), previous_profile_index, previous_career_index
			end
		end
	end

	return profile_synchronizer:try_reserve_profile_for_peer(party_id, peer_id, profile_index, career_index)
end

VersusMechanism.reserved_party_id_by_peer = function (self, peer_id)
	return self._slot_reservation_handler:party_id_by_peer(peer_id)
end

VersusMechanism.remote_client_disconnected = function (self, peer_id)
	if self._slot_reservation_handler.remote_client_disconnected then
		self._slot_reservation_handler:remote_client_disconnected(peer_id)
	end
end

VersusMechanism.store_challenge_progression_status = function (self, force_store, optional_category)
	optional_category = optional_category or "area_selection_carousel_name"

	local entry_name = optional_category or "default"

	if force_store or not self._challenge_progression[entry_name] then
		self._challenge_progression[entry_name] = Managers.state.achievement:get_challenge_progression(optional_category)
	end
end

local RETURN_TABLE = {}

VersusMechanism.get_stored_challenge_progression_status = function (self, optional_category)
	if optional_category then
		return self._challenge_progression[optional_category]
	end

	table.clear(RETURN_TABLE)

	for _, data in pairs(self._challenge_progression) do
		table.merge(RETURN_TABLE, data)
	end

	return RETURN_TABLE
end

VersusMechanism.clear_stored_challenge_progression_status = function (self)
	table.clear(self._challenge_progression)
end

VersusMechanism.cache_horde_ability_charge_data = function (self, server_player_data)
	if not self._horde_ability_charges then
		self._horde_ability_charges = {}
	end

	for peer_id, data in pairs(server_player_data) do
		if data.ability_charge then
			self._horde_ability_charges[peer_id] = data.ability_charge
		end
	end
end

VersusMechanism._clear_horde_ability_data = function (self, server_player_data)
	if self._horde_ability_charges then
		table.clear(self._horde_ability_charges)
	end
end

VersusMechanism.get_cached_horde_ability_charges = function (self, peer_id)
	if self._horde_ability_charges and self._horde_ability_charges[peer_id] then
		local ability_charge = self._horde_ability_charges[peer_id]

		self._horde_ability_charges[peer_id] = nil

		return ability_charge
	end
end

VersusMechanism.override_loading_screen_music = function (self)
	local music_override
	local music_override_settings = dlc_settings.music_overrides

	if self._win_conditions:get_current_round() > 0 and dlc_settings.music_overrides.versus_between_rounds then
		music_override = music_override_settings.versus_between_rounds
	else
		local level_key = Managers.level_transition_handler:get_current_level_key()

		music_override = music_override_settings[level_key]
	end

	return music_override
end
