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

local RPCS = {
	"rpc_trigger_local_afk_system_message",
	"rpc_follow_to_lobby"
}
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
	self.network_event_delegate = params.network_event_delegate
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

	if Managers.razer_chroma then
		Managers.razer_chroma:lit_keybindings(true)
	end

	if self.is_server then
		player:create_game_object()
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
	event_manager:register(self, "checkpoint_vote_cancelled", "on_checkpoint_vote_cancelled")
	event_manager:register(self, "conflict_director_setup_done", "event_conflict_director_setup_done")
	event_manager:register(self, "close_ingame_menu", "event_close_ingame_menu")

	if PLATFORM == "ps4" then
		event_manager:register(self, "realtime_multiplay", "event_realtime_multiplay")
	end

	if PLATFORM == "xb1" then
		event_manager:register(self, "trigger_xbox_round_end", "event_trigger_xbox_round_end")
	end

	if self.is_server then
		Managers.state.event:trigger("game_started")
	end

	self.network_event_delegate:register(self, unpack(RPCS))

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
		network_event_delegate = self.network_event_delegate,
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
		network_client = params.network_client,
		chat_manager = Managers.chat,
		voip = params.voip
	}
	DamageUtils.is_in_inn = params.is_in_inn
	self.ingame_ui_context = ingame_ui_context

	if not script_data["-no-rendering"] then
		self:create_ingame_ui(ingame_ui_context)
	end

	local loading_context = self.parent.parent.loading_context
	loading_context.play_end_of_level_game = nil
	self._loading_subtitle_gui = loading_context.subtitle_gui
	loading_context.subtitle_gui = nil
	self.game_mode_key = Managers.state.game_mode:game_mode_key()
	local quickplay_bonus = loading_context.quickplay_bonus or loading_context.local_quickplay_bonus

	if not quickplay_bonus and self.game_mode_key == "weave" then
		local lobby = (self.is_server and self._lobby_host) or self._lobby_client
		quickplay_bonus = lobby:lobby_data("quick_game") == "true"
	end

	self.rewards = Rewards:new(level_key, self.game_mode_key, quickplay_bonus)
	self.is_quickplay = not not quickplay_bonus
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
	Managers.razer_chroma:load_packages()

	if Managers.chat:chat_is_focused() then
		Managers.chat.chat_gui:block_input()
	end

	if Development.parameter("attract_mode") then
		self._benchmark_handler = BenchmarkHandler:new(self.ingame_ui, self.world)
	end

	if self.is_in_inn then
		Managers.state.achievement:setup_achievement_data()
	end

	Managers.state.achievement:setup_incompleted_achievements()

	self._waiting_for_peers_message_timer = Managers.time:time("game") + 10
	self._game_started_current_frame = false
	self._transitioned_from_black_screen = false
end

StateInGameRunning.create_ingame_ui = function (self, ingame_ui_context)
	if self.ingame_ui then
		self.ingame_ui:destroy()
	end

	self.ingame_ui = IngameUI:new(ingame_ui_context)
	local matchmaking = Managers.matchmaking

	matchmaking:set_ingame_ui(self.ingame_ui)

	local unlock_manager = Managers.unlock

	unlock_manager:set_ingame_ui(self.ingame_ui)

	if not matchmaking.popup_handler then
		matchmaking:set_popup_join_lobby_handler(self.ingame_ui.popup_join_lobby_handler)
		matchmaking:set_popup_handler(self.ingame_ui.popup_handler)
	end
end

