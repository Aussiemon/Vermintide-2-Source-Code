require("scripts/network/shared_state")
require("scripts/ui/views/deus_menu/deus_map_view")
require("scripts/settings/dlcs/morris/deus_map_visibility_settings")

DeusMapDecisionView = class(DeusMapDecisionView, DeusMapView)
local START_COUNTDOWN = 5
local VOTING_COUNTDOWN = 30
local VOTING_FINISHING_COUNTDOWN = 5
local FINAL_COUNTDOWN = 3
local CAMERA_TRANSITION_DURATION = 2
local CONTENT_FADE_IN_DURATION = 0.5
local CONTENT_FADE_OUT_DURATION = 1
local REAL_PLAYER_LOCAL_ID = 1
local VISIBILITY_CONFIG = {
	[DeusMapVisibilitySettings.WEAK_FOG_LEVEL] = {
		conflict_settings = true,
		shop = true,
		terror_event_power_up = true,
		theme = true,
		minor_modifier = true,
		level = true
	},
	[DeusMapVisibilitySettings.WEAK_FOG_LEVEL + 1] = {
		conflict_settings = false,
		shop = true,
		terror_event_power_up = true,
		theme = true,
		minor_modifier = true,
		level = true
	},
	[DeusMapVisibilitySettings.WEAK_FOG_LEVEL + 2] = {
		conflict_settings = false,
		shop = true,
		terror_event_power_up = false,
		theme = true,
		minor_modifier = false,
		level = false
	},
	[DeusMapVisibilitySettings.WEAK_FOG_LEVEL + 3] = {
		conflict_settings = false,
		shop = false,
		terror_event_power_up = false,
		theme = false,
		minor_modifier = false,
		level = false
	}
}
local SOUND_EVENTS = {
	ingame_final_node_selected = "hud_morris_world_map_level_chosen",
	token_move = "hud_morris_world_map_token_move",
	node_hover = "hud_morris_world_map_hover",
	node_pressed = "hud_morris_world_map_chose_level",
	shrine_final_node_selected = "hud_morris_map_shrine_open"
}
local states = {
	TWITCH_STARTING = "TWITCH_STARTING",
	VOTING = "VOTING",
	FINISHED = "FINISHED",
	WAITING = "WAITING",
	VOTING_FINISHING = "VOTING_FINISHING",
	TWITCH_WAITING = "TWITCH_WAITING",
	FINISHING = "FINISHING",
	STARTING = "STARTING"
}
local shared_state_spec = {
	server = {
		map_state = {
			default_value = "",
			type = "string",
			composite_keys = {}
		},
		final_node_selected = {
			default_value = "",
			type = "string",
			composite_keys = {}
		}
	},
	peer = {
		ready = {
			default_value = false,
			type = "boolean",
			composite_keys = {}
		},
		vote = {
			default_value = "",
			type = "string",
			composite_keys = {}
		}
	}
}

SharedState.validate_spec(shared_state_spec)

local function get_next_node_types(deus_run_controller)
	local node_types = {}
	local current_node = deus_run_controller:get_current_node()

	for _, next in ipairs(current_node.next) do
		local next_node = deus_run_controller:get_node(next)

		table.insert(node_types, next_node.node_type)
	end

	return node_types
end

DeusMapDecisionView.init = function (self, context)
	self.super.init(self, context)

	self._is_server = context.is_server
	self._server_peer_id = context.server_peer_id
	self._own_peer_id = context.own_peer_id
	self._network_server = context.network_server
	self._wwise_world = context.wwise_world
	self._world = context.world
	local event = Managers.state.event

	event:register(self, "ingame_menu_opened", "on_ingame_menu_opened")
	event:register(self, "ingame_menu_closed", "on_ingame_menu_closed")
end

