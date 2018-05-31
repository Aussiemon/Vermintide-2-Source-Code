require("scripts/settings/experience_settings")
require("scripts/settings/progression_unlocks")
require("scripts/settings/equipment/loot_chest_data_1")
require("scripts/settings/controller_settings")
require("scripts/settings/profiles/sp_profiles")
require("scripts/settings/material_effect_mappings")
require("scripts/settings/player_data")
require("scripts/settings/unit_gib_settings")
require("scripts/settings/unit_variation_settings")
require("scripts/helpers/level_helper")
require("scripts/utils/edit_ai_utility")
require("scripts/utils/keystroke_helper")
require("scripts/game_state/components/dice_keeper")
require("scripts/ui/views/loading_view")
require("scripts/entity_system/systems/mission/rewards")
require("scripts/ui/views/level_end/level_end_view_wrapper")

StateInGameRunning = class(StateInGameRunning)
StateInGameRunning.NAME = "StateInGameRunning"

StateInGameRunning.on_enter = function (self, params)
	GarbageLeakDetector.register_object(self, "StateInGameRunning")

	self.world = self.parent.world
	local viewport_name = params.viewport_name
	self.viewport_name = viewport_name
	self.world_name = params.world_name
	self.is_server = params.is_server
	self._lobby_host = params.lobby_host
	self._lobby_client = params.lobby_client
	self._network_options = params.network_options
	self.statistics_db = params.statistics_db
	self.profile_synchronizer = params.profile_synchronizer
	self.level_transition_handler = params.level_transition_handler
	self.network_server = params.network_server
	self.network_client = params.network_client
	local input_manager = params.input_manager
	self.input_manager = input_manager
	self.is_in_inn = params.is_in_inn
	self.is_in_tutorial = params.is_in_tutorial
	self.end_conditions_met = false
	self._booted_eac_untrusted = script_data["eac-untrusted"]

	if self.is_in_tutorial then
		input_manager:create_input_service("Tutorial", "TutorialPlayerControllerKeymaps", "TutorialPlayerControllerFilters")
		input_manager:map_device_to_service("Tutorial", "keyboard")
		input_manager:map_device_to_service("Tutorial", "mouse")
		input_manager:map_device_to_service("Tutorial", "gamepad")
	end

	input_manager:create_input_service("Player", "PlayerControllerKeymaps", "PlayerControllerFilters")
	input_manager:map_device_to_service("Player", "keyboard")
	input_manager:map_device_to_service("Player", "mouse")
	input_manager:map_device_to_service("Player", "gamepad")

	self.player_index = params.player
	local input_source = self.input_manager:get_service("Player")
	local player_manager = Managers.player
	local peer_id = Network.peer_id()
	local local_player_id = params.local_player_id
	local player = Managers.player:player(peer_id, local_player_id)
	local stats_id = player:stats_id()
	player.input_source = input_source
	self.local_player_id = local_player_id
	self.player = player

	if self.is_server then
		player:create_game_object()
		player:create_boon_handler(self.world)
	end

	if self.is_server and Managers.state.room and not Managers.state.room:has_room(peer_id) then
		Managers.state.room:create_room(peer_id, 1)
	end

	local entity_manager = Managers.state.entity
	local camera_system = entity_manager:system("camera_system")
	local outline_system = entity_manager:system("outline_system")
	local fade_system = entity_manager:system("fade_system")
	local sound_sector_system = entity_manager:system("sound_sector_system")
	local sound_environment_system = entity_manager:system("sound_environment_system")

	camera_system:local_player_created(player)
	outline_system:local_player_created(player)
	fade_system:local_player_created(player)
	sound_sector_system:local_player_created(player)
	sound_environment_system:local_player_created(player)

	local event_manager = Managers.state.event

	event_manager:register(self, "game_started", "event_game_started")
	event_manager:register(self, "level_start_local_player_spawned", "event_local_player_spawned")
	event_manager:register(self, "checkpoint_vote_cancelled", "on_checkpoint_vote_cancelled")
	event_manager:register(self, "conflict_director_setup_done", "event_conflict_director_setup_done")
	event_manager:register(self, "close_ingame_menu", "event_close_ingame_menu")

	if PLATFORM == "xb1" then
		event_manager:register(self, "trigger_xbox_round_end", "event_trigger_xbox_round_end")
	end

	if self.is_server then
		Managers.state.event:trigger("game_started")
		Managers.smoketest:report("enter_ingame")
	end

	local level_key = params.level_key
	self.parent.parent.loading_context.last_level_id = params.level_key
	self.free_flight_manager = params.free_flight_manager

	self.free_flight_manager:set_teleport_override(function (pos, rot)
		for unit, _ in pairs(self.player.owned_units) do
			if ScriptUnit.has_extension(unit, "input_system") then
				local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

				locomotion_extension:teleport_to(pos, rot)
			end
		end
	end)

	local ingame_ui_context = {
		input_manager = input_manager,
		world_manager = Managers.world,
		level_transition_handler = params.level_transition_handler,
		camera_manager = Managers.state.camera,
		profile_synchronizer = params.profile_synchronizer,
		spawn_manager = Managers.state.spawn,
		player_manager = Managers.player,
		room_manager = Managers.state.room,
		is_server = params.is_server,
		is_in_inn = params.is_in_inn,
		is_in_tutorial = self.is_in_tutorial,
		network_lobby = self._lobby_host or self._lobby_client,
		network_event_delegate = params.network_event_delegate,
		peer_id = peer_id,
		player = player,
		local_player_id = local_player_id,
		dialogue_system = entity_manager:system("dialogue_system"),
		dice_keeper = params.dice_keeper,
		voting_manager = Managers.state.voting,
		time_manager = Managers.time,
		statistics_db = self.statistics_db,
		stats_id = stats_id,
		matchmaking_manager = Managers.matchmaking,
		network_server = params.network_server,
		chat_manager = Managers.chat,
		voip = params.voip
	}
	DamageUtils.is_in_inn = params.is_in_inn
	self.ingame_ui_context = ingame_ui_context

	self:create_ingame_ui(ingame_ui_context)

	local loading_context = self.parent.parent.loading_context
	loading_context.play_end_of_level_game = nil
	local quickplay_bonus = loading_context.quickplay_bonus
	self.game_mode_key = Managers.state.game_mode:game_mode_key()
	self.rewards = Rewards:new(level_key, self.game_mode_key, quickplay_bonus)
	local profile_index = self.profile_synchronizer:profile_by_peer(peer_id, local_player_id)
	local profile = SPProfiles[profile_index]
	local hero_name = profile.display_name
	self.level_end_view_context = {
		world_manager = Managers.world,
		is_server = params.is_server,
		is_quickplay = not not quickplay_bonus,
		peer_id = peer_id,
		local_player_hero_name = hero_name
	}
	self._level_end_view_wrapper = params.level_end_view_wrapper

	if self._level_end_view_wrapper then
		self._level_end_view_wrapper:game_state_changed()
	end

	loading_context.scoreboard_session_data = nil
	params.dice_keeper = nil
	local gdc_build = Development.parameter("gdc")

	if gdc_build then
		LevelHelper:flow_event(self.world, "gdc_build")
	end

	self.mood_timers = {}

	self:setup_mood_blackboard()

	if loading_context.loading_view then
		self.loading_view = loading_context.loading_view
		loading_context.loading_view = nil
		self.show_loading_view = true
	end

	Managers.state.camera:apply_level_particle_effects(LevelSettings[level_key].level_particle_effects, viewport_name)
	Managers.state.camera:apply_level_screen_effects(LevelSettings[level_key].level_screen_effects, viewport_name)

	if PLATFORM == "ps4" then
		Managers.account:set_realtime_multiplay_state("pre_game", true)
	end

	if Managers.chat:chat_is_focused() then
		Managers.chat.chat_gui:block_input()
	end

	if Development.parameter("attract_mode") then
		self._benchmark_handler = BenchmarkHandler:new(self.ingame_ui, self.world)
	end

	if self.is_in_inn then
		Managers.state.achievement:setup_achievement_data()
	end
