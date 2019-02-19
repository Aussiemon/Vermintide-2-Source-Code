require("scripts/settings/end_zone_settings")

EndZoneExtension = class(EndZoneExtension)

EndZoneExtension.init = function (self, extension_init_context, unit)
	self._unit = unit
	self._world = extension_init_context.world
	self._extension_init_context = extension_init_context
	self._activated = false
	self._activation_allowed = false
	self._closest_player = math.huge
	self._state = "_idle"
	self._is_server = extension_init_context.is_server
	self._state_data = {}
	self._player_distances = {}
	self._current_volume_id = nil
	self._current_id_index = 0
	self._waystone_type = Unit.get_data(unit, "waystone_type")
	self._always_activated = Unit.get_data(unit, "always_activated")

	if Unit.get_data(self._unit, "game_start_waystone") then
		self._game_start_time = Unit.get_data(self._unit, "game_start_time")
	end

	self._disable_complete_level = Unit.get_data(self._unit, "disable_complete_level")
	self._disable_check_joining_players = Unit.get_data(self._unit, "disable_check_joining_players")
	local node = Unit.node(self._unit, "ap_dome_scaler")

	Unit.set_local_scale(self._unit, node, Vector3(0, 0, 0))

	if Unit.has_visibility_group(self._unit, "dome") then
		Unit.set_visibility(self._unit, "dome", false)
	end

	self:_set_light_intensity(0)

	local network_event_delegate = Managers.state.network.network_transmit.network_event_delegate

	network_event_delegate:register(self, "rpc_activate_end_zone")

	local level_settings = LevelHelper:current_level_settings(self._world)
	self._nav_world_available = not level_settings.no_bots_allowed
end

EndZoneExtension.rpc_activate_end_zone = function (self, sender, waystone_type, activate)
	if waystone_type ~= self._waystone_type then
		return
	end

	if self._activated and not activate then
		self:_deactivate_volume()
	elseif not self._activated and activate then
		self:_activate_volume()
	end

	self._activated = activate
end

EndZoneExtension.activated = function (self)
	return self._activated
end

EndZoneExtension._set_light_intensity = function (self, intensity)
	local num_lights = Unit.num_lights(self._unit)

	for i = 0, num_lights - 1, 1 do
		local light = Unit.light(self._unit, i)

		Light.set_intensity(light, intensity)
	end
end

EndZoneExtension.end_time = function (self)
	return self._game_start_time or EndZoneSettings.end_zone_timer
end

EndZoneExtension.end_time_left = function (self)
	return self._state_data.end_zone_timer or self:end_time()
end

EndZoneExtension.update = function (self, unit, input, dt, context, t)
	self:_reset_distances()
	self:_check_proximity()
	self:_update_state(dt, t)
end

EndZoneExtension.activation_allowed = function (self, allowed)
	self._activation_allowed = allowed
end

EndZoneExtension._activate = function (self, activate)
	if not self._is_server then
		return
	end

	if not self._activated and activate then
		self:_activate_volume()
		Managers.state.network.network_transmit:send_rpc_clients("rpc_activate_end_zone", self._waystone_type, true)
	elseif self._activated and not activate then
		self:_deactivate_volume()
		Managers.state.network.network_transmit:send_rpc_clients("rpc_activate_end_zone", self._waystone_type, false)

		local player_distances = self._player_distances

		for unit, _ in pairs(player_distances) do
			if Unit.alive(unit) then
				local status_ext = ScriptUnit.extension(unit, "status_system")

				status_ext:set_in_end_zone(false)
			end
		end
	end

	self._activated = activate
end

EndZoneExtension._activate_volume = function (self)
	self:_deactivate_volume(self._current_volume_id)

	local shading_environment = Unit.get_data(self._unit, "shading_environment")
	local volume_name = Unit.get_data(self._unit, "volume_name")
	self._current_id_index = self._current_id_index + 1
	self._current_volume_id = "end_zone_id_" .. self._current_id_index

	Managers.state.event:trigger("register_environment_volume", volume_name, shading_environment, 999, 0.1, false, 1, Unit.local_position(self._unit, 0), EndZoneSettings.size, self._current_volume_id)

	if self._is_server and self._nav_world_available then
		local volume_system = Managers.state.entity:system("volume_system")

		fassert(volume_system.nav_tag_volume_handler ~= nil, "Cannot activate end_zone at Level Load (before nav_tag_volume_handler has been set)! LD, please use the coop_round_started event or activate it at a later point!")

		local nav_tag_volume_layer = "end_zone"
		local position = Unit.local_position(self._unit, 0)
		self._nav_tag_volume_id = volume_system:create_nav_tag_volume_from_data(position, EndZoneSettings.size, nav_tag_volume_layer)
	end
end

EndZoneExtension._deactivate_volume = function (self)
	if self._current_volume_id then
		Managers.state.event:trigger("unregister_environment_volume", self._current_volume_id)

		self._current_volume_id = nil
	end

	if self._nav_tag_volume_id then
		local volume_system = Managers.state.entity:system("volume_system")

		volume_system:destroy_nav_tag_volume(self._nav_tag_volume_id)

		self._nav_tag_volume_id = nil
	end
end

EndZoneExtension._reset_distances = function (self)
	self._closest_player = math.huge

	table.clear(self._player_distances)
end

