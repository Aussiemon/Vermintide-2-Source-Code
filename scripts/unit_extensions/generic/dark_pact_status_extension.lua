-- chunkname: @scripts/unit_extensions/generic/dark_pact_status_extension.lua

local stagger_types = require("scripts/utils/stagger_types")

DarkPactStatusExtension = class(DarkPactStatusExtension, GenericStatusExtension)

DarkPactStatusExtension.init = function (self, extension_init_context, unit, extension_init_data)
	DarkPactStatusExtension.super.init(self, extension_init_context, unit, extension_init_data)

	self._profile_index = extension_init_data.profile_id
	self._player = extension_init_data.player
	self._is_pinning_enemy = nil
	self._pinned_enemy_unit = nil
	self._is_packmaster_grabbing = nil
	self._is_packmaster_dragging = nil
	self._unarmed = nil
	self._packmaster_dragged_unit = nil
	self._stagger_type = stagger_types.none
	self._accumulated_stagger = 0
	self._stagger_count = 0
	self._stagger_direction = Vector3Box(Vector3(0, 0, 0))
	self._stagger_animation_scale = 1
	self._stagger_animation_done = false
	self._stagger_length = 0
	self._stagger_time = 0
	self._stagger_immune_time = nil
	self._heavy_stagger_immune_time = nil
	self._always_stagger_suffered = false
	self._breed = extension_init_data.breed or Unit.get_data(unit, "breed")
	self._stagger_reset_time = 0
	self._breed_action = nil
	self._is_climbing = false
	self._is_tunneling = false
	self._is_spawning = false
end

DarkPactStatusExtension.extensions_ready = function (self)
	DarkPactStatusExtension.super.extensions_ready(self)
end

DarkPactStatusExtension.destroy = function (self)
	DarkPactStatusExtension.super.destroy(self)
end

DarkPactStatusExtension.set_pinning_enemy = function (self, is_pinning, target_unit)
	if is_pinning then
		self._pinned_enemy_unit = target_unit
		self._is_pinning_enemy = true
	else
		self._pinned_enemy_unit = nil
		self._is_pinning_enemy = false
	end
end

DarkPactStatusExtension.set_is_packmaster_grabbing = function (self, grabbing)
	self._is_packmaster_grabbing = grabbing
end

DarkPactStatusExtension.get_is_packmaster_grabbing = function (self)
	return self._is_packmaster_grabbing
end

DarkPactStatusExtension.get_is_packmaster_dragging = function (self)
	return self._is_packmaster_dragging
end

DarkPactStatusExtension.set_is_packmaster_dragging = function (self, target_unit)
	self._is_packmaster_dragging = true
	self._packmaster_dragged_unit = target_unit
end

DarkPactStatusExtension.set_packmaster_released = function (self)
	self._is_packmaster_dragging = false
	self._packmaster_dragged_unit = nil
end

DarkPactStatusExtension.set_unarmed = function (self, unarmed)
	self._unarmed = unarmed
end

DarkPactStatusExtension.get_unarmed = function (self)
	return self._unarmed
end

DarkPactStatusExtension.get_packmaster_dragged_unit = function (self)
	return self._packmaster_dragged_unit
end

DarkPactStatusExtension.set_ghost_mode = function (self, is_in_ghost_mode)
	self.in_ghost_mode = is_in_ghost_mode
end

DarkPactStatusExtension.get_in_ghost_mode = function (self)
	return self.in_ghost_mode
end

DarkPactStatusExtension.in_view_enemy_party_players = function (self, unit, player, physics_world)
	local ghost_mode_system = Managers.state.entity:system("ghost_mode_system")
	local peer_id = player:network_id()
	local local_player_id = player:local_player_id()
	local party = Managers.party:get_party_from_player_id(peer_id, local_player_id)
	local side = Managers.state.side.side_by_party[party]
	local enemy_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local in_los = ghost_mode_system:in_line_of_sight_of_enemies(unit, enemy_positions, physics_world)

	return in_los
end

DarkPactStatusExtension.update = function (self, unit, input, dt, context, t)
	DarkPactStatusExtension.super.update(self, unit, input, dt, context, t)
	self:update_stagger_count(t)
end

DarkPactStatusExtension.is_staggered = function (self)
	return self._stagger_type > stagger_types.none
end

DarkPactStatusExtension.accumulated_stagger = function (self)
	return self._accumulated_stagger
end

DarkPactStatusExtension.stagger_count = function (self)
	return self._stagger_count
end

DarkPactStatusExtension.stagger_direction = function (self)
	return self._stagger_direction
end