StateInGameRunning._setup_end_of_level_UI = function (self)
	if script_data.disable_end_screens then
		Managers.state.network.network_transmit:send_rpc_server("rpc_is_ready_for_transition")
	elseif not Managers.state.game_mode:setting("skip_level_end_view") then
		local saved_scoreboard_stats = nil
		local game_won = not self.game_lost
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if game_mode_key == "weave" then
			saved_scoreboard_stats = self.parent.parent.loading_context.saved_scoreboard_stats
			self.parent.parent.loading_context.saved_scoreboard_stats = nil
		end

		local players_session_score = ScoreboardHelper.get_grouped_topic_statistics(self.statistics_db, self.profile_synchronizer, saved_scoreboard_stats)
		local scoreboard_session_data = ScoreboardHelper.get_sorted_topic_statistics(self.statistics_db, self.profile_synchronizer, saved_scoreboard_stats)
		local hero_name = nil
		local peer_id = Network.peer_id()
		local local_player_id = self.local_player_id
		local profile_index = self.profile_synchronizer:profile_by_peer(peer_id, local_player_id)

		if profile_index then
			local profile = SPProfiles[profile_index]
			hero_name = profile.display_name
		end

		local level_end_view_context = {
			world_manager = Managers.world,
			is_server = self.is_server,
			is_quickplay = self.is_quickplay,
			peer_id = peer_id,
			local_player_hero_name = hero_name,
			scoreboard_session_data = scoreboard_session_data,
			players_session_score = players_session_score,
			game_won = game_won,
			game_mode_key = game_mode_key,
			difficulty = Managers.state.difficulty:get_difficulty(),
			weave_personal_best_achieved = self._weave_personal_best_achieved,
			completed_weave = self._completed_weave
		}
		self._weave_personal_best_achieved = nil
		self._completed_weave = nil

		if not self._booted_eac_untrusted then
			local level, start_experience, start_experience_pool = self.rewards:get_level_start()
			level_end_view_context.rewards = {
				end_of_level_rewards = table.clone(self.rewards:get_rewards()),
				level_start = {
					level,
					start_experience,
					start_experience_pool
				},
				mission_results = table.clone(self.rewards:get_mission_results())
			}
		end

		local mission_system = Managers.state.entity:system("mission_system")
		level_end_view_context.mission_system_data = {
			tome_mission_data = mission_system:get_level_end_mission_data("tome_bonus_mission"),
			grimoire_mission_data = mission_system:get_level_end_mission_data("grimoire_hidden_mission"),
			loot_dice_mission_data = mission_system:get_level_end_mission_data("bonus_dice_hidden_mission"),
			painting_scraps_mission_data = mission_system:get_level_end_mission_data("painting_scrap_hidden_mission")
		}
		local party_data = Managers.mechanism:score_information()
		level_end_view_context.party_data = party_data
		self.parent.parent.loading_context.level_end_view_context = level_end_view_context

		if PLATFORM == "ps4" then
			Managers.account:set_presence("dice_game")
		end

		if Managers.chat:chat_is_focused() then
			Managers.chat.chat_gui:block_input()
		end
	end

	self.has_setup_end_of_level = true
end

StateInGameRunning.level_end_view_wrapper = function (self)
	return self._level_end_view_wrapper
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

	if self.parent.exit_type ~= nil then
		return
	end

	local platform = PLATFORM

	if (platform == "xb1" or platform == "ps4") and (Managers.account:offline_mode() or Managers.account:has_fatal_error()) then
		if Managers.invite:has_invitation() then
			self._offline_invite = true
		end

		return
	end

	local invite_data = Managers.invite:get_invited_lobby_data()

	if invite_data then
		local lobby_id = invite_data.id or invite_data.name
		local current_lobby_id = nil

		if platform == "xb1" then
			current_lobby_id = (self._lobby_host and self._lobby_host.lobby._data.session_name) or self._lobby_client.lobby._data.session_name
		else
			current_lobby_id = (self._lobby_host and self._lobby_host:id()) or self._lobby_client:id()
		end

		local active_mission_vote = Managers.state.voting and Managers.state.voting:vote_in_progress() and Managers.state.voting:active_vote_template().mission_vote
		local current_level = self.level_transition_handler.level_key
		local level_settings = LevelSettings[current_level]

		if (Managers.matchmaking:is_game_matchmaking() or active_mission_vote) and self.network_server and level_settings.hub_level then
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

	if self.network_server and self.is_in_inn and not self.network_server:are_all_peers_ingame() then
		return
	end

	local wanted_transition, data = nil

	if self.ingame_ui then
		wanted_transition, data = self.ingame_ui:get_transition()
	end

	if wanted_transition then
		mm_printf("Doing transition %s from UI", wanted_transition)
	elseif self._offline_invite then
		wanted_transition = "offline_invite"
		self._offline_invite = nil
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

		Managers.matchmaking:set_local_quick_game(false)
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