end

StateInGameRunning.create_ingame_ui = function (self, ingame_ui_context)
	if self.ingame_ui then
		self.ingame_ui:destroy()
	end

	self.ingame_ui = IngameUI:new(ingame_ui_context)

	Managers.state.entity:system("tutorial_system"):set_ingame_ui(self.ingame_ui)

	Managers.state.entity:system("mission_system").tutorial_ui = self.ingame_ui.ingame_hud.tutorial_ui
	Managers.state.entity:system("mission_system").mission_objective_ui = self.ingame_ui.ingame_hud.mission_objective
	Managers.state.entity:system("interactor_system").extension_init_context.ingame_ui = self.ingame_ui

	Managers.state.entity:system("hud_system"):set_ingame_ui(self.ingame_ui)

	local matchmaking = Managers.matchmaking

	if not matchmaking.popup_handler then
		matchmaking:set_popup_join_lobby_handler(self.ingame_ui.popup_join_lobby_handler)
		matchmaking:set_popup_handler(self.ingame_ui.popup_handler)
	end
end

StateInGameRunning._setup_end_of_level_UI = function (self)
	if script_data.disable_end_screens then
		Managers.state.network.network_transmit:send_rpc_server("rpc_is_ready_for_transition")
	else
		local game_won = not self.game_lost
		local players_session_score = ScoreboardHelper.get_grouped_topic_statistics(self.statistics_db, self.profile_synchronizer)
		local scoreboard_session_data = ScoreboardHelper.get_sorted_topic_statistics(self.statistics_db, self.profile_synchronizer)
		local level_end_view_context = self.level_end_view_context
		level_end_view_context.scoreboard_session_data = scoreboard_session_data
		level_end_view_context.players_session_score = players_session_score
		level_end_view_context.game_won = game_won
		level_end_view_context.game_mode_key = Managers.state.game_mode:game_mode_key()
		level_end_view_context.difficulty = Managers.state.difficulty:get_difficulty()

		if not self._booted_eac_untrusted then
			local level, base_experience = self.rewards:get_level_start()
			level_end_view_context.rewards = {
				end_of_level_rewards = table.clone(self.rewards:get_rewards()),
				level_start = {
					level,
					base_experience
				},
				mission_results = table.clone(self.rewards:get_mission_results())
			}
		end

		local mission_system = Managers.state.entity:system("mission_system")
		level_end_view_context.mission_system_data = {
			tome_mission_data = mission_system:get_level_end_mission_data("tome_bonus_mission"),
			grimoire_mission_data = mission_system:get_level_end_mission_data("grimoire_hidden_mission"),
			loot_dice_mission_data = mission_system:get_level_end_mission_data("bonus_dice_hidden_mission")
		}
		self.parent.parent.loading_context.level_end_view_context = level_end_view_context

		if PLATFORM == "ps4" then
			Managers.account:set_presence("dice_game")
			Managers.account:set_realtime_multiplay_state("end_screen", true)
		end

		if Managers.chat:chat_is_focused() then
			Managers.chat.chat_gui:block_input()
		end
	end

	self.level_end_view_context = nil
	self.has_setup_end_of_level = true
