-- chunkname: @scripts/managers/game_mode/game_modes/game_mode_map_deus.lua

require("scripts/managers/game_mode/game_modes/game_mode_base")
require("scripts/ui/views/deus_menu/deus_map_decision_view")
require(script_data.FEATURE_old_map_ui and "scripts/ui/views/deus_menu/deus_shop_view" or "scripts/ui/views/deus_menu/deus_shop_view_v2")

local UI_RENDERER_MATERIALS = {
	"material",
	"materials/ui/ui_1080p_hud_atlas_textures",
	"material",
	"materials/ui/ui_1080p_hud_single_textures",
	"material",
	"materials/ui/ui_1080p_menu_atlas_textures",
	"material",
	"materials/ui/ui_1080p_menu_single_textures",
	"material",
	"materials/ui/ui_1080p_common",
	"material",
	"materials/ui/ui_1080p_versus_available_common",
	"material",
	"materials/fonts/gw_fonts",
	"material",
	"materials/ui/ui_1080p_morris_single_textures",
	"material",
	"materials/ui/ui_1080p_belakor_atlas",
	"material",
	"materials/ui/ui_1080p_versus_rewards_atlas",
}

for _, dlc in pairs(DLCSettings) do
	local portrait_materials = dlc.portrait_materials

	if portrait_materials then
		for _, path in ipairs(portrait_materials) do
			UI_RENDERER_MATERIALS[#UI_RENDERER_MATERIALS + 1] = "material"
			UI_RENDERER_MATERIALS[#UI_RENDERER_MATERIALS + 1] = path
		end
	end
end

local COMPLETE_LEVEL_VAR = false
local FAIL_LEVEL_VAR = false
local FADE_DURATION = 1
local states = {
	FINISHING = 5,
	MAP_DECISION = 1,
	SHOP = 3,
	WAITING_FOR_PLAYERS_AFTER_MAP_DECISION = 2,
	WAITING_FOR_PLAYERS_AFTER_SHOP = 4,
}
local shared_state_spec = {
	server = {
		state = {
			default_value = 0,
			type = "number",
			composite_keys = {},
		},
	},
	peer = {
		state = {
			default_value = 0,
			type = "number",
			composite_keys = {},
		},
	},
}

SharedState.validate_spec(shared_state_spec)

GameModeMapDeus = class(GameModeMapDeus, GameModeBase)

GameModeMapDeus.init = function (self, settings, world, network_handler, is_server, profile_synchronizer, level_key, statistics_db, game_mode_settings)
	GameModeMapDeus.super.init(self, settings, world, network_handler, is_server, profile_synchronizer, level_key, statistics_db, game_mode_settings)
	fassert(game_mode_settings.deus_run_controller, "GameModeMapDeus is missing initialization data, see DeusMechanism.")

	self._deus_run_controller = game_mode_settings.deus_run_controller
	self._own_peer_id = self._deus_run_controller:get_own_peer_id()

	local server_peer_id = self._deus_run_controller:get_server_peer_id()

	self._shared_state = SharedState:new("deus_game_mode_map_" .. self._deus_run_controller:get_run_id(), shared_state_spec, is_server, is_server and network_handler or nil, server_peer_id, self._own_peer_id)
	self._is_server = is_server
	self._ui_done = true
	self._adventure_profile_rules = AdventureProfileRules:new(self._profile_synchronizer, self._network_server)

	local ui_renderer = UIRenderer.create(self._world, unpack(UI_RENDERER_MATERIALS))
	local top_world = Managers.world:world("top_ingame_view")
	local ui_top_renderer = UIRenderer.create(top_world, unpack(UI_RENDERER_MATERIALS))
	local context = {
		ui_renderer = ui_renderer,
		ui_top_renderer = ui_top_renderer,
		is_server = self._is_server,
		server_peer_id = server_peer_id,
		input_manager = Managers.input,
		deus_run_controller = self._deus_run_controller,
		wwise_world = Managers.world:wwise_world(world),
		network_server = is_server and network_handler or nil,
		own_peer_id = self._own_peer_id,
		world = world,
	}

	self._map_decision_view = DeusMapDecisionView:new(context)
	self._shop_view = DeusShopView:new(context)
end

GameModeMapDeus.register_rpcs = function (self, network_event_delegate, network_transmit)
	GameModeMapDeus.super.register_rpcs(self, network_event_delegate, network_transmit)
	self._shared_state:register_rpcs(self._network_event_delegate)
	self._map_decision_view:register_rpcs(network_event_delegate, network_transmit)
	self._shop_view:register_rpcs(network_event_delegate, network_transmit)
end

GameModeMapDeus.unregister_rpcs = function (self)
	self._shared_state:unregister_rpcs()

	if self._map_decision_view then
		self._map_decision_view:unregister_rpcs()
	end

	if self._shop_view then
		self._shop_view:unregister_rpcs()
	end
end

GameModeMapDeus.ended = function (self, reason)
	local all_peers_ingame = self._network_server:are_all_peers_ingame()

	if not all_peers_ingame then
		self._network_server:disconnect_joining_peers()
	end
end

GameModeMapDeus.local_player_ready_to_start = function (self, player)
	local profile_index = player:profile_index()
	local career_index = player:career_index()

	if profile_index == 0 or career_index == 0 or profile_index == nil or career_index == nil then
		return false
	end

	return true
end

GameModeMapDeus.local_player_game_starts = function (self, player, loading_context)
	self._game_started = true

	if self._is_server then
		self._node_decided = nil

		self._shared_state:set_server(self._shared_state:get_key("state"), states.MAP_DECISION)
	end

	self._shared_state:full_sync()

	local profile_index = player:profile_index()
	local career_index = player:career_index()

	CosmeticUtils.sync_local_player_cosmetics(player, profile_index, career_index)
end

GameModeMapDeus.profile_changed = function (self, peer_id, local_player_id, profile_index, career_index)
	if peer_id == self._own_peer_id then
		local player = Managers.player:player(peer_id, local_player_id)

		CosmeticUtils.sync_local_player_cosmetics(player, profile_index, career_index)
	end
end

GameModeMapDeus.mutators = function (self)
	local mutators_list = {}

	self:append_live_event_mutators(mutators_list)

	local event_mutators = self._deus_run_controller:get_event_mutators()

	if event_mutators then
		local mutators_list_keys = table.set(mutators_list)

		for i = 1, #event_mutators do
			local event_mutator = event_mutators[i]

			if not mutators_list_keys[event_mutator] then
				mutators_list[#mutators_list + 1] = event_mutator
			end
		end
	end

	return mutators_list
end

GameModeMapDeus.update = function (self, t, dt)
	local server_state = self._shared_state:get_server(self._shared_state:get_key("state"))
	local own_state = self._shared_state:get_own(self._shared_state:get_key("state"))

	if server_state == 0 then
		return
	end

	if own_state == states.MAP_DECISION then
		local map_decision_view = self._map_decision_view

		if map_decision_view then
			map_decision_view:update(dt, t)
		end
	end

	if own_state == states.SHOP then
		local shop_view = self._shop_view

		if shop_view then
			shop_view:update(dt, t)
		end
	end

	if not self._ui_done then
		return
	end

	if own_state ~= server_state then
		if server_state == states.MAP_DECISION then
			self._ui_done = false

			Managers.ui:handle_transition("close_active", {
				use_fade = true,
				fade_in_speed = FADE_DURATION,
				fade_out_speed = FADE_DURATION,
			})

			local transition_params = {
				finish_cb = function (data)
					if self._is_server then
						self._node_decided = data
					end

					Managers.transition:fade_in(FADE_DURATION, function ()
						self._ui_done = true
					end)
				end,
			}

			self._map_decision_view:start(transition_params)
			Wwise.set_state("level_morris_map", "map")
		elseif server_state == states.WAITING_FOR_PLAYERS_AFTER_MAP_DECISION then
			-- Nothing
		elseif server_state == states.SHOP then
			self._ui_done = false

			Managers.ui:handle_transition("close_active", {
				use_fade = true,
				fade_in_speed = FADE_DURATION,
				fade_out_speed = FADE_DURATION,
			})

			local transition_params = {
				finish_cb = function ()
					if self._is_server then
						self._shop_view_finished = true
					end

					Managers.transition:fade_in(FADE_DURATION, function ()
						self._shop_view:destroy_idol()

						self._ui_done = true
					end)
				end,
			}

			self._shop_view:start(transition_params)
			Wwise.set_state("level_morris_map", "shrine")
		elseif server_state == states.WAITING_FOR_PLAYERS_AFTER_SHOP then
			-- Nothing
		elseif server_state == states.FINISHING then
			-- Nothing
		end

		self._shared_state:set_own(self._shared_state:get_key("state"), server_state)
	end
end

GameModeMapDeus.post_update = function (self, dt, t)
	local own_state = self._shared_state:get_own(self._shared_state:get_key("state"))

	if own_state == states.MAP_DECISION then
		local map_decision_view = self._map_decision_view

		if map_decision_view then
			map_decision_view:post_update(dt, t)
		end
	end

	if own_state == states.SHOP then
		local shop_view = self._shop_view

		if shop_view then
			shop_view:post_update(dt, t)
		end
	end
end

GameModeMapDeus.destroy = function (self)
	if self._map_decision_view then
		self._map_decision_view:destroy()

		self._map_decision_view = nil
	end

	if self._shop_view then
		self._shop_view:destroy()

		self._shop_view = nil
	end

	self._shared_state:destroy()

	self._shared_state = nil
end

GameModeMapDeus.server_update = function (self, t, dt)
	GameModeMapDeus.super.server_update(self, t, dt)

	local current_state = self._shared_state:get_server(self._shared_state:get_key("state"))

	if current_state == states.MAP_DECISION then
		if self._node_decided then
			self._shared_state:set_server(self._shared_state:get_key("state"), states.WAITING_FOR_PLAYERS_AFTER_MAP_DECISION)
		end
	elseif current_state == states.WAITING_FOR_PLAYERS_AFTER_MAP_DECISION then
		if self:_are_all_peers_in_same_state() then
			local graph = self._deus_run_controller:get_graph_data()
			local new_node = graph[self._node_decided]

			if new_node.node_type == "shop" then
				self._shop_view_finished = nil

				self._deus_run_controller:handle_shrine_entered(self._node_decided)
				self._shared_state:set_server(self._shared_state:get_key("state"), states.SHOP)
			else
				self._shared_state:set_server(self._shared_state:get_key("state"), states.FINISHING)
			end
		end
	elseif current_state == states.SHOP then
		if self._shop_view_finished then
			self._shared_state:set_server(self._shared_state:get_key("state"), states.WAITING_FOR_PLAYERS_AFTER_SHOP)
		end
	elseif current_state == states.WAITING_FOR_PLAYERS_AFTER_SHOP then
		if self:_are_all_peers_in_same_state() then
			self._node_decided = nil

			self._shared_state:set_server(self._shared_state:get_key("state"), states.MAP_DECISION)
		end
	elseif current_state == states.FINISHING and self:_are_all_peers_in_same_state() then
		self._final_node_selected = self._node_decided
	end
end

GameModeMapDeus._are_all_peers_in_same_state = function (self)
	local server_state = self._shared_state:get_server(self._shared_state:get_key("state"))

	for _, peer_id in ipairs(self._deus_run_controller:get_peers()) do
		local peer_state = self._shared_state:get_peer(peer_id, self._shared_state:get_key("state"))

		if peer_state ~= server_state then
			return false
		end
	end

	return true
end

GameModeMapDeus.player_entered_game_session = function (self, peer_id, local_player_id, requested_party_index)
	GameModeMapDeus.super.player_entered_game_session(self, peer_id, local_player_id, requested_party_index)

	local status = Managers.party:get_player_status(peer_id, local_player_id)

	if status.party_id ~= 1 then
		local party_id = 1

		Managers.party:assign_peer_to_party(peer_id, local_player_id, party_id)
	end

	self._adventure_profile_rules:handle_profile_delegation_for_joining_player(peer_id, local_player_id)
end

GameModeMapDeus.evaluate_end_conditions = function (self, round_started)
	if COMPLETE_LEVEL_VAR then
		COMPLETE_LEVEL_VAR = false

		return true, "won"
	end

	if self:_is_time_up() then
		return true, "reload"
	end

	if FAIL_LEVEL_VAR then
		FAIL_LEVEL_VAR = false

		return true, "lost"
	end

	if self._level_completed then
		return true, "won"
	end

	if self._final_node_selected then
		self._deus_run_controller:handle_map_exited()

		return true, "won", self._final_node_selected
	end
end