StateInGameRunning.gm_event_end_conditions_met = function (self, reason, checkpoint_available, percentages_completed)
	if not self._game_has_started then
		Managers.transition:hide_loading_icon()
		Managers.transition:fade_out(GameSettings.transition_fade_in_speed)
	end

	local is_server = self.is_server
	local player = self.player
	self.end_conditions_met = true
	local difficulty_key = Managers.state.difficulty:get_difficulty()
	local level_key = Managers.state.game_mode:level_key()
	local game_mode_key = self.game_mode_key
	local is_quickplay = self.is_quickplay
	local game_won, game_lost = Managers.state.game_mode:evaluate_end_condition_outcome(reason, player)
	local ingame_ui = self.ingame_ui
	local stats_id = player:stats_id()
	local statistics_db = self.statistics_db
	local previous_completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_key) or 0

	ingame_ui:handle_transition("close_active")
	LoreBookHelper.save_new_pages()

	local mission_system = Managers.state.entity:system("mission_system")

	mission_system:set_percentage_completed(percentages_completed)

	if Managers.twitch then
		Managers.twitch:deactivate_twitch_game_mode()
	end

	local achievement_manager = Managers.state.achievement

	achievement_manager:evaluate_end_of_level_achievements(statistics_db, stats_id, level_key, difficulty_key)

	local stats_interface = Managers.backend:get_interface("statistics")
	local is_final_objective = game_mode_key ~= "weave" or not Managers.weave:calculate_next_objective_index()

	if game_mode_key == "survival" then
		if game_won then
			print("Game won")
			mission_system:evaluate_level_end_missions()
			StatisticsUtil.register_complete_survival_level(statistics_db)
			stats_interface:save()
		end
	elseif game_won then
		print("Game won")

		local is_final_weave_objective = is_final_objective and game_mode_key == "weave"

		if is_final_weave_objective then
			local weave_manager = Managers.weave
			local weave_tier = weave_manager:get_weave_tier()
			local score = weave_manager:get_score()
			local num_players = weave_manager:get_num_players()
			local weave_templates = WeaveSettings.templates_ordered
			local num_weave_templates = #weave_templates
			local personal_best = false

			for i = num_weave_templates, weave_tier, -1 do
				local stat_name = ScorpionSeasonalSettings.get_weave_score_stat(i, num_players)
				local previous_score = statistics_db:get_persistent_stat(stats_id, ScorpionSeasonalSettings.current_season_name, stat_name)
				local has_previous_score = previous_score and previous_score > 0

				if weave_tier == i then
					if (has_previous_score and previous_score < score) or not has_previous_score then
						personal_best = true

						break
					end
				elseif has_previous_score then
					break
				end
			end

			self._weave_personal_best_achieved = personal_best
			self._completed_weave = weave_manager:get_active_weave()
		elseif game_mode_key == "weave" then
			local saved_scoreboard_stats = ScoreboardHelper.get_weave_stats(self.statistics_db, self.profile_synchronizer)
			self.parent.parent.loading_context.saved_scoreboard_stats = saved_scoreboard_stats
		else
			self.parent.parent.loading_context.saved_scoreboard_stats = nil
		end

		if self._is_in_event_game_mode then
			StatisticsUtil.register_played_weekly_event_level(statistics_db, player, level_key, difficulty_key)
		end

		StatisticsUtil.register_complete_level(statistics_db)

		if is_final_weave_objective then
			StatisticsUtil.register_weave_complete(statistics_db, player, is_quickplay, difficulty_key)
		end

		stats_interface:save()
	elseif game_lost then
		print("Game lost")

		self.parent.parent.loading_context.saved_scoreboard_stats = nil
		self.checkpoint_available = checkpoint_available

		StatisticsUtil.reset_mission_streak(player, statistics_db, stats_id)
		stats_interface:save()
	end

	local screen_name, screen_config = Managers.state.game_mode:get_end_screen_config(game_won, game_lost, player)
	local is_booted_unstrusted = self._booted_eac_untrusted
	local is_game_mode_weave = game_mode_key == "weave"
	local weave_tier, score, num_players, weave_progress = nil

	if is_game_mode_weave then
		weave_tier, score, num_players = self:_get_weave_scores()
		weave_progress = Managers.weave:current_bar_score()

		Managers.weave:store_saved_game_mode_data()
	end

	local function callback(status)
		if status == "commit_error" then
			Managers.backend:commit_error()

			return
		end

		if is_game_mode_weave and not is_booted_unstrusted and game_won and is_final_objective and is_server and not self.is_quickplay then
			self:_submit_weave_scores(weave_tier, score, num_players)
		end

		local game_mode_setting = GameModeSettings[game_mode_key]
		local end_mission_rewards = game_mode_setting.end_mission_rewards

		if end_mission_rewards then
			if not is_booted_unstrusted and (game_lost or is_final_objective) then
				self:_award_end_of_level_rewards(statistics_db, stats_id, game_won, difficulty_key, weave_tier, weave_progress)
			end

			ingame_ui:activate_end_screen_ui(screen_name, screen_config)
		end
	end

	local backend_manager = Managers.backend

	if backend_manager:is_local() then
		backend_manager:commit(true)
		callback()
	else
		backend_manager:commit(true, callback)
	end

	if ((game_won and is_final_objective) or game_lost) and is_game_mode_weave then
		Managers.weave:clear_weave_name()
	end

	self.game_lost = game_lost

	if PLATFORM == "ps4" then
		Managers.account:set_realtime_multiplay(false)
	end

	if self.is_in_inn or self.is_in_tutorial then
		return
	end

	if PLATFORM == "xb1" then
		if not self._xbox_event_end_triggered then
			self:_xbone_end_of_round_events(statistics_db)
		end

		if not self.is_in_inn and not self.is_in_tutorial and not self.parent.hero_stats_updated then
			Managers.xbox_stats:update_hero_stats(game_won)

			self.parent.hero_stats_updated = true
		end
	end