end

StateInGameRunning.level_end_view_wrapper = function (self)
	return self._level_end_view_wrapper
end

StateInGameRunning.server_start_leave_game_timer = function (self)
	local level_key = "inn_level"
	local time_until_level_transition = 45

	Managers.state.network.network_transmit:send_rpc_all("rpc_start_leave_game_countdown", time_until_level_transition)
	Managers.state.game_mode:start_specific_level(level_key, time_until_level_transition)
end

StateInGameRunning.handle_end_conditions = function (self)
	local game_mode_manager = Managers.state.game_mode

	if game_mode_manager and game_mode_manager:is_game_mode_ended() and game_mode_manager:is_game_mode_ended() then
	end
end

MOOD_BLACKBOARD = {}

StateInGameRunning.setup_mood_blackboard = function (self)
	for mood, _ in pairs(MoodSettings) do
		MOOD_BLACKBOARD[mood] = false
	end
end

StateInGameRunning.check_invites = function (self)
	if self.popup_id then
		return
	end

	if self.network_client and not self.network_client:is_ingame() then
		return
	end

	if self.network_server and not self.network_server:are_all_peers_ingame() then
		return
	end

	local invite_data = Managers.invite:get_invited_lobby_data()

	if invite_data then
		local platform = PLATFORM
		local lobby_id = invite_data.id or invite_data.name
		local current_lobby_id = nil

		if platform == "xb1" then
			current_lobby_id = (self._lobby_host and self._lobby_host.lobby._data.session_name) or self._lobby_client.lobby._data.session_name
		else
			current_lobby_id = (self._lobby_host and self._lobby_host:id()) or self._lobby_client:id()
		end

		local current_level = self.level_transition_handler.level_key

		if Managers.matchmaking:is_game_matchmaking() and self.network_server and current_level == "inn_level" then
			mm_printf("Found an invite, but was matchmaking.")

			self.popup_id = Managers.popup:queue_popup(Localize("popup_join_while_matchmaking"), Localize("popup_error_topic"), "ok", Localize("button_ok"))
		elseif lobby_id == current_lobby_id then
			mm_printf("Found an invite, but was already in lobby.")

			self.popup_id = Managers.popup:queue_popup(Localize("popup_already_in_same_lobby"), Localize("popup_error_topic"), "ok", Localize("button_ok"))
		elseif not Managers.play_go:installed() then
			mm_printf("Found an invite, but game was not fully installed.")

			self.popup_id = Managers.popup:queue_popup(Localize("popup_invite_not_installed"), Localize("popup_invite_not_installed_header"), "not_installed", Localize("menu_ok"))
		elseif self.network_server and not self.network_server:are_all_peers_ingame() then
			mm_printf("Found an invite, but someone is trying to join the game.")

			self.popup_id = Managers.popup:queue_popup(Localize("popup_join_blocked_by_joining_player"), Localize("popup_invite_not_installed_header"), "not_installed", Localize("menu_ok"))
		elseif self._lobby_client or not self.is_in_inn then
			self._invite_lobby_data = invite_data
		elseif not self.popup_id then
			Managers.matchmaking:request_join_lobby(invite_data, {
				friend_join = true
			})
		end
	end