DeusMapDecisionView._start = function (self)
	self._state = states.IDLE
	local current_node_key = self._deus_run_controller:get_current_node_key()
	self._shared_state = SharedState:new("deus_map_" .. self._deus_run_controller:get_run_id() .. "_" .. current_node_key, shared_state_spec, self._is_server, self._network_server, self._server_peer_id, self._own_peer_id)

	self._shared_state:register_rpcs(self._network_event_delegate)
	self._shared_state:full_sync()
	self._shared_state:set_own(self._shared_state:get_key("ready"), true)

	local current_node = self._deus_run_controller:get_current_node()

	if self._is_server then
		local twitch_manager = Managers.twitch
		local is_twitch_voting = twitch_manager:is_connected() and #current_node.next == 2
		local map_state_key = self._shared_state:get_key("map_state")

		if is_twitch_voting then
			self._deus_run_controller:request_standard_twitch_level_vote(twitch_manager)
			self._shared_state:set_server(map_state_key, states.TWITCH_STARTING)
		else
			self._shared_state:set_server(map_state_key, states.STARTING)
		end

		self._shared_state:set_server(self._shared_state:get_key("final_node_selected"), "")

		local start_dialogue_event = nil
		local next_node_types = get_next_node_types(self._deus_run_controller)

		if table.contains(next_node_types, "shop") then
			start_dialogue_event = "deus_before_shrine_tutorial"
		else
			start_dialogue_event = "deus_map_tutorial"
		end

		local vo_unit = LevelHelper:find_dialogue_unit(self._world, "ferry_lady_01")
		local dialogue_input = ScriptUnit.extension_input(vo_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_dialogue_event(start_dialogue_event, event_data)
	end

	self._shared_state:set_own(self._shared_state:get_key("vote"), "")

	if current_node_key ~= "start" then
		self._scene:set_zoomed_camera_to(current_node.layout_x, current_node.layout_y)
	end

	self._scene:animate_camera_to(current_node.layout_x, current_node.layout_y, CAMERA_TRANSITION_DURATION)

	local journey_name = self._deus_run_controller:get_journey_name()

	self._ui:set_journey_name(journey_name)
	self._ui:hide_content()
	self._ui:show_full_screen_rect()
	self._ui:set_alpha_multiplier(1)
	self._ui:fade_out(CAMERA_TRANSITION_DURATION)

	self._initial_animation_duration_left = CAMERA_TRANSITION_DURATION
	local visibility_data = self._deus_run_controller:get_map_visibility()
	self._visibility_data = visibility_data

	self._scene:setup_fog(visibility_data)

	local traversed_nodes = self._deus_run_controller:get_traversed_nodes()
	local prev_node = "start"

	self._scene:traversed_node(prev_node)

	for i = 1, #traversed_nodes, 1 do
		local node = traversed_nodes[i]

		if node ~= "start" then
			self._scene:traversed_node(node)
			self._scene:highlight_edge(prev_node, node)

			prev_node = node
		end
	end

	for _, next_node_key in ipairs(current_node.next) do
		self._scene:highlight_edge(current_node_key, next_node_key)
	end

	local unreachable_nodes = self._deus_run_controller:get_unreachable_nodes()

	for _, unreachable_node_key in ipairs(unreachable_nodes) do
		self._scene:unreachable_node(unreachable_node_key)
	end

	self._scene:select_node(current_node_key)
end

DeusMapDecisionView.register_rpcs = function (self, network_event_delegate, network_transmit)
	DeusMapDecisionView.super.register_rpcs(self, network_event_delegate, network_transmit)

	self._network_event_delegate = network_event_delegate
end

DeusMapDecisionView.unregister_rpcs = function (self)
	DeusMapDecisionView.super.unregister_rpcs(self)

	self._network_event_delegate = nil
end

DeusMapDecisionView.destroy = function (self)
	DeusMapDecisionView.super.destroy(self)
	self:unregister_rpcs()

	if self._shared_state then
		self._shared_state:destroy()

		self._shared_state = nil
	end
end

DeusMapDecisionView._update = function (self, dt, t)
	local shared_state_revision = self._shared_state:get_revision()
	local run_state_revision = self._deus_run_controller:get_state_revision()

	if self._shared_state_revision ~= shared_state_revision or self._run_state_revision ~= run_state_revision then
		self:_update_player_state()

		self._shared_state_revision = shared_state_revision
		self._run_state_revision = run_state_revision
	end

	if self._initial_animation_duration_left then
		self._initial_animation_duration_left = self._initial_animation_duration_left - dt

		if self._initial_animation_duration_left <= 0 then
			self._initial_animation_duration_left = nil

			self._ui:show_content()
			self._ui:hide_full_screen_rect()
			self._ui:set_alpha_multiplier(0)
			self._ui:fade_in(CONTENT_FADE_IN_DURATION)
		end
	end

	local state = self._shared_state:get_server(self._shared_state:get_key("map_state"))

	if self._is_server then
		local new_state = self:_check_transition(state)

		if new_state ~= state then
			self._shared_state:set_server(self._shared_state:get_key("map_state"), new_state)

			state = new_state
		end
	end

	if self._prev_state ~= state then
		if state == states.TWITCH_STARTING then
			self:_on_enter_starting(dt, t)
		elseif state == states.STARTING then
			self:_on_enter_starting(dt, t)
		elseif state == states.WAITING then
			self:_on_enter_waiting(dt, t)
		elseif state == states.TWITCH_WAITING then
			self:_on_enter_waiting(dt, t)
		elseif state == states.VOTING then
			self:_on_enter_voting(dt, t)
		elseif state == states.VOTING_FINISHING then
			self:_on_enter_voting_finishing(dt, t)
		elseif state == states.FINISHING then
			self:_on_enter_finishing(dt, t)
		elseif state == states.FINISHED then
			self:_on_enter_finished(dt, t)
		end
	end

	if state == states.TWITCH_STARTING then
		self:_update_during_starting(dt, t)
	elseif state == states.STARTING then
		self:_update_during_starting(dt, t)
	elseif state == states.WAITING then
		self:_update_during_waiting(dt, t)
	elseif state == states.VOTING then
		self:_update_during_voting(dt, t)
	elseif state == states.VOTING_FINISHING then
		self:_update_during_voting_finishing(dt, t)
	elseif state == states.FINISHING then
		self:_update_during_finishing(dt, t)
	end

	self._prev_state = state
end

DeusMapDecisionView._get_rpcs = function (self)
	return nil
end

DeusMapDecisionView._node_pressed = function (self, node_key)
	if self._prev_state == states.TWITCH_WAITING then
		return
	end

	local previous_node_key = self._shared_state:get_own(self._shared_state:get_key("vote")) or ""
	local current_node_key = self._deus_run_controller:get_current_node_key()
	local graph_data = self._deus_run_controller:get_graph_data()
	local node = graph_data[node_key]
	local prev_node = graph_data[previous_node_key]

	if previous_node_key ~= "" then
		self._scene:unselect_node(previous_node_key)

		for _, next in ipairs(prev_node.next) do
			self._scene:unhighlight_edge(previous_node_key, next)
		end
	else
		self._scene:unselect_node(current_node_key)
	end

	if previous_node_key == node_key then
		if Managers.input:is_device_active("gamepad") then
			self._scene:select_node(current_node_key, SOUND_EVENTS.token_move)
			self._shared_state:set_own(self._shared_state:get_key("vote"), "")
		else
			self._scene:select_node(previous_node_key, SOUND_EVENTS.token_move)
			self._shared_state:set_own(self._shared_state:get_key("vote"), previous_node_key)

			for _, next in ipairs(node.next) do
				self._scene:highlight_edge(previous_node_key, next)
			end
		end
	else
		self._scene:select_node(node_key, SOUND_EVENTS.token_move)
		self._shared_state:set_own(self._shared_state:get_key("vote"), node_key)

		for _, next in ipairs(node.next) do
			self._scene:highlight_edge(node_key, next)
		end
	end

	if self._hovered_node == node_key then
		self:_enable_hover(node_key)
	end

	self:_play_sound(SOUND_EVENTS.node_pressed)
end

DeusMapDecisionView._node_hovered = function (self, node_key)
	self:_enable_hover(node_key)
end

DeusMapDecisionView._node_unhovered = function (self)
	self:_disable_hover()
end

DeusMapDecisionView._check_transition = function (self, state)
	if state == states.TWITCH_STARTING then
		if self._starting_countdown == 0 or self:_are_all_peers_ready() then
			return states.TWITCH_WAITING
		end
	elseif state == states.STARTING then
		if self._starting_countdown == 0 or self:_are_all_peers_ready() then
			return states.WAITING
		end
	elseif state == states.TWITCH_WAITING then
		if self:_get_twitch_vote() then
			self:_handle_twitch_waiting_end()

			return states.FINISHING
		end
	elseif state == states.WAITING then
		if self:_did_someone_vote() then
			return states.VOTING
		end
	elseif state == states.VOTING then
		if not self:_did_someone_vote() then
			return states.WAITING
		end

		if self:_did_everyone_vote() then
			return states.VOTING_FINISHING
		end

		if self._voting_countdown == 0 then
			self:_handle_voting_end()

			return states.FINISHING
		end
	elseif state == states.VOTING_FINISHING then
		if not self:_did_someone_vote() then
			return states.WAITING
		end

		if self._voting_countdown == 0 then
			self:_handle_voting_end()

			return states.FINISHING
		end
	elseif state == states.FINISHING and self._final_countdown == 0 then
		return states.FINISHED
	end

	return state
end

DeusMapDecisionView._enable_hover = function (self, node_key)
	if self._hovered_node then
		self:_disable_hover()
	end

	local graph_data = self._deus_run_controller:get_graph_data()
	local node = graph_data[node_key]
	local visibility_level = self._visibility_data[node_key]
	local visibility_config = VISIBILITY_CONFIG[visibility_level]
	local reveal_base_level = visibility_config.level
	local reveal_theme = visibility_config.theme
	local reveal_minor_modifier = visibility_config.minor_modifier
	local reveal_conflict_settings = visibility_config.conflict_settings
	local reveal_terror_event_power_up = visibility_config.terror_event_power_up
	local current_node = self._deus_run_controller:get_current_node()
	local own_peer_id = self._deus_run_controller:get_own_peer_id()
	local profile_index, career_index = self._deus_run_controller:get_player_profile(own_peer_id, REAL_PLAYER_LOCAL_ID)

	self._ui:enable_hover_text(self._scene:get_screen_pos_of_node(node_key), node.level_type, (reveal_base_level and node.base_level) or nil, (reveal_theme and node.theme) or nil, (reveal_minor_modifier and node.minor_modifier_group) or nil, (reveal_conflict_settings and node.conflict_settings) or nil, (reveal_terror_event_power_up and node.terror_event_power_up) or nil, self._shared_state:get_own(self._shared_state:get_key("vote")) == node_key, table.contains(current_node.next, node_key), profile_index, career_index)
	self._scene:hover_node(node_key)

	self._hovered_node = node_key

	self:_play_sound(SOUND_EVENTS.node_hover)
end

DeusMapDecisionView._disable_hover = function (self)
	self._ui:disable_hover_text()
	self._scene:unhover_node(self._hovered_node)

	self._hovered_node = nil
end

DeusMapDecisionView._on_enter_starting = function (self, dt, t)
	self._ui:set_general_info(Localize("deus_map_info_waiting_title"), Localize("deus_map_info_waiting_desc"))

	self._starting_countdown = START_COUNTDOWN
end

DeusMapDecisionView._update_during_starting = function (self, dt, t)
	self._starting_countdown = math.max(0, self._starting_countdown - dt)

	self._ui:update_timer(self._starting_countdown)
end

DeusMapDecisionView._on_enter_waiting = function (self, dt, t)
	self._ui:set_general_info(Localize("deus_map_info_voting_title"), Localize("deus_map_info_voting_desc"))

	local current_node = self._deus_run_controller:get_current_node()

	for _, next in ipairs(current_node.next) do
		self._scene:selectable_node(next)
	end

	self._ui:hide_timer()
end

DeusMapDecisionView._update_during_waiting = function (self, dt, t)
	return
end

DeusMapDecisionView._on_enter_voting = function (self, dt, t)
	local current_node = self._deus_run_controller:get_current_node()

	for _, next in ipairs(current_node.next) do
		self._scene:selectable_node(next)
	end

	if self._voting_countdown then
		self._voting_countdown = math.max(self._voting_countdown, VOTING_FINISHING_COUNTDOWN)
	else
		self._voting_countdown = VOTING_COUNTDOWN
	end
end

DeusMapDecisionView._update_during_voting = function (self, dt, t)
	self._voting_countdown = math.max(0, self._voting_countdown - dt)

	self._ui:update_timer(self._voting_countdown)
end

DeusMapDecisionView._on_enter_voting_finishing = function (self, dt, t)
	local current_node = self._deus_run_controller:get_current_node()

	for _, next in ipairs(current_node.next) do
		self._scene:selectable_node(next)
	end

	if self._voting_countdown then
		self._voting_countdown = math.min(self._voting_countdown, VOTING_FINISHING_COUNTDOWN)
	else
		self._voting_countdown = VOTING_FINISHING_COUNTDOWN
	end
end

DeusMapDecisionView._update_during_voting_finishing = function (self, dt, t)
	self._voting_countdown = math.max(0, self._voting_countdown - dt)

	self._ui:update_timer(self._voting_countdown)
end

DeusMapDecisionView._on_enter_finishing = function (self, dt, t)
	self._final_countdown = FINAL_COUNTDOWN
	local current_node_key = self._deus_run_controller:get_current_node_key()
	local current_node = self._deus_run_controller:get_current_node()
	local vote = self._shared_state:get_own(self._shared_state:get_key("vote")) or ""

	if vote ~= "" then
		self._scene:unselect_node(vote)
	end

	local final_node_key = self._shared_state:get_server(self._shared_state:get_key("final_node_selected"))
	local deus_graph_data = self._deus_run_controller:get_graph_data()
	local final_node = deus_graph_data[final_node_key]

	for _, next in ipairs(current_node.next) do
		self._scene:unselectable_node(next)

		if next ~= final_node_key then
			self._scene:unhighlight_edge(current_node_key, next)
		end
	end

	self._scene:set_final_node(final_node_key)
	self._scene:zoom_camera_to(final_node.layout_x, final_node.layout_y, CAMERA_TRANSITION_DURATION)
	self._ui:set_general_info(Localize("deus_map_info_finishing_title"), string.format(Localize("deus_map_info_finishing_desc"), Localize(final_node.base_level .. "_" .. "title")))
	self._deus_run_controller:map_finished_voting()
end

DeusMapDecisionView._on_enter_finished = function (self, dt, t)
	local finish_cb = self._finish_cb

	if finish_cb then
		self._finish_cb = nil

		finish_cb(self._shared_state:get_server(self._shared_state:get_key("final_node_selected")))
		self._ui:fade_out(CONTENT_FADE_OUT_DURATION)
	end

	Managers.state.event:trigger("close_ingame_menu")
	self:_finish()
end

DeusMapDecisionView._finish = function (self)
	DeusMapDecisionView.super._finish(self)

	self._voting_countdown = nil
	self._starting_countdown = nil
	self._final_countdown = nil

	if self._shared_state then
		self._shared_state:unregister_rpcs()
		self._shared_state:destroy()

		self._shared_state = nil
	end
end

DeusMapDecisionView._update_during_finishing = function (self, dt, t)
	self._final_countdown = math.max(0, self._final_countdown - dt)

	self._ui:update_timer(self._final_countdown, Localize("game_starts_prepare"))
end

DeusMapDecisionView._update_player_state = function (self)
	local player_data = {}
	local local_peer_id = Network.peer_id()
	local deus_graph_data = self._deus_run_controller:get_graph_data()
	local local_peer_index = nil
	local peers = self._deus_run_controller:get_peers()

	for i, peer_id in ipairs(peers) do
		if local_peer_id == peer_id then
			local_peer_index = i
		end

		local data = {}
		local profile_index, career_index = self._deus_run_controller:get_player_profile(peer_id, REAL_PLAYER_LOCAL_ID)

		if profile_index ~= 0 and career_index ~= 0 then
			data.profile_index = profile_index
			data.career_index = career_index
			data.level = self._deus_run_controller:get_player_level(peer_id, data.profile_index)
			data.frame = self._deus_run_controller:get_player_frame(peer_id, data.profile_index, data.career_index)
			data.name = self._deus_run_controller:get_player_name(peer_id)
			data.health_percentage = self._deus_run_controller:get_player_health_percentage(peer_id, REAL_PLAYER_LOCAL_ID) or 1
			data.healthkit_consumable = self._deus_run_controller:get_player_consumable_healthkit_slot(peer_id, REAL_PLAYER_LOCAL_ID)
			data.potion_consumable = self._deus_run_controller:get_player_consumable_potion_slot(peer_id, REAL_PLAYER_LOCAL_ID)
			data.grenade_consumable = self._deus_run_controller:get_player_consumable_grenade_slot(peer_id, REAL_PLAYER_LOCAL_ID)
			data.ammo_percentage = self._deus_run_controller:get_player_ranged_ammo(peer_id, REAL_PLAYER_LOCAL_ID)
			data.soft_currency = self._deus_run_controller:get_player_soft_currency(peer_id) or 0
			local vote = self._shared_state:get_peer(peer_id, self._shared_state:get_key("vote")) or ""
			data.vote = (vote ~= "" and deus_graph_data[vote].base_level) or nil
		else
			data.profile_index = 0
			data.career_index = 0
			data.level = 1
			data.frame = "default"
			data.health_percentage = 1
			data.soft_currency = 0
		end

		table.insert(player_data, data)
	end

	if local_peer_index then
		local first_player_data = player_data[1]
		player_data[1] = player_data[local_peer_index]
		player_data[local_peer_index] = first_player_data
	end

	self._ui:update_player_data(player_data)

	local current_node_key = self._deus_run_controller:get_current_node_key()
	local profile_indexes_missing = {
		true,
		true,
		true,
		true,
		true
	}
	local final_node_selected = self._shared_state:get_server(self._shared_state:get_key("final_node_selected"))

	for index, peer_id in ipairs(peers) do
		local profile_index, _ = self._deus_run_controller:get_player_profile(peer_id, REAL_PLAYER_LOCAL_ID)

		if profile_index ~= 0 then
			local vote = self._shared_state:get_peer(peer_id, self._shared_state:get_key("vote"))
			local node_key = (final_node_selected and final_node_selected ~= "" and final_node_selected) or (vote and vote ~= "" and vote) or current_node_key

			self._scene:place_token(profile_index, index, node_key)

			profile_indexes_missing[profile_index] = false
		end
	end

	for profile_index, missing in pairs(profile_indexes_missing) do
		if missing then
			self._scene:hide_token(profile_index)
		end
	end

	local own_peer_id = self._deus_run_controller:get_own_peer_id()
	local own_profile_index, _ = self._deus_run_controller:get_player_profile(own_peer_id, REAL_PLAYER_LOCAL_ID)

	if own_profile_index ~= 0 then
		local profile_settings = SPProfiles[own_profile_index]
		local hero_name = profile_settings.display_name

		self._scene:set_own_hero_name(hero_name)
	end
end

DeusMapDecisionView._handle_voting_end = function (self)
	local deus_run_controller = self._deus_run_controller
	local votes = {}
	local max_vote_count = 0

	for _, peer_id in ipairs(deus_run_controller:get_peers()) do
		local vote = self._shared_state:get_peer(peer_id, self._shared_state:get_key("vote")) or ""

		if vote ~= "" then
			local vote_count = votes[vote]
			vote_count = (vote_count and vote_count + 1) or 1
			votes[vote] = vote_count

			if max_vote_count < vote_count then
				max_vote_count = vote_count
			end
		end
	end

	local max_votes = {}

	for vote, vote_count in pairs(votes) do
		if max_vote_count <= vote_count then
			max_votes[#max_votes + 1] = vote
		end
	end

	local current_node = deus_run_controller:get_current_node()

	if #max_votes == 0 then
		for _, node in ipairs(current_node.next) do
			max_votes[#max_votes + 1] = node
		end
	end

	local random_index = Math.random(1, #max_votes)
	local next_node_key = max_votes[random_index]

	self._shared_state:set_server(self._shared_state:get_key("final_node_selected"), next_node_key)

	local graph_data = deus_run_controller:get_graph_data()
	local node = graph_data[next_node_key]

	if node.node_type == "shop" then
		self:_play_networked_2d_sound(SOUND_EVENTS.shrine_final_node_selected)
	else
		self:_play_networked_2d_sound(SOUND_EVENTS.ingame_final_node_selected)
	end
end

DeusMapDecisionView._handle_twitch_waiting_end = function (self)
	local twitch_vote = self:_get_twitch_vote()

	self._shared_state:set_server(self._shared_state:get_key("final_node_selected"), twitch_vote)
end

DeusMapDecisionView._are_all_peers_ready = function (self)
	for _, peer_id in ipairs(self._deus_run_controller:get_peers()) do
		local ready_state = self._shared_state:get_peer(peer_id, self._shared_state:get_key("ready"))

		if ready_state ~= true then
			return false
		end
	end

	return true
end

DeusMapDecisionView._get_twitch_vote = function (self)
	local twitch_vote = self._is_server and self._deus_run_controller:get_twitch_level_vote()

	if twitch_vote then
		return twitch_vote
	else
		return nil
	end
end

DeusMapDecisionView._did_someone_vote = function (self)
	for _, peer_id in ipairs(self._deus_run_controller:get_peers()) do
		local vote = self._shared_state:get_peer(peer_id, self._shared_state:get_key("vote"))

		if vote ~= nil and vote ~= "" then
			return true
		end
	end

	return false
end

DeusMapDecisionView._did_everyone_vote = function (self)
	for _, peer_id in ipairs(self._deus_run_controller:get_peers()) do
		local vote = self._shared_state:get_peer(peer_id, self._shared_state:get_key("vote")) or ""

		if vote == "" then
			return false
		end
	end

	return true
end

DeusMapDecisionView._get_current_votes = function (self)
	local votes = {}

	for _, peer_id in ipairs(self._deus_run_controller:get_peers()) do
		local vote = self._shared_state:get_peer(peer_id, self._shared_state:get_key("vote")) or ""
		votes[peer_id] = vote
	end

	return votes
end

DeusMapDecisionView._are_votes_different = function (self, previous_votes)
	local prev_vote_count = 0

	for _, _ in pairs(previous_votes) do
		prev_vote_count = prev_vote_count + 1
	end

	local new_vote_count = 0

	for _, peer_id in ipairs(self._deus_run_controller:get_peers()) do
		new_vote_count = new_vote_count + 1
		local vote = self._shared_state:get_peer(peer_id, self._shared_state:get_key("vote")) or ""

		if previous_votes[peer_id] ~= vote then
			return true
		end
	end

	return prev_vote_count ~= new_vote_count
end

DeusMapDecisionView._play_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end

DeusMapDecisionView._play_networked_2d_sound = function (self, event)
	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_2d_audio_event(event)
end

DeusMapDecisionView.on_ingame_menu_opened = function (self)
	Managers.input:disable_gamepad_cursor()
end

DeusMapDecisionView.on_ingame_menu_closed = function (self)
	Managers.input:enable_gamepad_cursor()
end

return