end

StateInGameRunning._current_weave_index = function (self, statistics_db, stats_id)
	local ignore_dlc_check = false
	local current_weave = LevelUnlockUtils.current_weave(statistics_db, stats_id, ignore_dlc_check)
	local weave_template = WeaveSettings.templates[current_weave]
	local weave_templates_ordererd = WeaveSettings.templates_ordered
	local current_weave_index = table.find(weave_templates_ordererd, weave_template)

	return current_weave_index
end

StateInGameRunning._award_end_of_level_rewards = function (self, statistics_db, stats_id, game_won, difficulty_key, weave_tier, weave_progress)
	local profile_synchronizer = self.profile_synchronizer
	local peer_id = Network.peer_id()
	local local_player_id = self.local_player_id
	local profile_index = profile_synchronizer:profile_by_peer(peer_id, local_player_id)
	local profile = SPProfiles[profile_index]
	local hero_name = profile.display_name
	local current_weave_index = self:_current_weave_index(statistics_db, stats_id)
	local game_time = math.floor(Managers.time:time("game"))
	local kill_count = statistics_db:get_stat(stats_id, "kills_total")

	self.rewards:award_end_of_level_rewards(game_won, hero_name, self._is_in_event_game_mode, weave_tier, weave_progress, game_time, current_weave_index, kill_count)

	local chest_settings = LootChestData.chests_by_category[difficulty_key]

	if chest_settings then
		local chests_package_name = chest_settings.package_name
		self.chests_package_name = chests_package_name

		Managers.package:load(chests_package_name, "global")
	end