end

StateInGameRunning.wanted_transition = function (self)
	if self.popup_id then
		return
	end

	if self.network_client and not self.network_client:is_ingame() then
		return
	end

	if self.network_server and not self.network_server:are_all_peers_ingame() then
		return
	end

	local wanted_transition, data = self.ingame_ui:get_transition()

	if wanted_transition then
		mm_printf("Doing transition %s from UI", wanted_transition)
	elseif self._invite_lobby_data then
		if self._invite_lobby_data.is_server_invite then
			mm_printf("Found a server invite, joining.")

			wanted_transition = "join_server"
		else
			mm_printf("Found a lobby invite, joining.")

			wanted_transition = "join_lobby"
		end

		data = self._invite_lobby_data
		self._invite_lobby_data = nil
	end

	if not wanted_transition then
		wanted_transition, data = Managers.matchmaking:get_transition()

		if wanted_transition then
			mm_printf("Matchmaking manager returned a wanted transition %s, doing it.", wanted_transition)
		end
	end

	if not wanted_transition and self.afk_kick then
		wanted_transition = "afk_kick"
	end

	wanted_transition = wanted_transition or Managers.state.game_mode:wanted_transition()

	if wanted_transition and PLATFORM == "xb1" and not self.is_in_inn and not self.is_in_tutorial then
		if Development.parameter("auto-host-level") ~= nil then
		elseif not self._xbox_event_end_triggered then
			Application.warning("MultiplyerRoundStart was triggered without end conditions met")
			self:_xbone_end_of_round_events(self.statistics_db)
		end
	end

	return wanted_transition, data
end

StateInGameRunning.on_end_screen_ui_complete = function (self)
	Managers.state.conflict:destroy_all_units()

	self.end_screen_ui_done = true
	self.waiting_for_transition = true

	if Managers.state.network:game() then
		Managers.state.network.network_transmit:send_rpc_server("rpc_is_ready_for_transition")
	end
end

StateInGameRunning.gm_event_end_conditions_met = function (self, reason, checkpoint_available, percentage_completed)
	if not self._spawn_initialized then
		Managers.transition:hide_loading_icon()
		Managers.transition:fade_out(GameSettings.transition_fade_in_speed)
	end

	local is_server = self.is_server
	local player = self.player
	self.end_conditions_met = true
	local level_key = Managers.state.game_mode:level_key()
	local game_mode_key = self.game_mode_key
	local game_won = reason and reason == "won"
	local game_lost = reason and reason == "lost"
	local ingame_ui = self.ingame_ui
	local stats_id = player:stats_id()
	local statistics_db = self.statistics_db
	local previous_completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_key) or 0

	ingame_ui:handle_transition("close_active")
	LoreBookHelper.save_new_pages()

	local mission_system = Managers.state.entity:system("mission_system")

	mission_system:set_percentage_completed(percentage_completed)

	if Managers.twitch then
		Managers.twitch:deactivate_twitch_game_mode()
	end

	local stats_interface = Managers.backend:get_interface("statistics")

	if game_mode_key == "survival" then
		if game_won then
			print("Game won")
			mission_system:evaluate_level_end_missions()
			StatisticsUtil.register_complete_survival_level(statistics_db)
			stats_interface:save()
		end
	elseif game_won then
		print("Game won")
		StatisticsUtil.register_complete_level(statistics_db)
		stats_interface:save()
	elseif game_lost then
		print("Game lost")

		self.checkpoint_available = checkpoint_available
	end

	local is_booted_unstrusted = self._booted_eac_untrusted

	local function callback()
		if game_mode_key ~= "inn" then
			local profile_synchronizer = self.profile_synchronizer
			local peer_id = Network.peer_id()
			local local_player_id = self.local_player_id
			local profile_index = profile_synchronizer:profile_by_peer(peer_id, local_player_id)
			local profile = SPProfiles[profile_index]
			local hero_name = profile.display_name

			if not is_booted_unstrusted then
				self.rewards:award_end_of_level_rewards(game_won, hero_name)
			end

			ingame_ui:activate_end_screen_ui(game_won, checkpoint_available, level_key, previous_completed_difficulty_index)

			if not is_booted_unstrusted then
				local difficulty_key = Managers.state.difficulty:get_difficulty()
				local chest_settings = LootChestData.chests_by_category[difficulty_key]
				local chests_package_name = chest_settings.package_name
				self.chests_package_name = chests_package_name

				Managers.package:load(chests_package_name, "global")
			end
		end
	end

	local backend_manager = Managers.backend

	if backend_manager:is_local() then
		backend_manager:commit(true)
		callback()
	else
		backend_manager:commit(true, callback)
	end

	self.game_lost = game_lost

	if self.is_in_inn or self.is_in_tutorial then
		return
	end

	if PLATFORM == "xb1" then
		if not self._xbox_event_end_triggered then
			self:_xbone_end_of_round_events(statistics_db)
		end

		if not self.is_in_inn and not self.is_in_tutorial then
			Managers.xbox_stats:update_hero_stats()
		end
	end
