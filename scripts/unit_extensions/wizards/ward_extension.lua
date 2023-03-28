WardExtension = class(WardExtension)
local aggressive_dist_sq = 49
local default_num_defenders = 8
local num_defenders = default_num_defenders
local closest_player_check_interval = 0.5
local player_detection_radius = 14
local health_bar_toggle_dist_sq = 196
local defender_breed = Breeds.skaven_clan_rat
local defender_behavior = "horde_rat_defend_destructible"
local defender_group_template = "destructible_defenders"
local defender_spawn_event = "ward"
local defender_spawn_rot = QuaternionBox(Quaternion.identity())
local state = {
	idle = 0,
	aggressive = 1
}
local RPCS = {
	"rpc_client_ward_hot_join_sync"
}

WardExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._player_broadphase = Managers.state.entity:system("proximity_system").player_units_broadphase
	self._network_transmit = extension_init_context.network_transmit
	self._network_event_delegate = extension_init_context.network_transmit.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))

	self._defenders = {}
	self._nearby_enemies = {}
	self._next_check = 0
	self._num_spawned = 0
	self._spawned = false
	self._state = state.idle
	self._ward_pos = Vector3Box(Unit.local_position(unit, 0))
	self._is_server = extension_init_context.is_server
	self._event_manager = Managers.state.event

	Managers.state.event:register(self, "spawn_defenders", "spawn_defenders")
	Managers.state.event:register(self, "player_party_changed", "player_party_changed")
end

WardExtension.destroy = function (self)
	if state ~= state.aggressive then
		self:set_defenders_aggressive()
	end

	self._network_event_delegate:unregister(self)
	Managers.state.event:unregister("spawn_defenders", self)
	Managers.state.event:trigger("tutorial_event_remove_health_bar", self._unit)
	Managers.state.event:unregister("player_party_changed", self)
end

WardExtension.update = function (self, unit, input, dt, context, t)
	if self._spawned then
		self:toggle_health_bar_by_proximity(unit)
	end

	if not self._is_server and self._state == state.aggressive then
		return
	end

	local ward_pos = self._ward_pos:unbox()

	if self._next_check < t then
		self._closest_player = self:get_closest_player(ward_pos)
		self._next_check = t + closest_player_check_interval
	end

	if self._closest_player and ward_pos then
		self:update_state(ward_pos, self._closest_player)
	end
end

local nearby_player_units = {}

WardExtension.get_closest_player = function (self, ward_pos)
	local num_players = Broadphase.query(self._player_broadphase, ward_pos, player_detection_radius, nearby_player_units)

	if num_players == 0 then
		return
	end

	if num_players == 1 then
		return nearby_player_units[1]
	end

	local closest_player_dist_sq = math.huge
	local closest_player, player_pos, player_unit = nil

	for i = 1, num_players do
		player_unit = nearby_player_units[i]
		player_pos = POSITION_LOOKUP[player_unit]
		local dist_sq = Vector3.distance_squared(ward_pos, player_pos)

		if dist_sq < closest_player_dist_sq then
			closest_player = player_unit
			closest_player_dist_sq = dist_sq
		end
	end

	return closest_player
end

WardExtension.update_state = function (self, ward_pos, closest_player)
	if not ward_pos then
		return
	end

	local player_pos = POSITION_LOOKUP[closest_player]

	if not player_pos then
		return
	end

	local dist_sq = Vector3.distance_squared(ward_pos, player_pos)

	if dist_sq < aggressive_dist_sq then
		self:set_defenders_aggressive(closest_player)

		self._state = state.aggressive

		return
	end

	self._state = state.idle
end

WardExtension.set_defenders_aggressive = function (self, closest_player)
	local ai_group_system = Managers.state.entity:system("ai_group_system")
	local group = ai_group_system:get_ai_group(self._defender_group_id)

	if group then
		AIGroupTemplates.destructible_defenders.set_group_aggressive(group, closest_player)
	end
end

WardExtension.spawn_defenders = function (self, num_defenders)
	self._spawned = true

	if not self._is_server then
		return
	end

	num_defenders = num_defenders or default_num_defenders
	self._defender_group_id = Managers.state.entity:system("ai_group_system"):generate_group_id()
	local defender_optional_data = {
		behavior = defender_behavior,
		ward_pos = self._ward_pos
	}

	defender_optional_data.spawned_func = function (unit, breed, optional_data)
		local blackboard = BLACKBOARDS[unit]
		blackboard.defend = true
		blackboard.defend_get_in_position = true
		blackboard.destructible_pos = optional_data.ward_pos
	end

	local defender_group_data = {
		id = self._defender_group_id,
		size = num_defenders,
		template = defender_group_template
	}

	for i = 1, num_defenders do
		Managers.state.conflict:spawn_queued_unit(defender_breed, self._ward_pos, defender_spawn_rot, defender_spawn_event, nil, nil, defender_optional_data, defender_group_data)
	end
end

WardExtension.toggle_health_bar_by_proximity = function (self, ward_unit)
	local local_player_unit = self._local_player_unit_unit

	if not local_player_unit then
		self._local_player_unit_unit = Managers.player:local_player().player_unit
	end

	if not Unit.alive(local_player_unit) then
		if self._health_bar_on then
			self._health_bar_on = false

			self._event_manager:trigger("tutorial_event_show_health_bar", ward_unit, false)
		end

		return
	end

	local ward_pos = self._ward_pos:unbox()
	local player_pos = Unit.world_position(local_player_unit, 0)
	local in_range = Vector3.distance_squared(ward_pos, player_pos) < health_bar_toggle_dist_sq

	if in_range and not self._health_bar_on then
		self._health_bar_on = true

		self._event_manager:trigger("tutorial_event_show_health_bar", ward_unit, true)
	elseif not in_range and self._health_bar_on then
		self._health_bar_on = false

		self._event_manager:trigger("tutorial_event_show_health_bar", ward_unit, false)
	end
end

WardExtension.player_party_changed = function (self)
	if self._is_server and self._spawned then
		self._network_transmit:send_rpc_clients("rpc_client_ward_hot_join_sync", self._spawned)
	end
end

WardExtension.rpc_client_ward_hot_join_sync = function (self, spawned)
	self._spawned = spawned
end
