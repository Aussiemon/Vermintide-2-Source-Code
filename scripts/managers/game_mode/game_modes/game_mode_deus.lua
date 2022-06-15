require("scripts/managers/game_mode/game_modes/game_mode_base")
require("scripts/managers/game_mode/spawning_components/deus_spawning")
require("scripts/settings/dlcs/morris/deus_soft_currency_settings")
require("scripts/utils/hash_utils")

local REAL_PLAYER_LOCAL_ID = 1
local INTRO_VO_DIALOGUE_PROFILE = "ferry_lady"
local INTRO_VO_VOLUME_ID = "volume_intro_vo"

local function play_curse_intro_vo(vo_unit, curse)
	local dialogue_input = ScriptUnit.extension_input(vo_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	if curse then
		dialogue_input:trigger_dialogue_event("curse_intro", event_data)
	else
		dialogue_input:trigger_dialogue_event("no_curse_intro", event_data)
	end
end

GameModeDeus = class(GameModeDeus, GameModeBase)

GameModeDeus.init = function (self, settings, world, network_server, is_server, profile_synchronizer, level_key, statistics_db, game_mode_settings)
	GameModeDeus.super.init(self, settings, world, network_server, is_server, profile_synchronizer, level_key, statistics_db)
	fassert(game_mode_settings, "game mode settings can not be nil")
	fassert(game_mode_settings.deus_run_controller, "game mode settings must provide a deus run controller")

	self.about_to_lose = false
	self.lost_condition_timer = nil
	self._adventure_profile_rules = AdventureProfileRules:new(self._profile_synchronizer, self._network_server)
	local hero_side = Managers.state.side:get_side_from_name("heroes")
	self._mutators = game_mode_settings.mutators
	self._deus_run_controller = game_mode_settings.deus_run_controller
	self._deus_spawning = DeusSpawning:new(self._profile_synchronizer, hero_side, self._is_server, self._network_server, self._deus_run_controller)

	self:_register_player_spawner(self._deus_spawning)

	self._bot_players = {}

	self:_setup_bot_spawn_priority_lookup()

	self._available_profiles = table.clone(PROFILES_BY_AFFILIATION.heroes)
	local event_manager = Managers.state.event

	event_manager:register(self, "level_start_local_player_spawned", "event_local_player_spawned")

	self._local_player_spawned = false
end

GameModeDeus.on_round_end = function (self)
	local volume_system = Managers.state.entity:system("volume_system")
	local level = LevelHelper:current_level(self._world)
	local has_volume = Level.has_volume(level, INTRO_VO_VOLUME_ID)

	if volume_system and has_volume then
		volume_system:unregister_volume(INTRO_VO_VOLUME_ID)
	end
end

GameModeDeus.destroy = function (self)
	return
end

GameModeDeus.cleanup_game_mode_units = function (self)
	local update_safe = false

	self:_clear_bots(update_safe)
end

GameModeDeus.register_rpcs = function (self, network_event_delegate, network_transmit)
	GameModeDeus.super.register_rpcs(self, network_event_delegate, network_transmit)
	self._deus_spawning:register_rpcs(network_event_delegate, network_transmit)
end

GameModeDeus.unregister_rpcs = function (self)
	self._deus_spawning:unregister_rpcs()
	GameModeDeus.super.unregister_rpcs(self)
end

GameModeDeus.event_local_player_spawned = function (self, is_initial_spawn)
	self._local_player_spawned = true
	self._is_initial_spawn = is_initial_spawn
end

GameModeDeus.update = function (self, t, dt)
	self._deus_spawning:update(t, dt)
end

GameModeDeus.server_update = function (self, t, dt)
	GameModeDeus.super.server_update(self, t, dt)
	self:_handle_bots(t, dt)
	self._deus_spawning:server_update(t, dt)
	self:_update_morris_music_intensity()
end

GameModeDeus.evaluate_end_conditions = function (self, round_started, dt, t, mutator_handler)
	if script_data.disable_gamemode_end then
		return false
	end

	if self._won then
		return true, "won"
	end

	local party = Managers.state.side:get_party_from_side_name("heroes")
	local human_players_present = false
	local occupied_slots = party.occupied_slots

	for i = 1, #occupied_slots, 1 do
		human_players_present = human_players_present or not occupied_slots[i].is_bot
	end

	if not human_players_present then
		return false
	end

	local ignore_bots = true
	local humans_dead = GameModeHelper.side_is_dead("heroes", ignore_bots)
	local players_disabled = GameModeHelper.side_is_disabled("heroes") and not GameModeHelper.side_delaying_loss("heroes")
	local mutator_lost, mutator_lost_delay = mutator_handler:evaluate_lose_conditions()
	local lost = not self._lose_condition_disabled and (mutator_lost or humans_dead or players_disabled or self._level_failed or self:_is_time_up())

	if self.about_to_lose then
		if lost then
			if self.lost_condition_timer < t then
				return true, "lost"
			else
				return false
			end
		else
			self.about_to_lose = nil
			self.lost_condition_timer = nil
		end
	end

	local won = false

	if lost then
		self.about_to_lose = true

		if mutator_lost and mutator_lost_delay then
			self.lost_condition_timer = t + mutator_lost_delay
		elseif humans_dead then
			self.lost_condition_timer = t + GameModeSettings.adventure.lose_condition_time_dead
		else
			self.lost_condition_timer = t + GameModeSettings.adventure.lose_condition_time
		end

		return false
	elseif self:update_end_level_areas() then
		won = true
	elseif self._level_completed then
		if Managers.deed:has_deed() and Managers.deed:is_session_faulty() then
			return true, "lost"
		else
			won = true
		end
	end

	if won then
		return true, "won"
	end

	return false
end

GameModeDeus.gm_event_end_conditions_met = function (self, reason, checkpoint_available, percentages_completed)
	local deus_run_controller = self._deus_run_controller
	local player_manager = Managers.player

	for _, player in pairs(player_manager:players()) do
		local statistics_db = self._statistics_db
		local peer_id = player:network_id()
		local local_player_id = player:local_player_id()

		deus_run_controller:save_persisted_score(statistics_db, peer_id, local_player_id)
	end

	local scoreboard = ScoreboardHelper.get_grouped_topic_statistics(self._statistics_db, self._profile_synchronizer, {})

	deus_run_controller:save_scoreboard(scoreboard)

	local current_node = deus_run_controller:get_current_node()
	local level_type = current_node.level_type

	if level_type ~= "ARENA" then
		local wwise_world = Managers.world:wwise_world(self._world)

		WwiseWorld.trigger_event(wwise_world, "Play_morris_run_level_complete")
	end
end

GameModeDeus.player_entered_game_session = function (self, peer_id, local_player_id)
	GameModeDeus.super.player_entered_game_session(self, peer_id, local_player_id)
	self._adventure_profile_rules:handle_profile_delegation_for_joining_player(peer_id, local_player_id)
	self._deus_spawning:add_delayed_client(peer_id, local_player_id)
	self._deus_run_controller:restore_persisted_score(self._statistics_db, peer_id, local_player_id)
end

GameModeDeus.player_left_game_session = function (self, peer_id, local_player_id)
	GameModeDeus.super.player_left_game_session(self, peer_id, local_player_id)
	self._deus_spawning:remove_delayed_client(peer_id, local_player_id)
	self._deus_run_controller:save_persisted_score(self._statistics_db, peer_id, local_player_id)
end

GameModeDeus.remove_bot = function (self, peer_id, local_player_id, update_safe)
	local update_safe = update_safe or false

	if #self._bot_players > 0 then
		local profile_index = self._profile_synchronizer:profile_by_peer(peer_id, local_player_id)
		local removed, bot_player = self:_remove_bot_by_profile(self._bot_players, profile_index, update_safe)

		if not removed then
			bot_player = self._bot_players[#self._bot_players]

			self:_remove_bot(self._bot_players, #self._bot_players, update_safe)
		end

		return bot_player
	end
end

GameModeDeus.get_end_screen_config = function (self, game_won, game_lost, player)
	if Managers.mechanism:is_final_round() or game_lost then
		local statistics_db = self._statistics_db
		local journey_name = self._deus_run_controller:get_journey_name()
		local own_peer_id = self._deus_run_controller:get_own_peer_id()
		local profile_index, _ = self._deus_run_controller:get_player_profile(own_peer_id, REAL_PLAYER_LOCAL_ID)
		local local_player = Managers.player:local_player()
		local stats_id = local_player:stats_id()
		local previous_completed_difficulty_index = LevelUnlockUtils.completed_journey_difficulty_index(statistics_db, stats_id, journey_name)

		return (game_won and "deus_victory") or "defeat", {
			journey_name = journey_name,
			profile_index = profile_index,
			previous_completed_difficulty_index = previous_completed_difficulty_index
		}
	else
		local rewards = {}
		local granted_power_ups = self._deus_run_controller:try_grant_end_of_level_deus_power_ups()

		if granted_power_ups then
			for i = 1, #granted_power_ups, 1 do
				local granted_power_up = granted_power_ups[i]
				local reward = {
					type = "deus_power_up_end_of_level",
					sounds = {
						"hud_morris_weapon_chest_unlock",
						"morris_reliquarys_get_boon"
					},
					power_up = granted_power_up
				}
				rewards[#rewards + 1] = reward
			end
		end

		return "none", {}, {
			rewards = rewards
		}
	end
end

GameModeDeus.ended = function (self, reason)
	local all_peers_ingame = self._network_server:are_all_peers_ingame()

	if not all_peers_ingame then
		self._network_server:disconnect_joining_peers()
	end
end

GameModeDeus.local_player_ready_to_start = function (self, player)
	local peer_id = player.peer_id
	local local_player_id = player:local_player_id()
	local profile_index, career_index = self._deus_run_controller:get_player_profile(peer_id, REAL_PLAYER_LOCAL_ID)

	if profile_index == 0 or career_index == 0 then
		return false
	end

	local health_state = self._deus_run_controller:get_player_health_state(peer_id, local_player_id)

	if self._local_player_spawned or health_state == "dead" or health_state == "respawn" then
		return true
	end

	return false
end

GameModeDeus.local_player_game_starts = function (self, player, loading_context)
	local deus_run_controller = self._deus_run_controller
	local world = self._world
	local current_level = LevelHelper:current_level(world)
	local current_node = deus_run_controller:get_current_node()
	local theme = current_node.theme

	if self._is_initial_spawn then
		LevelHelper:flow_event(world, "local_player_spawned")
		LevelHelper:flow_event(world, "level_start_local_player_spawned")
	end

	local has_volume = Level.has_volume(current_level, INTRO_VO_VOLUME_ID)

	if self._is_server and has_volume and theme == DEUS_THEME_TYPES.BELAKOR then
		local volume_system = Managers.state.entity:system("volume_system")

		volume_system:register_volume(INTRO_VO_VOLUME_ID, "trigger_volume", {
			sub_type = "players_inside",
			on_triggered = function ()
				if self._enter_vo_has_triggered then
					return
				end

				local intro_vo_unit = LevelHelper:find_dialogue_unit(self._world, INTRO_VO_DIALOGUE_PROFILE)
				local dialogue_extension = intro_vo_unit and ScriptUnit.has_extension(intro_vo_unit, "dialogue_system")

				if dialogue_extension then
					self._enter_vo_has_triggered = true

					play_curse_intro_vo(intro_vo_unit, current_node.curse)
				else
					print("GameModeDeus:local_player_game_starts - No unit for curse intro vo")
				end
			end
		})
	end

	if not player.player_unit then
		local camera_system = Managers.state.entity:system("camera_system")

		camera_system:external_state_change(player, "observer", {})
	end

	local level_type = current_node.level_type

	if level_type == "ARENA" then
		local dialogue_system = Managers.state.entity:system("dialogue_system")

		dialogue_system:freeze_story_trigger()
	end

	local probe_tint = DeusThemeSettings[theme].light_probe_tint
	local color = Vector3(probe_tint[1], probe_tint[2], probe_tint[3])
	local units = Level.units(current_level)
	local num_units = #units

	for j = 1, num_units, 1 do
		local level_unit = units[j]
		local is_reflection_probe = Unit.is_a(level_unit, "core/stingray_renderer/helper_units/reflection_probe/reflection_probe")

		if is_reflection_probe then
			local num_lights = Unit.num_lights(level_unit)

			if num_lights then
				for i = 1, num_lights, 1 do
					local light = Unit.light(level_unit, i - 1)

					Light.set_color(light, color)
				end
			end
		end
	end

	Managers.state.event:trigger("local_player_game_starts")
end

GameModeDeus.disable_player_spawning = function (self)
	self._deus_spawning:set_spawning_disabled(true)
end

GameModeDeus.enable_player_spawning = function (self, safe_position, safe_rotation)
	self._deus_spawning:set_spawning_disabled(false)
	self._deus_spawning:force_update_spawn_positions(safe_position, safe_rotation)
end

GameModeDeus.teleport_despawned_players = function (self, position)
	self._deus_spawning:teleport_despawned_players(position)
end

GameModeDeus.flow_callback_add_spawn_point = function (self, unit)
	self._deus_spawning:add_spawn_point(unit)
end

GameModeDeus.set_override_respawn_group = function (self, respawn_group_name, active)
	self._deus_spawning:set_override_respawn_group(respawn_group_name, active)
end

GameModeDeus.set_respawn_group_enabled = function (self, respawn_group_name, active)
	self._deus_spawning:set_respawn_group_enabled(respawn_group_name, active)
end

GameModeDeus.set_respawn_gate_enabled = function (self, respawn_gate_unit, enabled)
	self._deus_spawning:set_respawn_gate_enabled(respawn_gate_unit, enabled)
end

GameModeDeus.respawn_unit_spawned = function (self, unit)
	self._deus_spawning:respawn_unit_spawned(unit)
end

GameModeDeus.get_respawn_handler = function (self)
	return self._deus_spawning:get_respawn_handler()
end

GameModeDeus.respawn_gate_unit_spawned = function (self, unit)
	self._deus_spawning:respawn_gate_unit_spawned(unit)
end

GameModeDeus.set_respawning_enabled = function (self, enabled)
	self._deus_spawning:set_respawning_enabled(enabled)
end

GameModeDeus.remove_respawn_units_due_to_crossroads = function (self, removed_path_distances, total_main_path_length)
	self._deus_spawning:remove_respawn_units_due_to_crossroads(removed_path_distances, total_main_path_length)
end

GameModeDeus.recalc_respawner_dist_due_to_crossroads = function (self)
	self._deus_spawning:recalc_respawner_dist_due_to_crossroads()
end

GameModeDeus.profile_changed = function (self, peer_id, local_player_id, profile_index, career_index)
	self._deus_spawning:profile_changed(peer_id, local_player_id, profile_index, career_index)
end

GameModeDeus.force_respawn = function (self, peer_id, local_player_id)
	local status = Managers.party:get_player_status(peer_id, local_player_id)

	if status.party_id == 0 then
		local party_id = 1

		Managers.party:assign_peer_to_party(peer_id, local_player_id, party_id)
	end

	self._deus_spawning:force_respawn(peer_id, local_player_id)
end

GameModeDeus.force_respawn_dead_players = function (self)
	self._deus_spawning:force_respawn_dead_players()
end

GameModeDeus._get_first_available_bot_profile = function (self)
	local available_profiles = self._available_profiles
	local profile_synchronizer = self._profile_synchronizer
	local available_profile_by_priority = {}

	for i = 1, #available_profiles, 1 do
		local profile_name = available_profiles[i]
		local profile_index = FindProfileIndex(profile_name)

		if not profile_synchronizer:is_profile_in_use(profile_index) then
			available_profile_by_priority[#available_profile_by_priority + 1] = profile_index
		end
	end

	local bot_profile_id_to_priority_id = self._bot_profile_id_to_priority_id

	table.sort(available_profile_by_priority, function (a, b)
		return (bot_profile_id_to_priority_id[a] or math.huge) < (bot_profile_id_to_priority_id[b] or math.huge)
	end)

	local profile_index = available_profile_by_priority[1]
	local profile = SPProfiles[profile_index]
	local display_name = profile.display_name
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local career_index = hero_attributes:get(display_name, "career")
	local bot_career_index = hero_attributes:get(display_name, "bot_career") or career_index or 1
	local career = profile.careers[bot_career_index]
	local hero_experience = hero_attributes:get(display_name, "experience") or 0
	local hero_level = ExperienceSettings.get_level(hero_experience)

	if not career or not career:is_unlocked_function(display_name, hero_level) then
		career_index = 1
		bot_career_index = 1

		hero_attributes:set(display_name, "career", career_index)
		hero_attributes:set(display_name, "bot_career", bot_career_index)
	end

	return profile_index, bot_career_index
end

GameModeDeus._setup_bot_spawn_priority_lookup = function (self)
	local saved_priority = PlayerData.bot_spawn_priority
	local num_saved_priority = #saved_priority

	if LAUNCH_MODE == "game" then
		if num_saved_priority > 0 then
			self._bot_profile_id_to_priority_id = {}

			for i = 1, num_saved_priority, 1 do
				local profile_id = saved_priority[i]
				self._bot_profile_id_to_priority_id[profile_id] = i
			end
		else
			self._bot_profile_id_to_priority_id = ProfileIndexToPriorityIndex
		end
	elseif LAUNCH_MODE == "attract_benchmark" then
		self._bot_profile_id_to_priority_id = ProfileIndexToPriorityIndex
	else
		self._bot_profile_id_to_priority_id = ProfileIndexToPriorityIndex
	end
end

GameModeDeus._handle_bots = function (self, t, dt)
	local in_session = Managers.state.network ~= nil and not Managers.state.network.game_session_shutdown

	if not in_session then
		return
	end

	if script_data.ai_bots_disabled then
		if #self._bot_players > 0 then
			local update_safe = true

			self:_clear_bots(update_safe)
		end

		return
	end

	local party = Managers.party:get_party(1)
	local num_slots = party.num_slots
	local max_bots = num_slots

	if script_data.cap_num_bots then
		max_bots = math.min(max_bots, script_data.cap_num_bots)
	end

	local bot_players = self._bot_players
	local num_bot_players = #bot_players
	local delta = max_bots - num_bot_players

	if delta > 0 then
		local num_used_slots = party.num_used_slots
		local open_slots = num_slots - num_used_slots
		local num_bots_to_add = math.min(delta, open_slots)

		for i = 1, num_bots_to_add, 1 do
			self:_add_bot(bot_players)
		end
	elseif delta < 0 then
		local num_bots_to_remove = math.abs(delta)

		for i = 1, num_bots_to_remove, 1 do
			local update_safe = true

			self:_remove_bot(bot_players, #bot_players, update_safe)
		end
	end
end

GameModeDeus._add_bot = function (self, bot_players)
	local party_id = 1
	local party = Managers.party:get_party(party_id)
	local profile_index, career_index = self:_get_first_available_bot_profile(party)

	if LAUNCH_MODE == "attract_benchmark" then
		career_index = 1
	end

	local bot_player = self:_add_bot_to_party(party_id, profile_index, career_index)
	bot_players[#bot_players + 1] = bot_player
	local peer_id = bot_player:network_id()
	local local_player_id = bot_player:local_player_id()

	self._deus_run_controller:restore_persisted_score(self._statistics_db, peer_id, local_player_id)
end

GameModeDeus._remove_bot = function (self, bot_players, index, update_safe)
	local bot_player = bot_players[index]

	fassert(bot_player, "No bot player at index (%s)", tostring(index))

	local peer_id = bot_player:network_id()
	local local_player_id = bot_player:local_player_id()

	self._deus_run_controller:save_persisted_score(self._statistics_db, peer_id, local_player_id)

	if update_safe then
		self:_remove_bot_update_safe(bot_player)
	else
		self:_remove_bot_instant(bot_player)
	end

	local last = #bot_players
	bot_players[index] = bot_players[last]
	bot_players[last] = nil
end

GameModeDeus._remove_bot_by_profile = function (self, bot_players, profile_index, update_safe)
	local bot_index = nil
	local num_current_bots = #bot_players

	for i = 1, num_current_bots, 1 do
		local bot_player = bot_players[i]
		local bot_profile_index = bot_player:profile_index()

		if bot_profile_index == profile_index then
			bot_index = i

			break
		end
	end

	local bot_player = nil
	local removed = false

	if bot_index then
		bot_player = bot_players[bot_index]

		self:_remove_bot(bot_players, bot_index, update_safe or false)

		removed = true
	end

	return removed, bot_player
end

GameModeDeus._clear_bots = function (self, update_safe)
	local bot_players = self._bot_players
	local num_bot_players = #bot_players

	for i = num_bot_players, 1, -1 do
		self:_remove_bot(bot_players, i, update_safe)
	end
end

GameModeDeus.get_active_respawn_units = function (self)
	return self._deus_spawning:get_active_respawn_units()
end

GameModeDeus.get_player_wounds = function (self, profile)
	if Managers.state.game_mode:has_activated_mutator("instant_death") then
		return 1
	end

	local difficulty_manager = Managers.state.difficulty
	local difficulty_settings = difficulty_manager:get_difficulty_settings()

	return difficulty_settings.wounds
end

GameModeDeus.mutators = function (self)
	return self._mutators
end

GameModeDeus.on_picked_up_soft_currency = function (self, interactable_unit, interactor_unit)
	local deus_run_controller = self._deus_run_controller
	local granted_coins_amount, type = self:_get_coins_amount_and_type(interactable_unit)
	local player_manager = Managers.player
	local interactor_player = player_manager:unit_owner(interactor_unit)

	if interactor_player.bot_player or interactor_player.remote then
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_2d_audio_event("hud_morris_currency_added")
	else
		local wwise_world = Managers.world:wwise_world(self._world)

		WwiseWorld.trigger_event(wwise_world, "hud_morris_pickup_chest")
	end

	local local_player = Managers.player:local_player()
	local player_unit = local_player and local_player.player_unit
	local buff_extension = player_unit and ScriptUnit.has_extension(player_unit, "buff_system")

	if buff_extension then
		granted_coins_amount = buff_extension:apply_buffs_to_value(granted_coins_amount, "deus_coins_greed")
		granted_coins_amount = math.floor(granted_coins_amount)
	end

	deus_run_controller:on_soft_currency_picked_up(granted_coins_amount, type)

	if UISettings.deus.show_coin_pickup_in_chat then
		local interactor_name = nil

		if interactor_player:is_player_controlled() then
			interactor_name = deus_run_controller:get_player_name(interactor_player.peer_id)
		else
			interactor_name = interactor_player:name()
		end

		local pop_chat = true
		local message = nil

		if not interactor_player.bot_player and not interactor_player.remote then
			message = string.format(Localize("system_chat_local_player_picked_up_deus_currency"), granted_coins_amount)
		else
			message = string.format(Localize("system_chat_other_player_picked_up_deus_currency"), interactor_name, granted_coins_amount)
		end

		Managers.chat:add_local_system_message(1, message, pop_chat)
	end
end

GameModeDeus.get_boss_loot_pickup = function (self)
	return "deus_soft_currency"
end

GameModeDeus._get_coins_amount_and_type = function (self, interactable_unit)
	local pickup_extension = ScriptUnit.has_extension(interactable_unit, "pickup_system")

	if not pickup_extension then
		return 0
	end

	local deus_run_controller = self._deus_run_controller
	local current_node = deus_run_controller:get_current_node()
	local pickups_seed = current_node.system_seeds.pickups or 0
	local seed = HashUtils.fnv32_hash(Managers.state.unit_storage:go_id(interactable_unit) .. "_" .. pickups_seed)
	local _, random = Math.next_random(seed)
	local ingame_players = #deus_run_controller:get_peers()
	local dropped_by_breed = pickup_extension:get_dropped_by_breed()
	local loot_amount_settings = DeusSoftCurrencySettings.loot_amount[dropped_by_breed]
	local loot_amount_by_player = loot_amount_settings[ingame_players] or loot_amount_settings[#loot_amount_settings]
	local min_amount = loot_amount_by_player.min
	local max_amount = loot_amount_by_player.max
	local coins_amount = math.lerp(min_amount, max_amount, random)
	local type = nil

	if not dropped_by_breed or dropped_by_breed == "n/a" then
		type = DeusSoftCurrencySettings.types.GROUND
	else
		type = DeusSoftCurrencySettings.types.MONSTER
	end

	return math.round(coins_amount), type
end

GameModeDeus.players_left_safe_zone = function (self)
	local mechanism = Managers.mechanism:game_mechanism()
	local theme = mechanism and mechanism:get_current_node_theme()

	if theme == DEUS_THEME_TYPES.BELAKOR then
		return
	end

	local intro_vo_unit = LevelHelper:find_dialogue_unit(self._world, INTRO_VO_DIALOGUE_PROFILE)
	local dialogue_extension = intro_vo_unit and ScriptUnit.has_extension(intro_vo_unit, "dialogue_system")

	if dialogue_extension then
		local node = self._deus_run_controller:get_current_node()
		local curse = node.curse

		play_curse_intro_vo(intro_vo_unit, curse)
	else
		print("GameModeDeus:players_left_safe_zone - no unit for curse intro vo")
	end
end

GameModeDeus._update_morris_music_intensity = function (self)
	local conflict_director = Managers.state.conflict
	local pacing = conflict_director.pacing
	local intensity = pacing.total_intensity
	local audio_system = Managers.state.entity:system("audio_system")
	local parameter_id = NetworkLookup.global_parameter_names.morris_music_intensity
	local clamped_intensity = math.round(math.clamp(intensity, 0, 100))

	if self._sent_intensity and self._sent_intensity == clamped_intensity then
		return
	end

	audio_system:set_global_parameter_with_lerp("morris_music_intensity", clamped_intensity)

	if self._network_transmit then
		self._network_transmit:send_rpc_clients("rpc_client_audio_set_global_parameter_with_lerp", parameter_id, clamped_intensity / 100)
	end

	self._sent_intensity = clamped_intensity
end

return