DarkPactStatusExtension.stagger_animation_scale = function (self)
	return self._stagger_animation_scale
end

DarkPactStatusExtension.stagger_time = function (self)
	return self._stagger_time
end

DarkPactStatusExtension.stagger_immune_time = function (self)
	return self._stagger_immune_time
end

DarkPactStatusExtension.stagger_type = function (self)
	return self._stagger_type
end

DarkPactStatusExtension.set_stagger_immune_time = function (self, value)
	self._stagger_immune_time = value
end

DarkPactStatusExtension.heavy_stagger_immune_time = function (self)
	return self._heavy_stagger_immune_time
end

DarkPactStatusExtension.set_heavy_stagger_immune_time = function (self, value)
	self._heavy_stagger_immune_time = value
end

DarkPactStatusExtension.set_always_stagger_suffered = function (self, value)
	self._always_stagger_suffered = value
end

DarkPactStatusExtension.always_stagger_suffered = function (self)
	return self._always_stagger_suffered
end

DarkPactStatusExtension.stagger_length = function (self)
	return self._stagger_length
end

DarkPactStatusExtension.stagger_animation_done = function (self)
	return self._stagger_animation_done
end

DarkPactStatusExtension.set_stagger_animation_done = function (self, value)
	self._stagger_animation_done = value
end

DarkPactStatusExtension.set_stagger_values = function (self, stagger_type, stagger_direction, stagger_length, accumulated_stagger, stagger_time, stagger_animation_scale, always_stagger_suffered, send_rpc)
	local t = Managers.time:time("game")

	self._stagger_type = stagger_type

	self._stagger_direction:store(stagger_direction)

	self._stagger_length = stagger_length
	self._accumulated_stagger = accumulated_stagger
	self._stagger_time = stagger_time > 0 and stagger_time + t or 0
	self._stagger_animation_scale = stagger_animation_scale or 1
	self._always_stagger_suffered = always_stagger_suffered or false

	if not send_rpc or not Managers.state.network:game() then
		return
	end

	local stagger_time_network = stagger_time or 0
	local unit_go_id = Managers.state.unit_storage:go_id(self.unit)

	if self.is_server then
		local player = Managers.player:owner(self.unit)

		if player then
			local peer_id = player.peer_id

			Managers.state.network.network_transmit:send_rpc("rpc_set_stagger", peer_id, unit_go_id, stagger_type, stagger_direction, stagger_length, accumulated_stagger, stagger_time_network, self._stagger_animation_scale, self._always_stagger_suffered)
		end
	else
		Managers.state.network.network_transmit:send_rpc_server("rpc_set_stagger", unit_go_id, stagger_type, stagger_direction, stagger_length, accumulated_stagger, stagger_time_network, self._stagger_animation_scale, self._always_stagger_suffered)
	end
end

local DEFAULT_STAGGER_RESET_TIME = 10

DarkPactStatusExtension.increase_stagger_count = function (self)
	local t = Managers.time:time("main")
	local breed = Unit.get_data(self.unit, "breed")
	local stagger_count = self._stagger_count
	local reset_time = breed.stagger_count_reset_time or DEFAULT_STAGGER_RESET_TIME

	self._stagger_count = stagger_count + 1
	self._stagger_reset_time = t + reset_time
end

DarkPactStatusExtension.update_stagger_count = function (self, t)
	if t > self._stagger_reset_time and self._stagger_count > 0 then
		self._stagger_count = 0
	end
end

DarkPactStatusExtension.set_breed_action = function (self, breed_name, breed_action_name)
	local breed_actions = BreedActions[breed_name]

	self._breed_action = breed_actions[breed_action_name]
end

DarkPactStatusExtension.breed_action = function (self)
	return self._breed_action
end

DarkPactStatusExtension.set_is_climbing = function (self, climbing)
	self._is_climbing = climbing
end

DarkPactStatusExtension.is_climbing = function (self)
	return self._about_to_climb or self._is_climbing
end

DarkPactStatusExtension.should_climb = function (self)
	return self._about_to_climb
end

DarkPactStatusExtension.set_should_climb = function (self, climbing)
	self._about_to_climb = climbing
end

DarkPactStatusExtension.should_tunnel = function (self)
	return self._is_tunneling
end

DarkPactStatusExtension.set_should_tunnel = function (self, tunneling)
	self._is_tunneling = tunneling
end

DarkPactStatusExtension.should_spawn = function (self)
	return self._is_spawning
end

DarkPactStatusExtension.set_should_spawn = function (self, spawning)
	self._is_spawning = spawning
end

return "DarkPactStatusExtension"