end

StateInGameRunning.on_checkpoint_vote_cancelled = function (self)
	self.checkpoint_vote_cancelled = true
end

StateInGameRunning._debug_update_rooms = function (self, dt, t)
	self._debug_room_handler_settings = self._debug_room_handler_settings or {
		tapped_players = {}
	}
	local settings = self._debug_room_handler_settings
	local room_manager = Managers.state.room

	if room_manager and self.is_server then
		local button = "f"
		local category = "rooms"

		for i = 1, 4, 1 do
			local tapped_player = settings.tapped_players[i]

			if not tapped_player and DebugKeyHandler.key_pressed(button .. tostring(i), "create room", category) then
				room_manager:create_room(i)

				settings.tapped_players[i] = {
					button = button .. tostring(i)
				}
			elseif tapped_player and DebugKeyHandler.key_pressed(tapped_player.button, "destroy room", category) then
				room_manager:destroy_room(i)

				settings.tapped_players[i] = nil
			end
		end
	end

	self._debug_room_handler_settings = settings
end

if PLATFORM ~= "win32" and (BUILD == "dev" or BUILD == "debug") then
	function RELOAD_CONTROLS()
		Managers.input:create_input_service("Player", "PlayerControllerKeymaps", "PlayerControllerFilters")
		Managers.input:map_device_to_service("Player", "keyboard")
		Managers.input:map_device_to_service("Player", "mouse")
		Managers.input:map_device_to_service("Player", "gamepad")

		local input_source = Managers.input:get_service("Player")
		local player = Managers.player:local_player()
		player.input_source = input_source
		local unit = player.player_unit
		local input_extension = ScriptUnit.extension(unit, "input_system")
		input_extension.input_service = input_source
	end
end

StateInGameRunning.update = function (self, dt, t)
	if DebugKeyHandler.key_pressed("f5", "reload_ui", "ui") then
		self:create_ingame_ui(self.ingame_ui_context)
	end

	if script_data.debug_rooms then
		self:_debug_update_rooms(dt, t)
	end

	if Development.parameter("auto_host_dedicated") and self._spawn_initialized then
		local t = nil
		local level = Development.parameter("auto_host_dedicated")
		local game_mode = LevelSettings[level].game_mode
		local area = nil
		local search_config = {
			private_game = false,
			quick_game = false,
			difficulty = "normal",
			level_key = level
		}

		Managers.matchmaking:find_game(search_config)
		Development.set_parameter("auto_host_dedicated", nil)
	end

	Managers.state.debug_text:update(dt, self.viewport_name)
	self:update_mood(dt, t)

	if self.checkpoint_vote_cancelled then
		self.checkpoint_available = nil
		self.checkpoint_vote_cancelled = nil
	end

	local ingame_ui = self.ingame_ui
	local ui_ready = not ingame_ui.survey_active and not self.has_setup_end_of_level and ingame_ui:end_screen_active() and ingame_ui:end_screen_fade_in_complete()
	local rewards_ready = self._booted_eac_untrusted or (self.rewards:rewards_generated() and not self.rewards:consuming_deed() and self.chests_package_name and Managers.package:has_loaded(self.chests_package_name, "global"))

	if ui_ready and rewards_ready then
		self:_setup_end_of_level_UI()
	end

	if self.popup_id then
		local result = Managers.popup:query_result(self.popup_id)

		if result then
			if result == "not_installed" then
				Managers.invite:clear_invites()
			end

			self.popup_id = nil
		end
	end

	local main_t = Managers.time:time("main")

	self:update_player_afk_check(dt, main_t)

	if self._benchmark_handler then
		self._benchmark_handler:update(dt, t)
	end
end

StateInGameRunning.check_for_new_quests_or_contracts = function (self, dt)
	self._quest_expire_check_cooldown = (self._quest_expire_check_cooldown and self._quest_expire_check_cooldown - dt) or 0

	if self._quest_expire_check_cooldown <= 0 then
		local quest_manager = Managers.state.quest

		if quest_manager:has_quests_expired() or quest_manager:has_contracts_expired() then
			Managers.chat:add_local_system_message(1, Localize("dlc1_3_1_new_quests_and_contracts_available_text"), true)

			self._quest_expire_check_cooldown = QuestSettings.EXPIRE_CHECK_COOLDOWN
		end
	end