end

StateInGameRunning._get_weave_scores = function (self)
	local weave_manager = Managers.weave
	local weave_tier = weave_manager:get_weave_tier()
	local score = weave_manager:get_score()
	local num_players = weave_manager:get_num_players()

	return weave_tier, score, num_players
end

StateInGameRunning._submit_weave_scores = function (self, weave_tier, score, num_players)
	local weave_interface = Managers.backend:get_interface("weaves")

	weave_interface:submit_scores(weave_tier, score, num_players)
end

StateInGameRunning.on_checkpoint_vote_cancelled = function (self)
	self.checkpoint_vote_cancelled = true
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
	if not self._transitioned_from_black_screen then
		local allowed_to_transition = self:_check_black_screen_transition_requirements(dt, t)

		if allowed_to_transition then
			self:_game_actually_starts()

			self._transitioned_from_black_screen = true
		end
	end

	if self._waiting_for_peers_message_timer and self._waiting_for_peers_message_timer < t then
		if self.is_server then
			local lobby_members_class = self._lobby_host:members()
			local lobby_members = lobby_members_class:get_members()

			if #lobby_members > 1 then
				Managers.transition:show_waiting_for_peers_message(true)

				self._waiting_for_peers_message_timer = nil
			end
		else
			Managers.transition:show_waiting_for_peers_message(true)

			self._waiting_for_peers_message_timer = nil
		end
	end

	self:update_mood(dt, t)

	if self.checkpoint_vote_cancelled then
		self.checkpoint_available = nil
		self.checkpoint_vote_cancelled = nil
	end

	local ingame_ui = self.ingame_ui

	if ingame_ui then
		local ui_ready = not ingame_ui.survey_active and not self.has_setup_end_of_level and ingame_ui:end_screen_active() and ingame_ui:end_screen_fade_in_complete()
		local rewards_ready = self._booted_eac_untrusted or (self.rewards:rewards_generated() and not self.rewards:consuming_deed() and self.chests_package_name and Managers.package:has_loaded(self.chests_package_name, "global"))

		if ui_ready and rewards_ready then
			self:_setup_end_of_level_UI()
		end
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

	self:_poll_testify_requests()
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

StateInGameRunning.event_realtime_multiplay = function (self, active)
	if active and (self.is_in_tutorial or self.is_in_inn) then
		return
	end

	Managers.account:set_realtime_multiplay(active)
end

StateInGameRunning.update_ui = function (self)
	if self._disable_ui then
		return
	end

	if not self._ui_update_initialized then
		self._ui_update_initialized = true

		return
	end

	if not self.ingame_ui then
		return
	end

	local t = Application.time_since_launch()
	local dt = Application.time_since_launch() - (self._t or t)
	local disable_ingame_ui = script_data.disable_ui or DebugScreen.active or (self.waiting_for_transition and Managers.state.network:game_session_host() ~= nil)
	local ingame_ui = self.ingame_ui
	local level_end_view_wrapper = self._level_end_view_wrapper
	local level_end_view = level_end_view_wrapper and level_end_view_wrapper:level_end_view()

	ingame_ui:update(dt, t, disable_ingame_ui, level_end_view)

	local loading_subtitle_gui = self._loading_subtitle_gui

	if loading_subtitle_gui then
		ingame_ui:update_loading_subtitle_gui(loading_subtitle_gui, dt)

		if loading_subtitle_gui:is_complete() then
			self._loading_subtitle_gui = nil
		end
	end

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

	if self.ingame_ui then
		self.ingame_ui:post_update(dt, t, disable_ingame_ui)
	end

	if level_end_view_wrapper then
		level_end_view_wrapper:update(dt, t)

		if level_end_view_wrapper:done() then
			level_end_view_wrapper:destroy()

			self._level_end_view_wrapper = nil
		end
	end

	if self._game_started_current_frame then
		if PLATFORM == "ps4" then
			local entity_manager = Managers.state.entity
			local cutscene_system = entity_manager:system("cutscene_system")
			local active_camera = cutscene_system.active_camera

			if not active_camera then
				self:event_realtime_multiplay(true)
			end
		end

		self._game_started_current_frame = false
	end