EndZoneExtension._check_proximity = function (self)
	local end_zone_pos = Unit.local_position(self._unit, 0)
	local human_players = Managers.player:human_and_bot_players()

	for _, player in pairs(human_players) do
		local unit = player.player_unit

		if Unit.alive(unit) then
			local player_pos = POSITION_LOOKUP[unit]

			if player_pos then
				local distance_squared = Vector3.distance_squared(end_zone_pos, player_pos)
				self._closest_player = (distance_squared < self._closest_player and distance_squared) or self._closest_player

				if not player.bot_player then
					self._player_distances[unit] = distance_squared
				end
			end
		end
	end
end

EndZoneExtension._update_state = function (self, dt, t)
	if self._is_server then
		if self._activation_allowed then
			local game_mode_manager = Managers.state.game_mode
			local conditions_fulfilled = game_mode_manager:evaluate_end_zone_activation_conditions()

			if conditions_fulfilled and not self._activated then
				self:_activate(true)
			elseif not conditions_fulfilled and self._activated then
				self:_activate(false)
			end
		elseif self._activated then
			self:_activate(false)
		end
	end

	self[self._state](self, dt, t, self._state_data)
end

EndZoneExtension.hot_join_sync = function (self, sender)
	if self._activated then
		RPC.rpc_activate_end_zone(sender, self._waystone_type, true)
	end
end

EndZoneExtension.destroy = function (self)
	local network_event_delegate = Managers.state.network.network_transmit.network_event_delegate

	network_event_delegate:unregister(self)

	if self._nav_tag_volume_id then
		local volume_system = Managers.state.entity:system("volume_system")

		volume_system:destroy_nav_tag_volume(self._nav_tag_volume_id)
	end
end

EndZoneExtension._idle = function (self, dt, t)
	if not self._activated then
		return
	end

	if self._always_activated or self._closest_player <= EndZoneSettings.activate_size^2 then
		self._state_data = {
			timer = 0
		}
		self._state = "_open"

		Unit.flow_event(self._unit, "opening_end_zone")

		if Unit.has_visibility_group(self._unit, "dome") then
			Unit.set_visibility(self._unit, "dome", true)
		end
	end
end

EndZoneExtension._open = function (self, dt, t)
	if self._activated and (self._always_activated or self._closest_player <= EndZoneSettings.activate_size^2) then
		local animation_time = EndZoneSettings.animation_time or 0.5
		self._state_data.timer = math.clamp(self._state_data.timer + dt, 0, animation_time)
		local scale = math.smoothstep(self._state_data.timer / animation_time, 0, 1)
		local node = Unit.node(self._unit, "ap_dome_scaler")

		Unit.set_local_scale(self._unit, node, Vector3(scale, scale, scale))
		self:_set_light_intensity(scale^3)

		if scale == 1 then
			self._state_data.end_zone_timer = self:end_time()
			self._state = "_end_mission_check"
		end
	else
		self._state = "_close"

		Unit.flow_event(self._unit, "closing_end_zone")
	end
end

EndZoneExtension._close = function (self, dt, t)
	if self._activated and (self._always_activated or self._closest_player <= EndZoneSettings.activate_size^2) then
		self._state = "_open"

		Unit.flow_event(self._unit, "opening_end_zone")
	else
		local animation_time = EndZoneSettings.animation_time or 0.5
		self._state_data.timer = math.clamp(self._state_data.timer - dt, 0, animation_time)
		local scale = math.smoothstep(self._state_data.timer / animation_time, 0, 1)
		local node = Unit.node(self._unit, "ap_dome_scaler")

		Unit.set_local_scale(self._unit, node, Vector3(scale, scale, scale))
		self:_set_light_intensity(scale^3)

		if scale == 0 then
			self._state = "_idle"

			if Unit.has_visibility_group(self._unit, "dome") then
				Unit.set_visibility(self._unit, "dome", false)
			end
		end
	end
end

EndZoneExtension._end_mission_check = function (self, dt, t)
	if self._activated and (self._always_activated or self._closest_player <= EndZoneSettings.activate_size^2) then
		local all_inside = nil

		if self._is_server then
			for player_unit, distance_squared in pairs(self._player_distances) do
				if Unit.alive(player_unit) then
					local status_extension = ScriptUnit.extension(player_unit, "status_system")

					if distance_squared > EndZoneSettings.size^2 then
						if not status_extension:is_disabled() then
							all_inside = false
						end

						status_extension:set_in_end_zone(false)
					else
						if all_inside == nil then
							all_inside = true
						end

						status_extension:set_in_end_zone(true)
					end
				end
			end

			if all_inside and self:_check_joining_players() then
				self._state_data.end_zone_timer = math.clamp(self:end_time_left() - dt, 0, self:end_time())

				if self:end_time_left() <= 0 and not self._disable_complete_level then
					Managers.state.game_mode:complete_level()
				end
			else
				self._state_data.end_zone_timer = self:end_time()
			end
		else
			all_inside = nil

			for player_unit, _ in pairs(self._player_distances) do
				if Unit.alive(player_unit) then
					local status_extension = ScriptUnit.extension(player_unit, "status_system")

					if not status_extension:is_disabled() and not status_extension:is_in_end_zone() then
						all_inside = false
					elseif all_inside == nil then
						all_inside = true
					end
				end
			end

			if all_inside and self:_check_joining_players() then
				self._state_data.end_zone_timer = math.clamp(self:end_time_left() - dt, 0, self:end_time())
			else
				self._state_data.end_zone_timer = self:end_time()
			end
		end
	else
		self._state = "_close"

		Unit.flow_event(self._unit, "closing_end_zone")
	end
end

EndZoneExtension._check_joining_players = function (self)
	if self._disable_check_joining_players then
		return true
	end

	local all_players_spawned = Managers.matchmaking:are_all_players_spawned()

	if not all_players_spawned then
		return false
	end

	return true
end

return