end

StateInGameRunning.disable_ui = function (self)
	local ingame_ui = self.ingame_ui

	if ingame_ui then
		ingame_ui:suspend_active_view()
	end

	self._disable_ui = true
end

StateInGameRunning.event_close_ingame_menu = function (self)
	local ingame_ui = self.ingame_ui

	if ingame_ui then
		ingame_ui:suspend_active_view()
	end
end

StateInGameRunning.update_ui = function (self)
	if self._disable_ui then
		return
	end

	if not self._ui_update_initialized then
		self._ui_update_initialized = true

		return
	end

	local time_manager = Managers.time
	local t = Application.time_since_launch()
	local dt = Application.time_since_launch() - (self._t or t)
	local disable_ingame_ui = script_data.disable_ui or (self.waiting_for_transition and Managers.state.network:game_session_host() ~= nil)
	local ingame_ui = self.ingame_ui
	local level_end_view_wrapper = self._level_end_view_wrapper
	local level_end_view = level_end_view_wrapper and level_end_view_wrapper:level_end_view()

	ingame_ui:update(dt, t, disable_ingame_ui, level_end_view)

	local end_screen_active = ingame_ui:end_screen_active()
	local end_screen_completed = ingame_ui:end_screen_completed()
	local checkpoint_available = self.checkpoint_available
	local end_screen_closed = self.end_screen_ui_done

	if end_screen_active and end_screen_completed and not checkpoint_available and not end_screen_closed then
		self:on_end_screen_ui_complete()
	end

	self._t = Application.time_since_launch()
end

StateInGameRunning.cb_loading_view_fade_in_done = function (self)
	Managers.transition:fade_out(GameSettings.transition_fade_out_speed, nil)

	self.show_loading_view = false
end

StateInGameRunning.update_mood = function (self, dt, t)
	local mood_settings = MoodSettings
	local mood_priority = MoodPriority
	local mood_handler = Managers.state.camera.mood_handler
	local mood_timers = self.mood_timers
	local mood_blackboard = MOOD_BLACKBOARD
	local wanted_mood = nil

	for i = 1, #mood_priority, 1 do
		local mood = mood_priority[i]

		if mood_timers[mood] and mood_timers[mood] < t then
			mood_timers[mood] = nil
			mood_blackboard[mood] = false
		end

		if mood_blackboard[mood] == true then
			if not wanted_mood then
				wanted_mood = mood
			elseif mood_settings[mood].hold_time then
				mood_blackboard[mood] = false
			end
		end
	end

	wanted_mood = wanted_mood or "default"

	if wanted_mood ~= mood_handler.current_mood then
		mood_handler:set_mood(wanted_mood)

		if wanted_mood ~= "default" then
			local hold_time = mood_settings[wanted_mood].hold_time

			if hold_time then
				mood_timers[wanted_mood] = t + hold_time
			end
		end
	end
end

StateInGameRunning.post_update = function (self, dt, t)
	local level_end_view_wrapper = self._level_end_view_wrapper
	local disable_ingame_ui = script_data.disable_ui or level_end_view_wrapper ~= nil or (self.waiting_for_transition and Managers.state.network:game_session_host() ~= nil)

	self.ingame_ui:post_update(dt, t, disable_ingame_ui)

	if level_end_view_wrapper then
		level_end_view_wrapper:update(dt, t)

		if level_end_view_wrapper:done() then
			level_end_view_wrapper:destroy()

			self._level_end_view_wrapper = nil
		end
	end
end

StateInGameRunning.trigger_xbox_multiplayer_round_end_events = function (self)
	if self.is_in_inn or self.is_in_tutorial or Development.parameter("auto-host-level") ~= nil or self._xbox_event_end_triggered then
		return
	end

	self:_xbone_end_of_round_events(self.statistics_db)
end

StateInGameRunning.on_exit = function (self)
	self.free_flight_manager:set_teleport_override(nil)

	self.parent = nil
	self.free_flight_manager = nil
	self.input_manager = nil

	CLEAR_ALL_PLAYER_LISTS()

	if self._benchmark_handler then
		self._benchmark_handler:destroy()
	end

	if self._level_end_view_wrapper then
		self._level_end_view_wrapper:destroy()

		self._level_end_view_wrapper = nil

		if PLATFORM == "ps4" then
			Managers.account:set_realtime_multiplay_state("end_screen", false)
		end
	end

	self.ingame_ui:destroy()

	self.ingame_ui = nil

	if self.loading_view then
		self.loading_view:destroy()

		self.loading_view = nil
	end

	if self.network_event_delegate then
		self.network_event_delegate:unregister(self)

		self.network_event_delegate = nil
	end

	self.level_end_view_context = nil
	self.player = nil

	self:_cancel_afk_warning()