end

StateInGameRunning.post_render = function (self)
	if self.ingame_ui then
		self.ingame_ui:post_render()
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
	end

	if PLATFORM == "ps4" then
		Managers.account:set_realtime_multiplay(false)
	end

	if self.ingame_ui then
		self.ingame_ui:destroy()

		self.ingame_ui = nil

		Managers.unlock:set_ingame_ui(nil)
	end

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

	if Managers.matchmaking:game_mode_event_data() then
		self._is_in_event_game_mode = true
	end

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
		if self.is_in_inn or self.is_in_tutorial or Development.parameter("auto-host-level") ~= nil or not Managers.account:is_online() then
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
		if self.is_in_inn or self.is_in_tutorial or Development.parameter("auto-host-level") ~= nil or not Managers.account:is_online() then
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

StateInGameRunning._check_black_screen_transition_requirements = function (self)
	if not self._game_mode_ready_to_start then
		local game_mode_ready_to_start = Managers.state.game_mode:local_player_ready_to_start(self.player)
		self._game_mode_ready_to_start = game_mode_ready_to_start
	end

	local conflict_directory_is_ready = self._conflict_directory_is_ready or not self.is_server
	local game_mode_ready_to_start = self._game_mode_ready_to_start

	if conflict_directory_is_ready and game_mode_ready_to_start then
		if not self._has_started_framerate_catchup then
			self:_catchup_framerate_before_starting()

			self._has_started_framerate_catchup = true
		end

		self:_update_catchup_framerate_before_starting()

		if self._frame_catchup_counter == nil then
			return true
		end
	end

	return false
end

StateInGameRunning.event_conflict_director_setup_done = function (self)
	self._conflict_directory_is_ready = true
end

StateInGameRunning._catchup_framerate_before_starting = function (self)
	Framerate.set_catchup()

	self._frame_catchup_counter = 20
end

StateInGameRunning._update_catchup_framerate_before_starting = function (self)
	if self._frame_catchup_counter == nil then
		return
	end

	self._frame_catchup_counter = self._frame_catchup_counter - 1

	if self._frame_catchup_counter == 0 then
		self._frame_catchup_counter = nil

		Framerate.set_playing()
	end
end

StateInGameRunning._game_actually_starts = function (self)
	print("StateInGameRunning:_game_actually_starts()")

	local loading_context = self.parent.parent.loading_context

	Managers.state.game_mode:local_player_game_starts(self.player, loading_context)
	Managers.transition:fade_out(GameSettings.transition_fade_in_speed)

	self._game_started_current_frame = true
	self._game_has_started = true

	Managers.transition:hide_loading_icon()
	Managers.transition:show_waiting_for_peers_message(false)

	self._waiting_for_peers_message_timer = nil

	Managers.load_time:end_timer()

	if Managers.twitch then
		local level_key = self.level_transition_handler:get_current_level_keys()
		local level_settings = LevelSettings[level_key]

		if level_settings and not level_settings.disable_twitch_game_mode then
			Managers.twitch:activate_twitch_game_mode(self.network_event_delegate, Managers.state.game_mode:game_mode_key())
		end
	end

	if Testify:poll_request("wait_for_level_loaded") then
		Testify:respond_to_request("wait_for_level_loaded")
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
	local rpc = "rpc_trigger_local_afk_system_message"
	local message_id = "chat_afk_kick_warning"
	local peer_id = player.peer_id

	if not self.is_server then
		Managers.state.network.network_transmit:send_rpc_server(rpc, message_id, peer_id)
	end

	self:rpc_trigger_local_afk_system_message(peer_id, message_id, peer_id)