end

StateInGameRunning.event_game_started = function (self)
	local world = self.parent.world
	local level = LevelHelper:current_level(world)

	Level.trigger_event(level, "game_started")

	if self.is_server then
		Managers.state.voting:set_vote_kick_enabled(true)
	end

	self.end_conditions_met = false

	if self.is_in_inn or self.is_in_tutorial then
		return
	end

	if PLATFORM == "xb1" then
		self:_xbone_round_start_events()
	end
end

if PLATFORM == "xb1" then
	StateInGameRunning.event_trigger_xbox_round_end = function (self)
		self:_xbone_end_of_round_events(self.statistics_db)
	end

	StateInGameRunning._xbone_round_start_events = function (self)
		if self.is_in_inn or self.is_in_tutorial or Development.parameter("auto-host-level") ~= nil then
			return
		end

		if not self._xbox_event_init_triggered then
			self._xbox_event_init_triggered = true
			local session_id = Managers.state.network:lobby().lobby:session_id()
			local multiplayer_round_start_table = {
				Managers.account:xbox_user_id(),
				Managers.account:round_id(),
				0,
				Managers.account:player_session_id(),
				MultiplayerSession.multiplayer_correlation_id(session_id),
				0,
				0,
				0
			}

			Managers.transition:set_multiplayer_values("start", {
				xuid = Managers.account:xbox_user_id(),
				round_id = Managers.account:round_id(),
				player_session_id = Managers.account:player_session_id(),
				correlation_id = MultiplayerSession.multiplayer_correlation_id(session_id)
			}, string.format("[StateInGameRunning] Writing MultiplayerRoundStart. CorrelationID: %s. RoundID: %s", tostring(MultiplayerSession.multiplayer_correlation_id(session_id)), tostring(Managers.account:round_id())))

			local debug_string = string.format("[StateInGameRunning] Writing MultiplayerRoundStart. CorrelationID: %s. RoundID: %s", tostring(MultiplayerSession.multiplayer_correlation_id(session_id)), tostring(Managers.account:round_id()))
			local debug_print_func = Application.warning

			Managers.xbox_events:write("MultiplayerRoundStart", multiplayer_round_start_table, debug_string, debug_print_func, true)
		end
	end

	StateInGameRunning._xbone_end_of_round_events = function (self, statistics_db)
		if self.is_in_inn or self.is_in_tutorial or Development.parameter("auto-host-level") ~= nil then
			return
		end

		if not self._xbox_event_end_triggered then
			self._xbox_event_end_triggered = true
			local session_id = Managers.state.network:lobby().lobby:session_id()
			local multiplayer_round_end_table = {
				Managers.account:xbox_user_id(),
				Managers.account:round_id(),
				0,
				Managers.account:player_session_id(),
				MultiplayerSession.multiplayer_correlation_id(session_id),
				0,
				0,
				0,
				math.floor(Managers.time:time("game")),
				0
			}

			Managers.transition:set_multiplayer_values("end", {
				xuid = Managers.account:xbox_user_id(),
				round_id = Managers.account:round_id(),
				player_session_id = Managers.account:player_session_id(),
				correlation_id = MultiplayerSession.multiplayer_correlation_id(session_id),
				time = Managers.time:time("game")
			}, string.format("[StateInGameRunning] Writing MultiplayerRoundEnd. CorrelationID: %s. RoundID: %s", tostring(MultiplayerSession.multiplayer_correlation_id(session_id)), tostring(Managers.account:round_id())))

			local debug_string = string.format("[StateInGameRunning] Writing MultiplayerRoundEnd. CorrelationID: %s. RoundID: %s", tostring(MultiplayerSession.multiplayer_correlation_id(session_id)), tostring(Managers.account:round_id()))
			local debug_print_func = Application.warning

			Managers.xbox_events:write("MultiplayerRoundEnd", multiplayer_round_end_table, debug_string, debug_print_func, true)
			Managers.transition:dump_multiplayer_data()
		end

		if not self._gameprogress_event_triggered then
			self._gameprogress_event_triggered = true
			local game_progress_table = {
				Managers.account:xbox_user_id(),
				Managers.account:player_session_id(),
				StatisticsUtil.get_game_progress(statistics_db)
			}
			local debug_string = "[StateInGameRunning] Writing GameProgress"
			local debug_print_func = Application.warning

			Managers.xbox_events:write("GameProgress", game_progress_table, debug_string, debug_print_func, true)
		end
	end
end

StateInGameRunning.event_conflict_director_setup_done = function (self)
	self._conflict_directory_is_ready = true

	self:game_actually_starts()
end

StateInGameRunning.event_local_player_spawned = function (self, is_initial_spawn)
	self._player_has_spawned = true
	self._is_initial_spawn = is_initial_spawn

	self:game_actually_starts()
end

StateInGameRunning.game_actually_starts = function (self)
	if not self._spawn_initialized and self._player_has_spawned and (not self.is_server or self._conflict_directory_is_ready) then
		local platform = PLATFORM
		local loading_context = self.parent.parent.loading_context
		local first_hero_selection_made = SaveData.first_hero_selection_made
		local show_profile_on_startup = loading_context.show_profile_on_startup
		local backend_waiting_for_input = Managers.backend:is_waiting_for_user_input()
		local level_key = Managers.state.game_mode:level_key()

		if show_profile_on_startup and level_key == "inn_level" and not LEVEL_EDITOR_TEST and not Development.parameter("skip-start-menu") then
			local show_hero_selection = not backend_waiting_for_input and (platform == "ps4" or platform == "xb1" or not first_hero_selection_made)
			local menu_state = (show_hero_selection and "character") or "overview"
			local view = "initial_start_menu_view_force"

			self.ingame_ui:transition_with_fade(view, menu_state)

			loading_context.show_profile_on_startup = nil
		else
			Managers.transition:fade_out(GameSettings.transition_fade_in_speed)
		end

		LevelHelper:flow_event(self.world, "local_player_spawned")

		if self._is_initial_spawn then
			if self._benchmark_handler then
				LevelHelper:flow_event(self.world, "start_benchmark")
			else
				LevelHelper:flow_event(self.world, "level_start_local_player_spawned")
			end
		end

		self._spawn_initialized = true
		self._conflict_directory_is_ready = nil
		self._player_has_spawned = nil

		Managers.transition:hide_loading_icon()

		if PLATFORM == "ps4" then
			Managers.account:set_realtime_multiplay_state("pre_game", false)
		end

		if self.is_in_inn or self.is_in_tutorial then
			return
		end
	end
end

local afk_warn_timer = 120
local afk_force_kick_timer = 180

StateInGameRunning.update_player_afk_check = function (self, dt, t)
	return

	local cutscene_system = Managers.state.entity:system("cutscene_system")
	local active_cutscene = cutscene_system.active_camera
	local afk_kick_disabled = self.afk_kick or active_cutscene or self.is_server or self.is_in_inn or self.end_conditions_met or Development.parameter("debug_disable_afk_kick")

	if afk_kick_disabled then
		if self.afk_popup_id then
			self:_cancel_afk_warning()
		end

		self.last_active_time = nil

		return
	end

	local last_input_time = Managers.input.last_active_time

	if not self.last_active_time then
		self.last_active_time = last_input_time or t
	elseif last_input_time and last_input_time ~= self.last_active_time then
		self.last_active_time = nil
	elseif self.last_active_time then
		local player = Managers.player:local_player(1)
		local player_unit = player.player_unit

		if not Unit.alive(player_unit) or ScriptUnit.extension(player_unit, "status_system"):is_disabled() then
			self.last_active_time = self.last_active_time + dt
		else
			local time_since_active = t - self.last_active_time
			local should_warn = afk_warn_timer < time_since_active
			local should_kick = afk_force_kick_timer < time_since_active

			if should_warn and not self.afk_popup_id then
				self:_show_afk_warning()
			elseif should_kick then
				self:_kick_afk_player()
			end
		end
	end

	self:_handle_afk_warning_result()
end

StateInGameRunning._show_afk_warning = function (self)
	self.afk_popup_id = Managers.popup:queue_popup(Localize("afk_kick_warning"), Localize("popup_notice_topic"), "ok", Localize("button_ok"))
	local can_flash_window = _G.Window ~= nil and Window.flash_window ~= nil and not Window.has_focus()

	if can_flash_window then
		Window.flash_window(nil, "start", 5)
	end

	local player = Managers.player:local_player(1)

	self:_send_system_chat_message("chat_afk_kick_warning", player:name())
end

StateInGameRunning._send_system_chat_message = function (self, message, localization_param)
	local channel_id = 1
	local pop_chat = true

	Managers.chat:send_system_chat_message(channel_id, message, localization_param, pop_chat)
end

StateInGameRunning._cancel_afk_warning = function (self)
	if self.afk_popup_id then
		Managers.popup:cancel_popup(self.afk_popup_id)

		self.afk_popup_id = nil
	end
end

StateInGameRunning._handle_afk_warning_result = function (self)
	if self.afk_popup_id then
		local popup_result = Managers.popup:query_result(self.afk_popup_id)

		if popup_result then
			self.afk_popup_id = nil
		end
	end
end

StateInGameRunning._kick_afk_player = function (self)
	self:_cancel_afk_warning()

	local player = Managers.player:local_player(1)

	self:_send_system_chat_message("chat_afk_kick", player:name())

	self.afk_kick = true
end

return