end

StateInGameRunning.rpc_trigger_local_afk_system_message = function (self, sender, message_id, peer_id)
	if self.is_server then
		Managers.state.network.network_transmit:send_rpc_clients_except(rpc, peer_id, message_id, peer_id)
	end

	local player = Managers.player:player(peer_id, 1)

	if player then
		local is_player_controlled = player:is_player_controlled()
		local player_name = (is_player_controlled and ((rawget(_G, "Steam") and Steam.user_name(peer_id)) or tostring(peer_id))) or player:name()

		if PLATFORM ~= "win32" and not Managers.account:offline_mode() then
			local lobby = Managers.state.network:lobby()
			player_name = (is_player_controlled and (lobby:user_name(peer_id) or tostring(peer_id))) or player:name()
		end

		local channel_id = 1
		local pop_chat = true
		local message = string.format(Localize(message_id), player_name)

		Managers.chat:add_local_system_message(channel_id, message, pop_chat)
	end
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
	local rpc = "rpc_trigger_local_afk_system_message"
	local message_id = "chat_afk_kick"
	local peer_id = player.peer_id

	if not self.is_server then
		Managers.state.network.network_transmit:send_rpc_server(rpc, message_id, peer_id)
	end

	self:rpc_trigger_local_afk_system_message(peer_id, message_id, peer_id)

	self.afk_kick = true
end

StateInGameRunning.rpc_follow_to_lobby = function (self, sender, lobby_type, lobby_to_join)
	printf("Got message from lobby host to join %s %s", NetworkLookup.lobby_type[lobby_type], lobby_to_join)

	if not Managers.party:is_leader(sender) then
		return
	end

	local lobby_join_data = {}

	if NetworkLookup.lobby_type[lobby_type] == "server" then
		lobby_join_data.is_server_invite = true
		lobby_join_data.id = lobby_to_join
		lobby_join_data.server_info = {
			ip_port = lobby_to_join
		}
	else
		lobby_join_data.is_server_invite = false
		lobby_join_data.id = lobby_to_join
	end

	Managers.matchmaking:request_join_lobby(lobby_join_data, {
		friend_join = true
	})
end

StateInGameRunning._poll_testify_requests = function (self)
	local end_screen_active = self.has_setup_end_of_level == true

	if Testify:poll_request("level_end_screen_displayed") then
		Testify:respond_to_request("level_end_screen_displayed", end_screen_active)
	end

	if Testify:poll_request("has_lost") then
		Testify:respond_to_request("has_lost", self.game_lost)
	end

	if end_screen_active and (Testify:poll_request("set_camera_to_observe_first_bot") or Testify:poll_request("update_camera_to_follow_first_bot_rotation") or Testify:poll_request("set_player_unit_not_visible") or Testify:poll_request("calculate_best_point_on_main_path") or Testify:poll_request("teleport_player_on_best_point") or Testify:poll_request("teleport_blocked_bots_forward_on_main_path") or Testify:poll_request("end_of_the_level_reached") or Testify:poll_request("end_zone_activated") or Testify:poll_request("spawn_essence_on_first_bot_position") or Testify:poll_request("make_players_invicible") or Testify:poll_request("are_bots_blocked") or Testify:poll_request("make_player_and_one_bot_invicible") or Testify:poll_request("get_active_weave_phase") or Testify:poll_request("teleport_player_randomly_on_main_path") or Testify:poll_request("teleport_player_to_end_zone_position")) then
		Testify:clear_all_requests()
	end
end

return
